package stu;

import DB.DBCon;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userName = request.getParameter("user_name");
        String comment = request.getParameter("comment");
        Part filePart = request.getPart("book_image");
        String imagePath = null;

        DBCon db = new DBCon();  // Assuming DBCon is set up to provide a DB connection

        // Handle file upload
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            imagePath = "uploads" + File.separator + fileName;  // Save relative path
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Insert data into database
        try (PrintWriter out = response.getWriter()) {
            db.pstmt = db.con.prepareStatement("INSERT INTO feedback (user_name, comment, image_path) VALUES (?, ?, ?)");
            db.pstmt.setString(1, userName);
            db.pstmt.setString(2, comment);
            db.pstmt.setString(3, imagePath);  // Save relative path

            int rowsInserted = db.pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Enhanced success message with HTML formatting
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Feedback Submitted Successfully</title>");
                out.println("<meta charset='UTF-8'>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css'>");
                out.println("<style>");
                out.println("body {");
                out.println("    font-family: 'Arial', sans-serif;");
                out.println("    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);");
                out.println("    margin: 0;");
                out.println("    padding: 20px;");
                out.println("    display: flex;");
                out.println("    justify-content: center;");
                out.println("    align-items: center;");
                out.println("    min-height: 100vh;");
                out.println("    color: #333;");
                out.println("}");
                out.println(".success-container {");
                out.println("    background: white;");
                out.println("    border-radius: 20px;");
                out.println("    padding: 40px;");
                out.println("    max-width: 600px;");
                out.println("    width: 100%;");
                out.println("    box-shadow: 0 10px 40px rgba(0,0,0,0.2);");
                out.println("    text-align: center;");
                out.println("    animation: fadeIn 0.5s ease-out;");
                out.println("}");
                out.println("@keyframes fadeIn {");
                out.println("    from { opacity: 0; transform: translateY(20px); }");
                out.println("    to { opacity: 1; transform: translateY(0); }");
                out.println("}");
                out.println(".success-icon {");
                out.println("    font-size: 60px;");
                out.println("    color: #27ae60;");
                out.println("    margin-bottom: 20px;");
                out.println("    animation: bounce 1s ease infinite;");
                out.println("}");
                out.println("@keyframes bounce {");
                out.println("    0%, 100% { transform: translateY(0); }");
                out.println("    50% { transform: translateY(-10px); }");
                out.println("}");
                out.println(".success-title {");
                out.println("    color: #2c3e50;");
                out.println("    font-size: 28px;");
                out.println("    margin-bottom: 15px;");
                out.println("    font-weight: bold;");
                out.println("}");
                out.println(".success-message {");
                out.println("    color: #7f8c8d;");
                out.println("    font-size: 18px;");
                out.println("    line-height: 1.6;");
                out.println("    margin-bottom: 25px;");
                out.println("}");
                out.println(".highlight {");
                out.println("    color: #3498db;");
                out.println("    font-weight: bold;");
                out.println("}");
                out.println(".details-box {");
                out.println("    background: #f8f9fa;");
                out.println("    border-radius: 10px;");
                out.println("    padding: 20px;");
                out.println("    margin: 20px 0;");
                out.println("    text-align: left;");
                out.println("}");
                out.println(".detail-item {");
                out.println("    margin-bottom: 10px;");
                out.println("    display: flex;");
                out.println("}");
                out.println(".detail-label {");
                out.println("    font-weight: 600;");
                out.println("    color: #2c3e50;");
                out.println("    min-width: 120px;");
                out.println("}");
                out.println(".detail-value {");
                out.println("    color: #7f8c8d;");
                out.println("}");
                out.println(".action-buttons {");
                out.println("    display: flex;");
                out.println("    justify-content: center;");
                out.println("    gap: 15px;");
                out.println("    margin-top: 30px;");
                out.println("}");
                out.println(".btn {");
                out.println("    padding: 12px 25px;");
                out.println("    border-radius: 8px;");
                out.println("    text-decoration: none;");
                out.println("    font-weight: 600;");
                out.println("    font-size: 16px;");
                out.println("    border: none;");
                out.println("    cursor: pointer;");
                out.println("    transition: all 0.3s ease;");
                out.println("    display: inline-flex;");
                out.println("    align-items: center;");
                out.println("    gap: 8px;");
                out.println("}");
                out.println(".btn-primary {");
                out.println("    background: linear-gradient(135deg, #3498db, #2ecc71);");
                out.println("    color: white;");
                out.println("}");
                out.println(".btn-secondary {");
                out.println("    background: #e9ecef;");
                out.println("    color: #495057;");
                out.println("    border: 2px solid #dee2e6;");
                out.println("}");
                out.println(".btn:hover {");
                out.println("    transform: translateY(-2px);");
                out.println("    box-shadow: 0 5px 15px rgba(0,0,0,0.1);");
                out.println("}");
                out.println(".timestamp {");
                out.println("    font-size: 14px;");
                out.println("    color: #95a5a6;");
                out.println("    margin-top: 20px;");
                out.println("    font-style: italic;");
                out.println("}");
                out.println(".confetti {");
                out.println("    position: absolute;");
                out.println("    width: 10px;");
                out.println("    height: 10px;");
                out.println("    background: #f39c12;");
                out.println("    border-radius: 50%;");
                out.println("    animation: fall linear forwards;");
                out.println("}");
                out.println("@keyframes fall {");
                out.println("    to { transform: translateY(100vh) rotate(360deg); opacity: 0; }");
                out.println("}");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='success-container'>");
                out.println("    <div class='success-icon'>");
                out.println("        <i class='fas fa-check-circle'></i>");
                out.println("    </div>");
                out.println("    <h1 class='success-title'>Feedback Submitted Successfully!</h1>");
                out.println("    <p class='success-message'>");
                out.println("        Thank you for submitting your feedback, <span class='highlight'>" + userName + "</span>!");
                out.println("        <br>Your valuable input helps us improve our library services for everyone.");
                out.println("    </p>");
                out.println("    <div class='details-box'>");
                out.println("        <div class='detail-item'>");
                out.println("            <span class='detail-label'>Status:</span>");
                out.println("            <span class='detail-value' style='color: #27ae60; font-weight: 600;'>✓ Successfully Submitted</span>");
                out.println("        </div>");
                out.println("        <div class='detail-item'>");
                out.println("            <span class='detail-label'>Submitted by:</span>");
                out.println("            <span class='detail-value'>" + userName + "</span>");
                out.println("        </div>");
                out.println("        <div class='detail-item'>");
                out.println("            <span class='detail-label'>Date & Time:</span>");
                out.println("            <span class='detail-value'>" + new java.util.Date() + "</span>");
                out.println("        </div>");
                out.println("        <div class='detail-item'>");
                out.println("            <span class='detail-label'>Reference ID:</span>");
                out.println("            <span class='detail-value'>FB-" + System.currentTimeMillis() + "</span>");
                out.println("        </div>");
                out.println("    </div>");
                out.println("    <div class='action-buttons'>");
                out.println("        <button class='btn btn-primary' onclick=\"window.location.href='index.html'\">");
                out.println("            <i class='fas fa-home'></i> Return to Home");
                out.println("        </button>");
                out.println("        <button class='btn btn-secondary' onclick=\"window.location.href='feedback.html'\">");
                out.println("            <i class='fas fa-plus'></i> Submit Another");
                out.println("        </button>");
                out.println("    </div>");
                out.println("    <p class='timestamp'>Your feedback has been recorded and will be reviewed by our team.</p>");
                out.println("</div>");
                out.println("<script>");
                out.println("// Auto-redirect after 8 seconds");
                out.println("setTimeout(function() {");
                out.println("    window.location.href = 'index.html';");
                out.println("}, 8000);");
                out.println("");
                out.println("// Create confetti effect");
                out.println("function createConfetti() {");
                out.println("    const colors = ['#27ae60', '#3498db', '#e74c3c', '#f39c12', '#9b59b6'];");
                out.println("    for(let i = 0; i < 50; i++) {");
                out.println("        const confetti = document.createElement('div');");
                out.println("        confetti.className = 'confetti';");
                out.println("        confetti.style.left = Math.random() * 100 + 'vw';");
                out.println("        confetti.style.background = colors[Math.floor(Math.random() * colors.length)];");
                out.println("        confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';");
                out.println("        confetti.style.opacity = Math.random();");
                out.println("        document.body.appendChild(confetti);");
                out.println("        setTimeout(() => confetti.remove(), 5000);");
                out.println("    }");
                out.println("}");
                out.println("");
                out.println("// Trigger confetti");
                out.println("createConfetti();");
                out.println("setTimeout(createConfetti, 300);");
                out.println("setTimeout(createConfetti, 600);");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error</title>");
                out.println("<meta charset='UTF-8'>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css'>");
                out.println("<style>");
                out.println("body { font-family: Arial, sans-serif; background: #f8f9fa; margin: 0; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }");
                out.println(".error-container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); text-align: center; max-width: 500px; width: 100%; }");
                out.println(".error-icon { color: #e74c3c; font-size: 50px; margin-bottom: 20px; }");
                out.println("h1 { color: #2c3e50; margin-bottom: 15px; }");
                out.println("p { color: #7f8c8d; margin-bottom: 25px; }");
                out.println(".btn { background: #3498db; color: white; padding: 10px 20px; border: none; border-radius: 5px; text-decoration: none; cursor: pointer; }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='error-container'>");
                out.println("    <div class='error-icon'><i class='fas fa-exclamation-triangle'></i></div>");
                out.println("    <h1>Error in Submitting Feedback</h1>");
                out.println("    <p>We encountered an issue while processing your feedback. Please try again.</p>");
                out.println("    <button class='btn' onclick='window.history.back()'>Go Back</button>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<!DOCTYPE html>");
            response.getWriter().println("<html>");
            response.getWriter().println("<head>");
            response.getWriter().println("<title>Error</title>");
            response.getWriter().println("<meta charset='UTF-8'>");
            response.getWriter().println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            response.getWriter().println("<style>");
            response.getWriter().println("body { font-family: Arial, sans-serif; background: #f8f9fa; margin: 0; padding: 20px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }");
            response.getWriter().println(".error-container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); text-align: center; max-width: 500px; width: 100%; }");
            response.getWriter().println("h1 { color: #2c3e50; margin-bottom: 15px; }");
            response.getWriter().println("p { color: #7f8c8d; margin-bottom: 25px; }");
            response.getWriter().println("</style>");
            response.getWriter().println("</head>");
            response.getWriter().println("<body>");
            response.getWriter().println("<div class='error-container'>");
            response.getWriter().println("    <h1>System Error</h1>");
            response.getWriter().println("    <p>An unexpected error occurred while submitting your feedback. Our technical team has been notified.</p>");
            response.getWriter().println("    <button onclick='window.history.back()' style='background: #3498db; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;'>Go Back</button>");
            response.getWriter().println("</div>");
            response.getWriter().println("</body>");
            response.getWriter().println("</html>");
        }
    }
}