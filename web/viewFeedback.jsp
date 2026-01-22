<%@ page import="java.sql.*" %>
<%@ page import="DB.DBCon" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback</title>
</head>
<body>
    <h2>Feedback List</h2>
    <table border="1">
        <tr>
            <th>User Name</th>
            <th>Comment</th>
            <th>Image</th>
        </tr>
        <%
            DBCon db = new DBCon(); // Assuming DBCon is set up to provide a DB connection
            try {
                String query = "SELECT user_name, comment, image_path FROM feedback";
                db.pstmt = db.con.prepareStatement(query);
                ResultSet rs = db.pstmt.executeQuery();
                
                while (rs.next()) {
                    String userName = rs.getString("user_name");
                    String comment = rs.getString("comment");
                    String imagePath = rs.getString("image_path");
        %>
        <tr>
            <td><%= userName %></td>
            <td><%= comment %></td>
            <td>
                <%
                    if (imagePath != null && !imagePath.isEmpty()) {
                %>
                <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Book Image" width="100" />
                <%
                    } else {
                %>
                No image uploaded
                <%
                    }
                %>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                db.con.close(); // Close the database connection
            }
        %>
    </table>
</body>
</html>
