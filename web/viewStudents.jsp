<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div> 
    <center>
        <h2>Student List</h2>

        <table width="1200" cellpadding="10" cellspacing="0" border="1" bgcolor="lightblue">
            <tr style="background-color:dodgerblue;color:white;">
                <th>User ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Email</th>
                <th>Account Status</th>
                <th>Action</th>
            </tr> 
            <% 
                DBCon db = new DBCon();
                db.pstmt = db.con.prepareStatement("SELECT * FROM users WHERE role = 'student'");
                db.rst = db.pstmt.executeQuery();
                
                while (db.rst.next()) {
                    String userId = db.rst.getString("user_id");
                    String username = db.rst.getString("username");
                    String password = db.rst.getString("password");
                    String role = db.rst.getString("role");
                    String email = db.rst.getString("email");
                    int acStatus = db.rst.getInt("ac_status");

                    out.println("<tr><td>" + userId + "</td>"
                        + "<td>" + username + "</td>"
                        + "<td>" + password + "</td>"
                        + "<td>" + role + "</td>"
                        + "<td>" + email + "</td>");

                    // Display account status and action button
                    if (acStatus == 1) {
                        out.println("<td style='color:green;'>Active</td>"
                            + "<td><a href='BlockUnblock?email=" + email + "&status=0'><input type='button' style='color:white;background-color:red;width:120px;height:30px;' value='Block Account'></a></td>");
                    } else {
                        out.println("<td style='color:red;'>Blocked</td>"
                            + "<td><a href='BlockUnblock?email=" + email + "&status=1'><input type='button' style='color:white;background-color:green;width:120px;height:30px;' value='Activate Account'></a></td>");
                    }
                    out.println("</tr>");
                }
            %>
        </table> 
    </center>
</div>
