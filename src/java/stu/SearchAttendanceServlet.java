package stu;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAttendanceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String student_roll_number = request.getParameter("student_roll_number");
            String student_name = request.getParameter("student_name");

            DBCon db = new DBCon();
            
            // SQL query to search attendance records based on roll number and name
            db.pstmt = db.con.prepareStatement("SELECT * FROM attendance WHERE student_roll_number = ? AND student_name = ?");
            db.pstmt.setString(1, student_roll_number);
            db.pstmt.setString(2, student_name);

            ResultSet rs = db.pstmt.executeQuery();
            
            out.println("<html><head><title>Attendance Records</title></head><body>");
            out.println("<h1>Attendance Records for " + student_name + " (Roll No: " + student_roll_number + ")</h1>");
            
            if (rs.next()) {
                out.println("<table border='1'><tr><th>Attendance Date</th><th>Status</th></tr>");
                do {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("attendance_date") + "</td>");
                    out.println("<td>" + rs.getString("status") + "</td>");
                    out.println("</tr>");
                } while (rs.next());
                out.println("</table>");
            } else {
                out.println("<p>No attendance records found for the provided details.</p>");
            }
            
            out.println("<br><a href='search_attendance.jsp'>Search Again</a>");
            out.println("<br><a href='student_dashboard.jsp'>Back to Dashboard</a>");
            out.println("</body></html>");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while searching for attendance.");
            request.getRequestDispatcher("search_attendance.jsp").forward(request, response);
        }
    }
}
