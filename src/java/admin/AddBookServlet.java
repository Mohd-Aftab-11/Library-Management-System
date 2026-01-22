package admin;

import DB.DBCon;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddBookServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String book_id = request.getParameter("book_id");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String year_of_publication = request.getParameter("year_of_publication");
            String available_copies = request.getParameter("available_copies");

            // 📌 Image Upload
            Part filePart = request.getPart("book_image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // ✅ Upload Folder Set
            String uploadPath = getServletContext().getRealPath("") + File.separator + "book_images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // ✅ Store Relative Path
            String imgPath = "book_images/" + fileName;

            DBCon db = new DBCon();
            db.pstmt = db.con.prepareStatement("INSERT INTO books2 (book_id, title, author, publisher, year_of_publication, available_copies, img_path) VALUES (?, ?, ?, ?, ?, ?, ?)");
            db.pstmt.setString(1, book_id);
            db.pstmt.setString(2, title);
            db.pstmt.setString(3, author);
            db.pstmt.setString(4, publisher);
            db.pstmt.setInt(5, Integer.parseInt(year_of_publication));
            db.pstmt.setInt(6, Integer.parseInt(available_copies));
            db.pstmt.setString(7, imgPath);

            int i1 = db.pstmt.executeUpdate();
            if (i1 > 0) {
                response.sendRedirect("add_book.jsp?msg=success");
            } else {
                response.sendRedirect("add_book.jsp?msg=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_book.jsp?msg=error");
        }
    }
}
