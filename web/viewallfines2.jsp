<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBCon"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - View Fines</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Custom Styles */
        body {
            background-color: #f0f8ff; /* Light blue background color */
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #007bff; /* Bootstrap blue for header */
            color: #ffffff; /* White text */
            padding: 20px;
            text-align: center;
        }

        .fines-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
        }

        .footer {
            background-color: #007bff; /* Bootstrap blue for footer */
            color: #ffffff; /* White text */
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .btn-custom {
            background-color: #007bff; /* Custom blue button color */
            border: none;
            color: #ffffff;
        }

        .btn-custom:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }

        .error-message {
            color: #dc3545; /* Red for error messages */
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff; /* Blue header for table */
            color: #ffffff; /* White text for header */
        }

        .print-button {
            margin-top: 20px;
            background-color: #007bff;
            border: none;
            color: #ffffff;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
        }

        .print-button:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }

        .delete-button {
            background-color: #dc3545; /* Red button for delete */
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c82333; /* Darker red for hover */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>View All Fines</h1>
    </div>

    <div class="container fines-container">
        <h2>Fines Records</h2>
        
        <!-- Check if there is an error message -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <!-- Fines table -->
        <table>
            <thead>
                <tr>
                    <th>Fine ID</th>
                    <th>Book ID</th>
                    <th>Student Roll Number</th>
                    <th>Student Name</th>
                    <th>Student Department</th>
                    <th>Student Year</th>
                    <th>Fine Amount</th>
                    <th>Return Date</th>
                    <th>Action</th> <!-- Column for delete button -->
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        DBCon db = new DBCon();
                        String query = "SELECT fine_id, book_id, student_roll_number, student_name, student_department, student_year, fine_amount, return_date FROM fines";
                        db.pstmt = db.con.prepareStatement(query);
                        ResultSet rs = db.pstmt.executeQuery();
                        
                        while (rs.next()) {
                            String fineId = rs.getString("fine_id");
                            String bookId = rs.getString("book_id");
                            String rollNumber = rs.getString("student_roll_number");
                            String name = rs.getString("student_name");
                            String department = rs.getString("student_department");
                            String year = rs.getString("student_year");
                            int fineAmount = rs.getInt("fine_amount");
                            String returnDate = rs.getString("return_date");
                %>
                <tr>
                    <td><%= fineId %></td>
                    <td><%= bookId %></td>
                    <td><%= rollNumber %></td>
                    <td><%= name %></td>
                    <td><%= department %></td>
                    <td><%= year %></td>
                    <td><%= fineAmount %></td>
                    <td><%= returnDate %></td>
                    <td>
                        <form action="DeleteFineServlet" method="POST" onsubmit="return confirm('Are you sure you want to delete this fine?');">
                            <input type="hidden" name="fineId" value="<%= fineId %>">
                            <button type="submit" class="delete-button">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                        rs.close();
                        db.con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                }
                %>
            </tbody>
        </table>
        
        <button class="print-button" onclick="window.print()">Print</button>

        <br>
        <p><a href="librarian_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a></p>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved.</p>
    </div>
</body>
</html>
