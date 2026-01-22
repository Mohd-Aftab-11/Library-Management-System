package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IssueBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String student_name = request.getParameter("student_name");
        int book_id = Integer.parseInt(request.getParameter("book_id")); // Convert book_id to integer
        String student_department = request.getParameter("student_department");
        String student_year = request.getParameter("student_year");
        String student_roll_number = request.getParameter("student_roll_number");
        String issue_date = request.getParameter("issue_date");

        try (PrintWriter out = response.getWriter()) {
            DBCon db = new DBCon();

            // Step 1: Validate if the book_id exists in the 'books' table
            db.pstmt = db.con.prepareStatement(
                "SELECT * FROM books2 WHERE book_id = ?");
            db.pstmt.setInt(1, book_id);
            ResultSet rsBook = db.pstmt.executeQuery();

            if (!rsBook.next()) {
                // If the book_id is not found, show an error message
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Book ID.');");
                out.println("location='issue_book.jsp';");
                out.println("</script>");
                return; // Stop further execution
            }

            // Step 2: Check if the book is already issued
            db.pstmt = db.con.prepareStatement(
                "SELECT status FROM issue WHERE book_id = ? AND status = 'book issued'");
            db.pstmt.setInt(1, book_id);
            ResultSet rs = db.pstmt.executeQuery();

            if (rs.next()) {
                // If the book is already issued, show a message
                out.println("<script type=\"text/javascript\">");
                out.println("alert('This book is already issued.');");
                out.println("location='issue_book.jsp';");
                out.println("</script>");
            } else {
                // Step 3: Check if the book was previously returned
                db.pstmt = db.con.prepareStatement(
                    "SELECT status FROM issue WHERE book_id = ? AND student_roll_number = ? AND status = 'book returned'");
                db.pstmt.setInt(1, book_id);
                db.pstmt.setString(2, student_roll_number);
                ResultSet rs2 = db.pstmt.executeQuery();

                if (rs2.next()) {
                    // Update the status to 'book issued'
                    db.pstmt = db.con.prepareStatement(
                        "UPDATE issue SET status = 'book issued', issue_date = ? WHERE book_id = ? AND student_roll_number = ?");
                    db.pstmt.setString(1, issue_date);
                    db.pstmt.setInt(2, book_id);
                    db.pstmt.setString(3, student_roll_number);

                    int updateStatus = db.pstmt.executeUpdate();
                    if (updateStatus > 0) {
                        response.sendRedirect("librarian_dashboard.jsp?msg=Book issued successfully");
                    } else {
                        request.setAttribute("error", "Failed to issue book.");
                        request.getRequestDispatcher("issue_book.jsp").forward(request, response);
                    }
                } else {
                    // Insert a new record if the book has never been issued or returned
                    db.pstmt = db.con.prepareStatement(
                        "INSERT INTO issue (book_id, student_name, student_department, student_year, student_roll_number, issue_date, status) VALUES (?, ?, ?, ?, ?, ?, 'book issued')");
                    db.pstmt.setInt(1, book_id);
                    db.pstmt.setString(2, student_name);
                    db.pstmt.setString(3, student_department);
                    db.pstmt.setString(4, student_year);
                    db.pstmt.setString(5, student_roll_number);
                    db.pstmt.setString(6, issue_date);

                    int i1 = db.pstmt.executeUpdate();
                    if (i1 > 0) {
                        response.sendRedirect("librarian_dashboard.jsp?msg=BookIssuedSuccessfully");
                    } else {
                        request.setAttribute("error", "Failed to issue book.");
                        request.getRequestDispatcher("issue_book.jsp").forward(request, response);
                    }
                }
            }

            // Close resources
            db.pstmt.close();
            db.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
