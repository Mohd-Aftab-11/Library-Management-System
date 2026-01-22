package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.DBCon;

public class SearchBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String bookTitle = request.getParameter("book_title");

        if (bookTitle == null || bookTitle.trim().isEmpty()) {
            response.sendRedirect("searchbook.jsp?message=Please enter a book title!");
            return;
        }

        try {
            DBCon db = new DBCon();
            String query = "SELECT b.book_id, b.title, b.author, b.publisher, b.year_of_publication, b.available_copies, b.img_path, " +
                           "(SELECT status FROM issue WHERE book_id = b.book_id ORDER BY issue_date DESC LIMIT 1) AS status " +
                           "FROM books2 b WHERE b.title = ?";

            db.pstmt = db.con.prepareStatement(query);
            db.pstmt.setString(1, bookTitle);
            ResultSet rs = db.pstmt.executeQuery();

            out.println("<!DOCTYPE html><html><head>");
            out.println("<title>Book Search Results</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("<style>body { background-color: #f8f9fa; } .container { margin-top: 30px; } th { background-color: #007bff; color: white; }</style>");
            out.println("</head><body>");
            out.println("<div class='container'><h2 class='text-center'>Book Search Results</h2>");

            if (!rs.next()) {
                out.println("<div class='alert alert-danger text-center'>No books found for the given title!</div>");
            } else {
                out.println("<table class='table table-bordered'><thead><tr>");
                out.println("<th>Book ID</th><th>Title</th><th>Author</th><th>Publisher</th><th>Year</th><th>Copies</th><th>Status</th><th>Image</th>");
                out.println("</tr></thead><tbody>");

                do {
                    String status = rs.getString("status");
                    if (status == null) status = "Available";

                    // ✅ Image Path Fix
                    String imgPath = rs.getString("img_path"); 
                    if (imgPath == null || imgPath.trim().isEmpty()) {
                        imgPath = "book_images/default.jpg"; // Default image
                    } else {
                        imgPath = imgPath.replace("\\", "/"); // Fix Windows path issue
                    }

                    // ✅ Correct Image URL
                    String imageURL = request.getContextPath() + "/" + imgPath;

                    out.println("<tr>");
                    out.println("<td>" + rs.getString("book_id") + "</td>");
                    out.println("<td>" + rs.getString("title") + "</td>");
                    out.println("<td>" + rs.getString("author") + "</td>");
                    out.println("<td>" + rs.getString("publisher") + "</td>");
                    out.println("<td>" + rs.getString("year_of_publication") + "</td>");
                    out.println("<td>" + rs.getInt("available_copies") + "</td>");
                    out.println("<td>" + status + "</td>");
                    out.println("<td>");
                    
                    // ✅ Image Fix - Remove "Book Image" text
                    out.println("<img src='" + imageURL + "' style='width: 120px; height: auto;' onerror=\"this.onerror=null;this.src='book_images/default.jpg';\">");
                    
                    out.println("</td>");
                    out.println("</tr>");
                } while (rs.next());

                out.println("</tbody></table>");
            }

            out.println("<div class='text-center mt-4'><a href='searchbook.jsp' class='btn btn-primary'>Back to Search</a></div>");
            out.println("</div></body></html>");

        } catch (Exception e) {
            response.sendRedirect("searchbook.jsp?message=Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
