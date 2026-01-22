package login;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            DBCon db = new DBCon();
            db.pstmt = db.con.prepareStatement("SELECT ac_status FROM users WHERE username = ? AND password = ? AND role = ?");
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, password);
            db.pstmt.setString(3, role);

            db.rst = db.pstmt.executeQuery();

            if (db.rst.next()) {
                int accountStatus = db.rst.getInt("ac_status");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("Student".equalsIgnoreCase(role)) {
                    // Check account status only for Student role
                    if (accountStatus == 1) {  // Account is active
                        response.sendRedirect("student_dashboard.jsp");
                    } else {
                        out.println("<h1>Account has been blocked</h1>");
                    }
                } else if ("Librarian".equalsIgnoreCase(role)) {
                    // No account status check for Librarian role
                    response.sendRedirect("librarian_dashboard.jsp");
                }
            } else {
                // Invalid login credentials
                out.println("<h1>Incorrect username, password, or role</h1>");
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
