package login;
import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class ForgotPasswordServlet21 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String userPassword = null;
        DBCon db = new DBCon();

        try (PrintWriter out = response.getWriter()) {
            // SQL query to find the user based on username and email
            db.pstmt = db.con.prepareStatement("SELECT password FROM users WHERE username = ? AND email = ?");
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, email);
            ResultSet rs = db.pstmt.executeQuery();

            if (rs.next()) {
                // User found; retrieve the password and send the email
                userPassword = rs.getString("password");
                sendEmail(email, userPassword);
                out.println("Password has been sent to your email.");
            } else {
                // User not found; display an error message
                out.println("Invalid username or email. Make sure your email matches your registered email.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred. Please try again.");
        }
    }

    private void sendEmail(String to, String password) {
        final String from = "ma.aftab2003@gmail.com"; // Your Gmail address
        final String passwordEmail = "fpnb xbwc afjw teow"; // App-specific password for Gmail

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, passwordEmail);
            }
        });

        try {
            // Create and send the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Your Password");
            message.setText("Your Library Management System password is: " + password);
            Transport.send(message);

            System.out.println("Email successfully sent to: " + to);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send email to " + to + ": " + e.getMessage());
        }
    }
}
