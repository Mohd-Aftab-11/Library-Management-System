package admin;

import DB.DBCon;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReturnBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String book_id = request.getParameter("book_id");
            String student_roll_number = request.getParameter("student_roll_number");
            String clearFine = request.getParameter("clear_fine"); // Null if not checked

            DBCon db = new DBCon();

            // Fetch book details and issue date
            db.pstmt = db.con.prepareStatement(
                    "SELECT * FROM issue WHERE book_id = ? AND student_roll_number = ? AND status = 'book issued'");
            db.pstmt.setString(1, book_id);
            db.pstmt.setString(2, student_roll_number);

            ResultSet issueResult = db.pstmt.executeQuery();

            if (issueResult.next()) {
                String issue_date_str = issueResult.getString("issue_date");
                String student_name = issueResult.getString("student_name");
                String student_department = issueResult.getString("student_department");
                String student_year = issueResult.getString("student_year");

                // Parse issue_date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date issue_date = sdf.parse(issue_date_str);
                Date return_date = new Date();

                // Calculate fine
                long diffInMillies = return_date.getTime() - issue_date.getTime();
                long daysDifference = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

                int fineAmount = 0;
                if (daysDifference > 7) {
                    fineAmount = (int) ((daysDifference - 7) * 10); // Rs. 10 per day after 7 days
                }

                // If fine exists and librarian has NOT cleared it, save fine in fines table
                if (fineAmount > 0 && clearFine == null) {
                    db.pstmt = db.con.prepareStatement(
                            "INSERT INTO fines (book_id, student_roll_number, student_name, student_department, student_year, fine_amount, return_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
                    db.pstmt.setString(1, book_id);
                    db.pstmt.setString(2, student_roll_number);
                    db.pstmt.setString(3, student_name);
                    db.pstmt.setString(4, student_department);
                    db.pstmt.setString(5, student_year);
                    db.pstmt.setInt(6, fineAmount);
                    db.pstmt.setString(7, sdf.format(return_date));

                    db.pstmt.executeUpdate();
                }

                // Insert into returns table
                db.pstmt = db.con.prepareStatement(
                        "INSERT INTO returns2 (book_id, student_roll_number, return_date, status) VALUES (?, ?, ?, 'book returned')");
                db.pstmt.setString(1, book_id);
                db.pstmt.setString(2, student_roll_number);
                db.pstmt.setString(3, sdf.format(return_date));

                int rowsAffected = db.pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Update issue table status
                    db.pstmt = db.con.prepareStatement(
                            "UPDATE issue SET status = 'book returned' WHERE book_id = ? AND student_roll_number = ? AND status = 'book issued'");
                    db.pstmt.setString(1, book_id);
                    db.pstmt.setString(2, student_roll_number);

                    db.pstmt.executeUpdate();

                    if (fineAmount > 0) {
                        if (clearFine != null) {
                            request.setAttribute("success", "Book returned successfully. Fine was cleared.");
                        } else {
                            request.setAttribute("success", "Book returned successfully. Fine: Rs. " + fineAmount);
                        }
                    } else {
                        request.setAttribute("success", "Book returned successfully. No fine.");
                    }
                } else {
                    request.setAttribute("error", "Failed to return book.");
                }

                // Send fineAmount to JSP for display
                request.setAttribute("fineAmount", fineAmount);
            } else {
                request.setAttribute("error", "Invalid Book ID or Student Roll Number, or book is not issued.");
            }

            request.getRequestDispatcher("return_book.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("return_book.jsp").forward(request, response);
        }
    }
}
