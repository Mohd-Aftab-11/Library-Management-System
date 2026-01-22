package admin;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.DBCon;

public class DeleteFineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fineId = request.getParameter("fineId");
        
        if (fineId != null && !fineId.isEmpty()) {
            try {
                DBCon db = new DBCon();
                String deleteQuery = "DELETE FROM fines WHERE fine_id = ?";
                PreparedStatement stmt = db.con.prepareStatement(deleteQuery);
                stmt.setString(1, fineId);
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("viewallfins.jsp"); // Redirect to the fines page after deletion
                } else {
                    request.setAttribute("error", "Failed to delete the fine.");
                    request.getRequestDispatcher("viewallfines.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred while deleting the fine.");
                request.getRequestDispatcher("viewallfines.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("viewallfines.jsp");
        }
    }
}
