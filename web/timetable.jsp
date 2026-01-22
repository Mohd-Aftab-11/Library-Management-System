<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Timetable</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .timetable-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .timetable-heading {
            text-align: center;
            color: #452066;
            margin-bottom: 20px;
        }
        .table thead th {
            background-color: #452066;
            color: white;
        }
    </style>
</head>
<body>

<div class="container timetable-container">
    <h2 class="timetable-heading">Library Timetable</h2>
    <p class="text-center">Here are the library opening hours and book-issuing days for each course.</p>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>Day</th>
            <th>Opening Time</th>
            <th>Closing Time</th>
            <th>Book Issuing (Course)</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Monday</td>
            <td>9:00 AM</td>
            <td>6:00 PM</td>
            <td>BCA</td>
        </tr>
        <tr>
            <td>Tuesday</td>
            <td>9:00 AM</td>
            <td>6:00 PM</td>
            <td>BCom</td>
        </tr>
        <tr>
            <td>Wednesday</td>
            <td>9:00 AM</td>
            <td>6:00 PM</td>
            <td>BSc</td>
        </tr>
        <tr>
            <td>Thursday</td>
            <td>9:00 AM</td>
            <td>6:00 PM</td>
            <td>BCA</td>
        </tr>
        <tr>
            <td>Friday</td>
            <td>9:00 AM</td>
            <td>6:00 PM</td>
            <td>BCom</td>
        </tr>
        <tr>
            <td>Saturday</td>
            <td>10:00 AM</td>
            <td>4:00 PM</td>
            <td>BSc</td>
        </tr>
        <tr>
            <td>Sunday</td>
            <td>Closed</td>
            <td>Closed</td>
            <td>Closed</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
