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
                out.println("Thank You for Submit Your feedback!");
            } else {
                out.println("Error in submitting feedback.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while submitting feedback.");
        }
    }
}
