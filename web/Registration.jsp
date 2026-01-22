<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Library Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .registration-container {
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: peru;
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        .form-control {
            border-radius: 5px;
        }

        #role {
            border-radius: 5px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 8px;
        }

        .btn-submit {
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #228b22;
        }

        .btn-back {
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container registration-container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Registration
                    </div>
                    <div class="card-body">
                        <form action="RegistrationConf1" method="post">
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                            </div>
                            <div class="form-group">
                                <label for="role">Role:</label>
                                <select id="role" name="role" class="form-control" required>
                                    <option value="Librarian">Librarian</option>
                                    <option value="Student">Student</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                            </div>
                            <button type="submit" class="btn btn-submit btn-block">Submit</button>
                        </form>
                        <div class="text-center mt-3">
                            <a href="index.html" class="btn btn-secondary btn-back">Back to Login Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
