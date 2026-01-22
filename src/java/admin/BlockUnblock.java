/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;

import DB.DBCon;
import java.io.IOException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BlockUnblock extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        int status = Integer.parseInt(request.getParameter("status")); // 1 for active, 0 for block

        DBCon db = new DBCon();
        try {
            // Update the account status in the users table
             db.pstmt=db.con.prepareStatement("UPDATE users SET ac_status = ? WHERE email = ?");
            db.pstmt.setInt(1, status);
            db.pstmt.setString(2, email);
            int rowsUpdated = db.pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("viewStudents.jsp"); // Redirect to the student list page after update
            } else {
                response.getWriter().println("Error updating account status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while updating account status.");
        }
    }
}
