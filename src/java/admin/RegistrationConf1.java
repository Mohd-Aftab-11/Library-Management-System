package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegistrationConf1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        DBCon db = new DBCon();

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            db.pstmt = db.con.prepareStatement("INSERT INTO users (username, password, role, email) VALUES (?, ?, ?, ?)");
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, password);
            db.pstmt.setString(3, role);
            db.pstmt.setString(4, email);

            int rowsInserted = db.pstmt.executeUpdate();

            // HTML structure with modal for success or error message
            out.println("<html><head>");
            out.println("<style>");
            out.println(".modal { display: block; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); }");
            out.println(".modal-content { background-color: #333; color: #fff; padding: 20px; border-radius: 8px; max-width: 400px; margin: 50px auto; text-align: center; }");
            out.println(".close-btn { color: white; font-size: 18px; float: right; cursor: pointer; }");
            out.println("</style></head><body>");

            if (rowsInserted > 0) {
                out.println("<div class='modal'><div class='modal-content'>");
                out.println("<span class='close-btn' onclick='closeModal()'>&times;</span>");
                out.println("<h4>User Registered successfully!</h4>");
                out.println("</div></div>");
            } else {
                out.println("<div class='modal'><div class='modal-content'>");
                out.println("<span class='close-btn' onclick='closeModal()'>&times;</span>");
                out.println("<h4>Error in registration. Please try again.</h4>");
                out.println("</div></div>");
            }

            out.println("<script>");
            out.println("function closeModal() { document.querySelector('.modal').style.display = 'none'; window.location.href = 'Registration.jsp'; }");
            out.println("</script>");
            out.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
