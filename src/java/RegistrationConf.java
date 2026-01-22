import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegistrationConf extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
                 DBCon db=new DBCon();

        // Database connection and insertion
        try (PrintWriter out = response.getWriter()) { // Assuming DBConnection is your utility class
            db.pstmt=db.con.prepareStatement("INSERT INTO user (username, user_password, role, email) VALUES (?, ?, ?, ?)");
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, password);  // Storing password directly without hashing
            db.pstmt.setString(3, role);
            db.pstmt.setString(4, email);

            int rowsInserted = db.pstmt.executeUpdate();

            // Get writer to send response
            if (rowsInserted > 0) {
                out.println("User registered successfully!");
            } else {
                out.println("Error in registration.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
