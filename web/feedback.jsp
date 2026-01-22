<!DOCTYPE html>
<html>
<head>
    <title>Feedback Form</title>
    
</head>  
<body>
    <h2>Feedback Form</h2>
    <form action="FeedbackServlet" method="post" enctype="multipart/form-data">
        Name: <input type="text" name="user_name" required><br><br>
        Comment: <textarea name="comment" rows="4" cols="50" required></textarea><br><br>
        Book Image: <input type="file" name="book_image" accept="image/*"><br><br>
        <input type="submit" value="Submit Feedback">
    </form>
   
</body>
</html>
