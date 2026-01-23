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

            // HTML structure with enhanced modal matching the registration page UI
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<link rel=\"Shortcut Icon\" type=\"image/ico\" href=\"favicon.ico\">");
            out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<title>Registration Status - Library Management System</title>");
            
            // Bootstrap CSS
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            
            // FontAwesome
            out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css\">");
            
            // Google Fonts
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto+Slab:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">");
            
            out.println("<style>");
            out.println(":root {");
            out.println("    --primary-color: #2c3e50;");
            out.println("    --secondary-color: #3498db;");
            out.println("    --accent-color: #e74c3c;");
            out.println("    --success-color: #27ae60;");
            out.println("    --light-color: #f8f9fa;");
            out.println("    --dark-color: #2c3e50;");
            out.println("    --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);");
            out.println("    --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);");
            out.println("    --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);");
            out.println("    --gradient-success: linear-gradient(135deg, #27ae60, #2ecc71);");
            out.println("    --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);");
            out.println("    --shadow-hover: 0 10px 30px rgba(0, 0, 0, 0.2);");
            out.println("    --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);");
            out.println("}");
            out.println("* { margin: 0; padding: 0; box-sizing: border-box; }");
            out.println("body {");
            out.println("    font-family: 'Poppins', sans-serif;");
            out.println("    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);");
            out.println("    color: #333;");
            out.println("    line-height: 1.6;");
            out.println("    overflow-x: hidden;");
            out.println("    min-height: 100vh;");
            out.println("    display: flex;");
            out.println("    align-items: center;");
            out.println("    justify-content: center;");
            out.println("    padding: 20px;");
            out.println("}");
            out.println(".modal-overlay {");
            out.println("    position: fixed;");
            out.println("    top: 0;");
            out.println("    left: 0;");
            out.println("    width: 100%;");
            out.println("    height: 100%;");
            out.println("    background: rgba(0, 0, 0, 0.8);");
            out.println("    display: flex;");
            out.println("    align-items: center;");
            out.println("    justify-content: center;");
            out.println("    z-index: 1000;");
            out.println("    animation: fadeIn 0.3s ease-out;");
            out.println("}");
            out.println("@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }");
            out.println(".modal-card {");
            out.println("    background: white;");
            out.println("    border-radius: 20px;");
            out.println("    box-shadow: var(--shadow-hover);");
            out.println("    width: 90%;");
            out.println("    max-width: 450px;");
            out.println("    overflow: hidden;");
            out.println("    animation: slideUp 0.4s ease-out;");
            out.println("}");
            out.println("@keyframes slideUp { from { transform: translateY(30px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }");
            out.println(".modal-header {");
            out.println("    background: " + (rowsInserted > 0 ? "var(--gradient-success)" : "var(--gradient-accent)") + ";");
            out.println("    color: white;");
            out.println("    padding: 1.5rem;");
            out.println("    text-align: center;");
            out.println("    border-bottom: 3px solid " + (rowsInserted > 0 ? "#27ae60" : "#e74c3c") + ";");
            out.println("}");
            out.println(".modal-icon {");
            out.println("    font-size: 3rem;");
            out.println("    margin-bottom: 1rem;");
            out.println("}");
            out.println(".modal-header h3 {");
            out.println("    font-family: 'Roboto Slab', serif;");
            out.println("    font-weight: 700;");
            out.println("    margin: 0;");
            out.println("    font-size: 1.5rem;");
            out.println("}");
            out.println(".modal-body {");
            out.println("    padding: 2rem;");
            out.println("    text-align: center;");
            out.println("}");
            out.println(".user-info {");
            out.println("    background: #f8f9fa;");
            out.println("    border-radius: 10px;");
            out.println("    padding: 1rem;");
            out.println("    margin: 1.5rem 0;");
            out.println("}");
            out.println(".info-item {");
            out.println("    display: flex;");
            out.println("    align-items: center;");
            out.println("    margin-bottom: 0.8rem;");
            out.println("    justify-content: flex-start;");
            out.println("}");
            out.println(".info-item:last-child { margin-bottom: 0; }");
            out.println(".info-icon {");
            out.println("    color: var(--secondary-color);");
            out.println("    margin-right: 10px;");
            out.println("    font-size: 1rem;");
            out.println("}");
            out.println(".info-label {");
            out.println("    font-weight: 600;");
            out.println("    color: var(--primary-color);");
            out.println("    min-width: 100px;");
            out.println("    text-align: right;");
            out.println("}");
            out.println(".info-value {");
            out.println("    color: #555;");
            out.println("    font-weight: 500;");
            out.println("}");
            out.println(".message {");
            out.println("    color: #555;");
            out.println("    line-height: 1.6;");
            out.println("    margin-bottom: 2rem;");
            out.println("}");
            out.println(".btn-group {");
            out.println("    display: flex;");
            out.println("    gap: 1rem;");
            out.println("    margin-top: 1.5rem;");
            out.println("}");
            out.println(".btn-modal {");
            out.println("    background: var(--gradient-secondary);");
            out.println("    color: white;");
            out.println("    border: none;");
            out.println("    padding: 0.8rem 1.5rem;");
            out.println("    border-radius: 25px;");
            out.println("    font-weight: 600;");
            out.println("    font-size: 1rem;");
            out.println("    transition: var(--transition);");
            out.println("    display: inline-flex;");
            out.println("    align-items: center;");
            out.println("    justify-content: center;");
            out.println("    gap: 0.5rem;");
            out.println("    flex: 1;");
            out.println("    cursor: pointer;");
            out.println("    text-decoration: none;");
            out.println("    text-align: center;");
            out.println("}");
            out.println(".btn-modal:hover {");
            out.println("    background: var(--gradient-primary);");
            out.println("    transform: translateY(-3px);");
            out.println("    box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);");
            out.println("}");
            out.println(".btn-success {");
            out.println("    background: var(--gradient-success);");
            out.println("}");
            out.println(".btn-success:hover {");
            out.println("    background: linear-gradient(135deg, #219653, #27ae60);");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class=\"modal-overlay\">");
            out.println("    <div class=\"modal-card\">");
            
            if (rowsInserted > 0) {
                out.println("        <div class=\"modal-header\">");
                out.println("            <div class=\"modal-icon\"><i class=\"fas fa-check-circle\"></i></div>");
                out.println("            <h3>Registration Successful!</h3>");
                out.println("        </div>");
                out.println("        <div class=\"modal-body\">");
                out.println("            <p class=\"message\">Congratulations! Your account has been created successfully. You can now login to access the library system.</p>");
                out.println("            <div class=\"user-info\">");
                out.println("                <div class=\"info-item\">");
                out.println("                    <span class=\"info-label\"><i class=\"fas fa-user info-icon\"></i> Username:</span>");
                out.println("                    <span class=\"info-value\">" + username + "</span>");
                out.println("                </div>");
                out.println("                <div class=\"info-item\">");
                out.println("                    <span class=\"info-label\"><i class=\"fas fa-envelope info-icon\"></i> Email:</span>");
                out.println("                    <span class=\"info-value\">" + email + "</span>");
                out.println("                </div>");
                out.println("                <div class=\"info-item\">");
                out.println("                    <span class=\"info-label\"><i class=\"fas fa-user-tag info-icon\"></i> Role:</span>");
                out.println("                    <span class=\"info-value\">" + role + "</span>");
                out.println("                </div>");
                out.println("            </div>");
                out.println("            <div class=\"btn-group\">");
                out.println("                <a href=\"login.jsp\" class=\"btn-modal btn-success\"><i class=\"fas fa-sign-in-alt\"></i> Go to Login</a>");
                out.println("                <a href=\"Registration.jsp\" class=\"btn-modal\"><i class=\"fas fa-user-plus\"></i> Register Another</a>");
                out.println("            </div>");
                out.println("        </div>");
            } else {
                out.println("        <div class=\"modal-header\">");
                out.println("            <div class=\"modal-icon\"><i class=\"fas fa-exclamation-triangle\"></i></div>");
                out.println("            <h3>Registration Failed</h3>");
                out.println("        </div>");
                out.println("        <div class=\"modal-body\">");
                out.println("            <p class=\"message\">Sorry! There was an error creating your account. This might be due to:</p>");
                out.println("            <ul style=\"text-align: left; color: #666; margin-bottom: 2rem;\">");
                out.println("                <li>Duplicate username or email</li>");
                out.println("                <li>Database connection issue</li>");
                out.println("                <li>Invalid input data</li>");
                out.println("            </ul>");
                out.println("            <div class=\"btn-group\">");
                out.println("                <button onclick=\"window.history.back()\" class=\"btn-modal\"><i class=\"fas fa-arrow-left\"></i> Try Again</button>");
                out.println("                <a href=\"Registration.jsp\" class=\"btn-modal\"><i class=\"fas fa-home\"></i> Back to Registration</a>");
                out.println("            </div>");
                out.println("        </div>");
            }
            
            out.println("    </div>");
            out.println("</div>");

            out.println("<script>");
            out.println("// Auto-redirect after 10 seconds for success");
            if (rowsInserted > 0) {
                out.println("setTimeout(function() {");
                out.println("    window.location.href = 'login.jsp';");
                out.println("}, 10000);");
            }
            out.println("// Close modal on overlay click");
            out.println("document.querySelector('.modal-overlay').addEventListener('click', function(e) {");
            out.println("    if (e.target === this) {");
            out.println("        " + (rowsInserted > 0 ? "window.location.href = 'login.jsp';" : "window.history.back();"));
            out.println("    }");
            out.println("});");
            out.println("</script>");
            
            // Bootstrap JS
            out.println("<script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js\"></script>");
            out.println("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>");
            
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            e.printStackTrace();
            
            // Error page with same UI
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html lang=\"en\">");
                out.println("<head><meta charset=\"UTF-8\"><title>Error</title>");
                out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
                out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css\">");
                out.println("<style>");
                out.println("body { background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%); font-family: 'Poppins', sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; padding: 20px; }");
                out.println(".error-card { background: white; border-radius: 20px; padding: 2rem; max-width: 500px; text-align: center; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }");
                out.println(".error-icon { color: #e74c3c; font-size: 3rem; margin-bottom: 1rem; }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class=\"error-card\">");
                out.println("<div class=\"error-icon\"><i class=\"fas fa-exclamation-triangle\"></i></div>");
                out.println("<h3 class=\"text-danger\">Server Error</h3>");
                out.println("<p>An unexpected error occurred: " + e.getMessage() + "</p>");
                out.println("<a href=\"Registration.jsp\" class=\"btn btn-primary mt-3\"><i class=\"fas fa-arrow-left\"></i> Back to Registration</a>");
                out.println("</div>");
                out.println("</body></html>");
            }
        }
    }
}