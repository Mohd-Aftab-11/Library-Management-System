<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - Issue Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
        }

        .header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .marquee {
            background: #eef1f7;
            padding: 10px;
            text-align: center;
            font-size: 16px;
            font-style: italic;
        }

        .issue-book-container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin: 40px auto;
            max-width: 500px;
            padding: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        .issue-book-container h2 {
            color: #2575fc;
            text-align: center;
        }

        .form-label {
            font-weight: bold;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary:hover {
            background-color: #1e63d0;
            transform: scale(1.05);
        }

        .footer {
            background-color: #222;
            color: #bbb;
            text-align: center;
            padding: 15px;
            margin-top: 20px;
        }

        .footer a {
            color: #6a11cb;
            text-decoration: none;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Issue a Book</h1>
    </div>

    <div class="marquee">
        <p>Welcome to LibraryPro! Easily issue books and explore new reads with a click.</p>
    </div>

    <div class="issue-book-container">
        <h2>Enter Book and Student Details</h2>
        <form action="IssueBookServlet" method="post">
            <div class="mb-3">
                <label for="student_name" class="form-label">Student Name:</label>
                <input type="text" id="student_name" name="student_name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="book_id" class="form-label">Book ID:</label>
                <input type="number" id="book_id" name="book_id" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="student_department" class="form-label">Student Department:</label>
                <input type="text" id="student_department" name="student_department" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="student_year" class="form-label">Student Year:</label>
                <input type="text" id="student_year" name="student_year" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="student_roll_number" class="form-label">Student Roll Number:</label>
                <input type="text" id="student_roll_number" name="student_roll_number" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="issue_date" class="form-label">Issue Date:</label>
                <input type="date" id="issue_date" name="issue_date" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Issue Book</button>
        </form>
        <p class="text-center mt-3">
            <a href="librarian_dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
        </p>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved. <a href="#">Privacy Policy</a></p>
    </div>
</body>
</html>
