package stu;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            // Retrieve form parameters
            String student_roll_number = request.getParameter("student_roll_number");
            String attendance_date = request.getParameter("attendance_date");
            String student_name = request.getParameter("student_name");
            String action = request.getParameter("action");

            DBCon db = new DBCon();
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());

            if ("check_in".equals(action)) {
                // Check if attendance record exists for today
                db.pstmt = db.con.prepareStatement("SELECT * FROM attendance WHERE student_roll_number = ? AND attendance_date = ?");
                db.pstmt.setString(1, student_roll_number);
                db.pstmt.setString(2, attendance_date);
                if (db.pstmt.executeQuery().next()) {
                    request.setAttribute("error", "Attendance already marked for today.");
                    request.getRequestDispatcher("attendance.jsp").forward(request, response);
                    return;
                }

                db.pstmt = db.con.prepareStatement("INSERT INTO attendance (student_roll_number, attendance_date, time_in, status, student_name) VALUES (?, ?, ?, ?, ?)");
                db.pstmt.setString(1, student_roll_number);
                db.pstmt.setString(2, attendance_date);
                db.pstmt.setTimestamp(3, currentTime);
                db.pstmt.setString(4, "Present"); // Assuming status is "Present"
                db.pstmt.setString(5, student_name);
            } else if ("check_out".equals(action)) {
                db.pstmt = db.con.prepareStatement("UPDATE attendance SET time_out = ? WHERE student_roll_number = ? AND attendance_date = ? AND time_out IS NULL");
                db.pstmt.setTimestamp(1, currentTime);
                db.pstmt.setString(2, student_roll_number);
                db.pstmt.setString(3, attendance_date);
            } else {
                throw new ServletException("Invalid action");
            }

            int rowsAffected = db.pstmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("attendance.jsp?msg=AddAttendancesuccsessfully");
            } else {
                request.setAttribute("error", "Failed to mark attendance.");
                request.getRequestDispatcher("attendance.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while marking attendance.");
            request.getRequestDispatcher("attendance.jsp").forward(request, response);
        } 
    }
}
