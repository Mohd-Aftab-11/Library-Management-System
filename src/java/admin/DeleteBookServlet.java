package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String bookId = request.getParameter("book_id");
            DBCon db = new DBCon();

            db.pstmt = db.con.prepareStatement("DELETE FROM books2 WHERE book_id = ?");

            db.pstmt.setString(1, bookId);

            int i = db.pstmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("librarian_dashboard.jsp?msg=DeletebookSuccesfully");
            } else {
                response.sendRedirect("librarian_dashboard.jsp?msg=book not deleted");

            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}