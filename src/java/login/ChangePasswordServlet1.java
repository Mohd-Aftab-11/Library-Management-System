package login;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePasswordServlet1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String oldPassword = request.getParameter("old_password");
            String newPassword = request.getParameter("new_password");
            String confirmPassword = request.getParameter("confirm_password");

            DBCon db = new DBCon();
            HttpSession session = request.getSession();

            if (newPassword.equals(confirmPassword)) {
                db.pstmt = db.con.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
                db.pstmt.setString(1, username);
                db.pstmt.setString(2, oldPassword);
                db.rst = db.pstmt.executeQuery();

                if (db.rst.next()) {
                    db.pstmt = db.con.prepareStatement("UPDATE users SET password = ? WHERE username = ?");
                    db.pstmt.setString(1, newPassword);
                    db.pstmt.setString(2, username);
                    int rowsUpdated = db.pstmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        session.setAttribute("message", "Password updated successfully.");
                        response.sendRedirect("index.html?msg=Password updated successfully");
                    } else {
                        response.sendRedirect("change_password.jsp?error=Failed to update password.");
                    }
                } else {
                    response.sendRedirect("change_password.jsp?error=Invalid username or old password.");
                }
            } else {
                response.sendRedirect("change_password.jsp?error=New and confirm passwords do not match.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("change_password.jsp?error=An error occurred while processing your request.");
        }
    }
}
