<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - Mark Attendance</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #452066;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin: 20px auto;
            width: 80%;
        }
        .form-container h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .footer {
            background-color: #452066;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Mark Your Attendance!</h1>
    </div>

    <div class="container">
        <div class="form-container">
            <form action="AttendanceServlet" method="post">
                <div class="form-group">
                    <label for="student_roll_number">Roll Number:</label>
                    <input type="text" id="student_roll_number" name="student_roll_number" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="attendance_date">Date:</label>
                    <input type="date" id="attendance_date" name="attendance_date" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="student_name">Student Name:</label>
                    <input type="text" id="student_name" name="student_name" class="form-control" required>
                </div>
                <div class="form-group">
                    <button type="submit" name="action" value="check_in" class="btn btn-primary">Check In</button>
                    <button type="submit" name="action" value="check_out" class="btn btn-secondary">Check Out</button>
                </div>
            </form>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
