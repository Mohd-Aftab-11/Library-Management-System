<%@ page import="java.sql.*" %>
<%@ page import="DB.DBCon" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<div>
    <center>
        <h2>Search Returned Books</h2>
        
        <!-- Search Form -->
        <form method="get" action="">
            <table>
                <tr>
                    <td>Book ID:</td>
                    <td><input type="text" name="bookId" placeholder="Enter Book ID"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Search" style="color:white;background-color:dodgerblue;width:120px;height:30px;">
                    </td>
                </tr>
            </table>
        </form>
        <br>

        <!-- Display Table -->
        <table width="800" cellpadding="10" cellspacing="0" border="1" bgcolor="lightblue">
            <tr style="background-color:dodgerblue;color:white;">
                <th>Book ID</th>
             
                <th>Student Roll Number</th>
                <th>Return Date</th>
                <th>Status</th>
            </tr>
            <%
                String bookId = request.getParameter("bookId");

                DBCon db = new DBCon();
                String query = "SELECT * FROM returns2 WHERE 1=1";

                // Add condition for book ID if provided
                if (bookId != null && !bookId.trim().isEmpty()) {
                    query += " AND book_id = ?";
                }

                try {
                    PreparedStatement pstmt = db.con.prepareStatement(query);
                    int paramIndex = 1;

                    // Set parameter for book ID if provided
                    if (bookId != null && !bookId.trim().isEmpty()) {
                        pstmt.setString(paramIndex++, bookId);
                    }

                    ResultSet rst = pstmt.executeQuery();

                    // Process and display the result
                    while (rst.next()) {
                        out.println("<tr>"
                                + "<td>" + rst.getString("book_id") + "</td>"
                                + "<td>" + rst.getString("student_roll_number") + "</td>"
                                + "<td>" + rst.getDate("return_date") + "</td>"
                                + "<td>" + rst.getString("status") + "</td>"
                                + "</tr>");
                    }

                    // If no records are found
                    if (!rst.isBeforeFirst()) {
                        out.println("<tr><td colspan='5' style='color:red;'>No returned books found.</td></tr>");
                    }

                    rst.close();
                    pstmt.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' style='color:red;'>Error fetching data: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
    </center>
</div>
