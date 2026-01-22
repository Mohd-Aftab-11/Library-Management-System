package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateBookServlet extends HttpServlet {
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String bookId = request.getParameter("book_id_search");
            DBCon db = new DBCon();

            db.pstmt = db.con.prepareStatement("SELECT * FROM books2 WHERE book_id = ?");
            db.pstmt.setString(1, bookId);
            db.rst = db.pstmt.executeQuery();
            
            if (db.rst.next()) {
                request.setAttribute("title", db.rst.getString("title"));
                request.setAttribute("author", db.rst.getString("author"));
                request.setAttribute("publisher", db.rst.getString("publisher"));
                request.setAttribute("year_of_publication", db.rst.getString("year_of_publication"));
                request.setAttribute("available_copies", db.rst.getString("available_copies"));
                request.getRequestDispatcher("update_book.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No book found with ID: " + bookId);
                request.getRequestDispatcher("update_book.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String bookId = request.getParameter("book_id");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String yearOfPublication = request.getParameter("year_of_publication");
            String availableCopies = request.getParameter("available_copies");

            DBCon db = new DBCon();
            db.pstmt = db.con.prepareStatement("UPDATE books2 SET title = ?, author = ?, publisher = ?, year_of_publication = ?, available_copies = ? WHERE book_id = ?");
            db.pstmt.setString(1, title);
            db.pstmt.setString(2, author);
            db.pstmt.setString(3, publisher);
            db.pstmt.setString(4, yearOfPublication);
            db.pstmt.setString(5, availableCopies);
            db.pstmt.setString(6, bookId);
            
            int rowsUpdated = db.pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<h3>Book updated successfully!</h3>");
                response.sendRedirect("librarian_dashboard.jsp?msg=updatedsuccessfully");
            } else {
                out.println("<h3>Error updating book. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
