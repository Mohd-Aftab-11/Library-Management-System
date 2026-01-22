<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.lang.Integer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Return Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .return-book-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #452066;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #452066;
            color: white;
            width: 100%;
        }

        .btn-custom:hover {
            background-color: #5a2c85;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        .success {
            color: green;
            font-weight: bold;
        }

        a {
            color: #2575fc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="return-book-card">
    <h2>Return Book</h2>

    <%
        String successMessage = (String) request.getAttribute("success");
        String errorMessage = (String) request.getAttribute("error");

        Integer fineAmountObj = (Integer) request.getAttribute("fineAmount");
        int fineAmount = (fineAmountObj != null) ? fineAmountObj : 0;
    %>

    <form action="ReturnBookServlet" method="post">
        <div class="mb-3">
            <label for="bookId" class="form-label">Book ID:</label>
            <input type="text" class="form-control" id="bookId" name="book_id" required>
        </div>

        <div class="mb-3">
            <label for="rollNo" class="form-label">Student Roll Number:</label>
            <input type="text" class="form-control" id="rollNo" name="student_roll_number" required>
        </div>

        <% if (fineAmount > 0) { %>
            <div class="mb-3">
                <p class="error">Fine: Rs. <%= fineAmount %></p>
                <input type="hidden" name="clear_fine" value="no">
                <label><a href="viewallfines2.jsp">Clear Fine</a></label>
            </div>
        <% } %>

        <div class="d-grid mt-4">
            <button type="submit" class="btn btn-custom">Return Book</button>
        </div>
    </form>

    <% if (successMessage != null) { %>
        <div class="mt-3 alert alert-success text-center">
            <%= successMessage %>
        </div>
    <% } %>

    <% if (errorMessage != null) { %>
        <div class="mt-3 alert alert-danger text-center">
            <%= errorMessage %>
        </div>
    <% } %>
</div>

</body>
</html>
