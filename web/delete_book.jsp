<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String role = (String) session.getAttribute("role");

    if (session == null || role == null) {
        response.sendRedirect("index.jsp"); // Redirect to login page if session is invalid
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - Delete Book</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to bottom, #f4f6f9, #dfe7ef); /* Gradient background */
            font-family: 'Arial', sans-serif;
        }

        .header {
            background: linear-gradient(to right, #0056b3, #003d7a); /* Gradient header */
            color: #ffffff;
            padding: 20px;
            text-align: center;
            border-bottom: 5px solid #00264d; /* Darker border */
        }

        .header h1 {
            font-size: 28px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Subtle text shadow */
        }

        .delete-book-container {
            background: #ffffff; /* White card */
            border-radius: 15px; /* Soft rounded corners */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* Elegant shadow */
            max-width: 500px;
            margin: 50px auto;
            padding: 40px 30px;
            text-align: center;
        }

        .delete-book-container h2 {
            font-size: 24px;
            color: #333333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .delete-book-container input[type="text"] {
            border: 2px solid #cccccc; /* Slightly bold border */
            border-radius: 10px;
            padding: 12px 15px;
            width: 85%;
            font-size: 16px;
            margin-bottom: 25px;
            transition: border-color 0.3s ease;
        }

        .delete-book-container input[type="text"]:focus {
            border-color: #0056b3; /* Focus border color */
            outline: none;
            box-shadow: 0 0 5px rgba(0, 86, 179, 0.5); /* Light glow effect */
        }

        .delete-book-container input[type="submit"] {
            background: linear-gradient(to right, #ff4d4d, #cc0000); /* Gradient button */
            border: none;
            color: #ffffff;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .delete-book-container input[type="submit"]:hover {
            transform: scale(1.05); /* Slight zoom effect */
            background-color: #b30000; /* Darker hover color */
        }

        .delete-book-container a {
            color: #0056b3;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .delete-book-container a:hover {
            color: #003d7a; /* Darker hover color */
            text-decoration: underline;
        }

        .footer {
            background: linear-gradient(to right, #0056b3, #003d7a); /* Matching gradient footer */
            color: #ffffff;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }

        .footer a {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #ffcccb; /* Light pink hover effect */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Delete a Book</h1>
    </div>

    <div class="delete-book-container">
        <h2>Enter Book ID to Delete</h2>
        <form action="DeleteBookServlet" method="post">
            <label for="book_id" class="visually-hidden">Book ID:</label>
            <input type="text" id="book_id" name="book_id" placeholder="Enter book ID" required>
            <input type="submit" value="Delete Book">
        </form>
        <br>
        <a href="librarian_dashboard.jsp" class="btn btn-link">Back to Dashboard</a>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved. | <a href="support.jsp">Support</a></p>
    </div>
</body>
</html>
