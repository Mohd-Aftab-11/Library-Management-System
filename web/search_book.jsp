<%@ page import="java.sql.*, DB.DBCon" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("role") == null) {
        response.sendRedirect("index.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 800px; margin-top: 50px; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; margin-bottom: 20px; }
        .btn-search { width: 100%; }
        table { margin-top: 20px; }
        th { background-color: #007bff; color: white; }
        img { width: 80px; height: auto; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search for a Book</h2>
        <form action="SearchBookServlet" method="post">
            <div class="mb-3">
                <input type="text" name="book_title" class="form-control" placeholder="Enter Book Title" required>
            </div>
            <button type="submit" class="btn btn-primary btn-search">Search Book</button>
        </form>

        <%
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <div class="alert alert-warning mt-3"><%= message %></div>
        <% } %>
    </div>
</body>
</html>
