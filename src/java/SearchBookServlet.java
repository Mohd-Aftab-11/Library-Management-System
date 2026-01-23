package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DB.DBCon;

public class SearchBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String bookTitle = request.getParameter("book_title");
        
        // Get user session and role for navigation
        HttpSession session = request.getSession(false);
        String role = (session != null) ? (String) session.getAttribute("role") : null;
        boolean isLibrarian = "Librarian".equals(role);

        if (bookTitle == null || bookTitle.trim().isEmpty()) {
            response.sendRedirect("search_book.jsp?message=Please enter a book title!");
            return;
        }

        try {
            DBCon db = new DBCon();
            String query = "SELECT b.book_id, b.title, b.author, b.publisher, b.year_of_publication, " +
                           "b.available_copies, b.img_path, " +
                           "(SELECT status FROM issue WHERE book_id = b.book_id ORDER BY issue_date DESC LIMIT 1) AS status " +
                           "FROM books2 b WHERE LOWER(b.title) LIKE LOWER(?)";

            db.pstmt = db.con.prepareStatement(query);
            db.pstmt.setString(1, "%" + bookTitle + "%");
            ResultSet rs = db.pstmt.executeQuery();

            // Start HTML output with enhanced design
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("    <meta charset=\"UTF-8\">");
            out.println("    <link rel=\"Shortcut Icon\" type=\"image/ico\" href=\"favicon.ico\">");
            out.println("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
            out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("    <title>Search Results - Library Management System</title>");
            
            // Bootstrap CSS
            out.println("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            
            // FontAwesome
            out.println("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css\">");
            
            // Google Fonts
            out.println("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto+Slab:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">");
            
            // Enhanced CSS
            out.println("    <style>");
            out.println("        :root {");
            out.println("            --primary-color: #2c3e50;");
            out.println("            --secondary-color: #3498db;");
            out.println("            --accent-color: #e74c3c;");
            out.println("            --success-color: #27ae60;");
            out.println("            --warning-color: #f39c12;");
            out.println("            --light-color: #f8f9fa;");
            out.println("            --dark-color: #2c3e50;");
            out.println("            --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);");
            out.println("            --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);");
            out.println("            --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);");
            out.println("            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);");
            out.println("            --shadow-hover: 0 10px 30px rgba(0, 0, 0, 0.2);");
            out.println("            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);");
            out.println("        }");
            out.println("        * { margin: 0; padding: 0; box-sizing: border-box; }");
            out.println("        body {");
            out.println("            font-family: 'Poppins', sans-serif;");
            out.println("            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);");
            out.println("            color: #333;");
            out.println("            line-height: 1.6;");
            out.println("            min-height: 100vh;");
            out.println("        }");
            out.println("        .content-container {");
            out.println("            padding: 2rem 1rem;");
            out.println("            margin-top: 30px;");
            out.println("            max-width: 1400px;");
            out.println("            margin-left: auto;");
            out.println("            margin-right: auto;");
            out.println("        }");
            out.println("        .results-container {");
            out.println("            background: white;");
            out.println("            padding: 2rem;");
            out.println("            border-radius: 20px;");
            out.println("            box-shadow: var(--shadow);");
            out.println("            animation: fadeInUp 0.8s ease-out;");
            out.println("        }");
            out.println("        .results-header {");
            out.println("            text-align: center;");
            out.println("            margin-bottom: 1.5rem;");
            out.println("            padding-bottom: 1rem;");
            out.println("            border-bottom: 2px solid #eee;");
            out.println("        }");
            out.println("        .results-header h2 {");
            out.println("            color: var(--primary-color);");
            out.println("            font-family: 'Roboto Slab', serif;");
            out.println("            font-weight: 700;");
            out.println("            margin-bottom: 0.5rem;");
            out.println("        }");
            out.println("        .search-info {");
            out.println("            text-align: center;");
            out.println("            margin-bottom: 2rem;");
            out.println("        }");
            out.println("        .search-query {");
            out.println("            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);");
            out.println("            border-left: 5px solid var(--warning-color);");
            out.println("            padding: 1rem;");
            out.println("            border-radius: 10px;");
            out.println("            display: inline-block;");
            out.println("            margin-bottom: 1rem;");
            out.println("        }");
            out.println("        .book-image {");
            out.println("            width: 100px;");
            out.println("            height: 150px;");
            out.println("            object-fit: cover;");
            out.println("            border-radius: 10px;");
            out.println("            box-shadow: 0 4px 8px rgba(0,0,0,0.1);");
            out.println("            transition: var(--transition);");
            out.println("        }");
            out.println("        .book-image:hover {");
            out.println("            transform: scale(1.05);");
            out.println("            box-shadow: 0 6px 12px rgba(0,0,0,0.2);");
            out.println("        }");
            out.println("        .table-custom {");
            out.println("            background: white;");
            out.println("            border-radius: 15px;");
            out.println("            overflow: hidden;");
            out.println("            box-shadow: 0 4px 15px rgba(0,0,0,0.1);");
            out.println("        }");
            out.println("        .table-custom thead th {");
            out.println("            background: var(--gradient-primary);");
            out.println("            color: white;");
            out.println("            border: none;");
            out.println("            padding: 1rem;");
            out.println("            font-weight: 600;");
            out.println("            text-align: center;");
            out.println("        }");
            out.println("        .table-custom tbody tr {");
            out.println("            transition: var(--transition);");
            out.println("        }");
            out.println("        .table-custom tbody tr:hover {");
            out.println("            background-color: rgba(52, 152, 219, 0.05);");
            out.println("            transform: translateY(-2px);");
            out.println("        }");
            out.println("        .table-custom tbody td {");
            out.println("            padding: 1rem;");
            out.println("            vertical-align: middle;");
            out.println("            border-color: #eee;");
            out.println("            text-align: center;");
            out.println("        }");
            out.println("        .status-available {");
            out.println("            background: linear-gradient(135deg, #27ae60, #2ecc71);");
            out.println("            color: white;");
            out.println("            padding: 0.3rem 1rem;");
            out.println("            border-radius: 20px;");
            out.println("            font-size: 0.85rem;");
            out.println("            font-weight: 500;");
            out.println("        }");
            out.println("        .status-issued {");
            out.println("            background: linear-gradient(135deg, #e74c3c, #f39c12);");
            out.println("            color: white;");
            out.println("            padding: 0.3rem 1rem;");
            out.println("            border-radius: 20px;");
            out.println("            font-size: 0.85rem;");
            out.println("            font-weight: 500;");
            out.println("        }");
            out.println("        .btn-custom {");
            out.println("            background: var(--gradient-secondary);");
            out.println("            color: white;");
            out.println("            border: none;");
            out.println("            padding: 0.8rem 2rem;");
            out.println("            border-radius: 25px;");
            out.println("            font-weight: 600;");
            out.println("            font-size: 1rem;");
            out.println("            transition: var(--transition);");
            out.println("            display: inline-flex;");
            out.println("            align-items: center;");
            out.println("            justify-content: center;");
            out.println("            gap: 0.5rem;");
            out.println("        }");
            out.println("        .btn-custom:hover {");
            out.println("            background: var(--gradient-primary);");
            out.println("            color: white;");
            out.println("            transform: translateY(-3px);");
            out.println("            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);");
            out.println("            text-decoration: none;");
            out.println("        }");
            out.println("        .no-results {");
            out.println("            text-align: center;");
            out.println("            padding: 3rem;");
            out.println("        }");
            out.println("        .no-results-icon {");
            out.println("            font-size: 4rem;");
            out.println("            color: #ddd;");
            out.println("            margin-bottom: 1rem;");
            out.println("        }");
            out.println("        .action-buttons {");
            out.println("            display: flex;");
            out.println("            gap: 1rem;");
            out.println("            justify-content: center;");
            out.println("            margin-top: 2rem;");
            out.println("            flex-wrap: wrap;");
            out.println("        }");
            out.println("        .copyright {");
            out.println("            background: var(--gradient-primary);");
            out.println("            padding: 0.8rem !important;");
            out.println("            border-top: 1px solid rgba(255, 255, 255, 0.2) !important;");
            out.println("            text-align: center;");
            out.println("            margin-top: 3rem;");
            out.println("        }");
            out.println("        .copyright p {");
            out.println("            margin: 0;");
            out.println("            font-size: 0.85rem;");
            out.println("            color: rgba(255, 255, 255, 0.9);");
            out.println("        }");
            out.println("        @keyframes fadeInUp {");
            out.println("            from { opacity: 0; transform: translateY(30px); }");
            out.println("            to { opacity: 1; transform: translateY(0); }");
            out.println("        }");
            out.println("        @media (max-width: 768px) {");
            out.println("            .content-container { padding: 1rem; }");
            out.println("            .results-container { padding: 1.5rem; }");
            out.println("            .book-image { width: 80px; height: 120px; }");
            out.println("            .table-custom { font-size: 0.9rem; }");
            out.println("        }");
            out.println("        @media (max-width: 576px) {");
            out.println("            .book-image { width: 60px; height: 90px; }");
            out.println("            .table-custom { font-size: 0.8rem; }");
            out.println("        }");
            out.println("        ::-webkit-scrollbar { width: 10px; }");
            out.println("        ::-webkit-scrollbar-track { background: #f1f1f1; }");
            out.println("        ::-webkit-scrollbar-thumb { background: var(--secondary-color); border-radius: 6px; }");
            out.println("        ::-webkit-scrollbar-thumb:hover { background: var(--primary-color); }");
            out.println("    </style>");
            out.println("</head>");
            
            out.println("<body>");
            
            // Main Content
            out.println("<div class=\"content-container\">");
            out.println("    <div class=\"results-container\">");
            out.println("        <div class=\"results-header\">");
            out.println("            <h2><i class=\"fas fa-search mr-2\"></i>Book Search Results</h2>");
            out.println("        </div>");
            
            out.println("        <div class=\"search-info\">");
            out.println("            <div class=\"search-query\">");
            out.println("                <i class=\"fas fa-search mr-2\"></i>");
            out.println("                Search Query: <strong>\"" + bookTitle + "\"</strong>");
            out.println("            </div>");
            out.println("        </div>");

            if (!rs.isBeforeFirst()) { // Check if no results
                out.println("        <div class=\"no-results\">");
                out.println("            <div class=\"no-results-icon\">");
                out.println("                <i class=\"fas fa-book-dead\"></i>");
                out.println("            </div>");
                out.println("            <h3>No Books Found</h3>");
                out.println("            <p class=\"text-muted\">No books were found matching your search criteria.</p>");
                out.println("            <div class=\"action-buttons\">");
                out.println("                <a href=\"search_book.jsp\" class=\"btn-custom\">");
                out.println("                    <i class=\"fas fa-search\"></i> New Search");
                out.println("                </a>");
                out.println("                <a href=\"" + (isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp") + "\" class=\"btn-custom\" style=\"background: var(--gradient-primary);\">");
                out.println("                    <i class=\"fas fa-home\"></i> Dashboard");
                out.println("                </a>");
                out.println("            </div>");
                out.println("        </div>");
            } else {
                out.println("        <div class=\"table-responsive\">");
                out.println("            <table class=\"table table-custom\">");
                out.println("                <thead>");
                out.println("                    <tr>");
                out.println("                        <th><i class=\"fas fa-image\"></i> Cover</th>");
                out.println("                        <th><i class=\"fas fa-barcode\"></i> Book ID</th>");
                out.println("                        <th><i class=\"fas fa-heading\"></i> Title</th>");
                out.println("                        <th><i class=\"fas fa-user-edit\"></i> Author</th>");
                out.println("                        <th><i class=\"fas fa-building\"></i> Publisher</th>");
                out.println("                        <th><i class=\"fas fa-calendar-alt\"></i> Year</th>");
                out.println("                        <th><i class=\"fas fa-copy\"></i> Copies</th>");
                out.println("                        <th><i class=\"fas fa-info-circle\"></i> Status</th>");
                out.println("                    </tr>");
                out.println("                </thead>");
                out.println("                <tbody>");

                int resultCount = 0;
                while (rs.next()) {
                    resultCount++;
                    String status = rs.getString("status");
                    if (status == null || status.equals("Returned") || status.isEmpty()) {
                        status = "Available";
                    }
                    
                    // Image path handling
                    String imgPath = rs.getString("img_path"); 
                    if (imgPath == null || imgPath.trim().isEmpty()) {
                        imgPath = "book_images/default.jpg";
                    } else {
                        imgPath = imgPath.replace("\\", "/");
                    }
                    String imageURL = request.getContextPath() + "/" + imgPath;
                    
                    // Determine status class
                    String statusClass = status.equalsIgnoreCase("Available") ? "status-available" : "status-issued";
                    String statusIcon = status.equalsIgnoreCase("Available") ? "fa-check-circle" : "fa-book-reader";

                    out.println("                    <tr>");
                    out.println("                        <td>");
                    out.println("                            <img src=\"" + imageURL + "\" class=\"book-image\" ");
                    out.println("                                 onerror=\"this.onerror=null;this.src='" + request.getContextPath() + "/book_images/default.jpg'\" ");
                    out.println("                                 alt=\"" + rs.getString("title") + "\">");
                    out.println("                        </td>");
                    out.println("                        <td><strong>" + rs.getString("book_id") + "</strong></td>");
                    out.println("                        <td><strong>" + rs.getString("title") + "</strong></td>");
                    out.println("                        <td>" + rs.getString("author") + "</td>");
                    out.println("                        <td>" + rs.getString("publisher") + "</td>");
                    out.println("                        <td>" + rs.getString("year_of_publication") + "</td>");
                    out.println("                        <td><span class=\"badge badge-primary\" style=\"font-size: 1rem; padding: 0.5rem 1rem;\">" + rs.getInt("available_copies") + "</span></td>");
                    out.println("                        <td><span class=\"" + statusClass + "\"><i class=\"fas " + statusIcon + " mr-1\"></i> " + status + "</span></td>");
                    out.println("                    </tr>");
                }

                out.println("                </tbody>");
                out.println("            </table>");
                out.println("        </div>");
                
                // Results summary
                out.println("        <div class=\"row mt-4\">");
                out.println("            <div class=\"col-md-6\">");
                out.println("                <div class=\"alert alert-success\">");
                out.println("                    <i class=\"fas fa-check-circle mr-2\"></i>");
                out.println("                    <strong>" + resultCount + "</strong> book(s) found for your search");
                out.println("                </div>");
                out.println("            </div>");
                out.println("            <div class=\"col-md-6 text-right\">");
                out.println("                <div class=\"action-buttons\">");
                out.println("                    <a href=\"search_book.jsp\" class=\"btn-custom\">");
                out.println("                        <i class=\"fas fa-search\"></i> New Search");
                out.println("                    </a>");
                out.println("                    <a href=\"" + (isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp") + "\" class=\"btn-custom\" style=\"background: var(--gradient-primary);\">");
                out.println("                        <i class=\"fas fa-home\"></i> Dashboard");
                out.println("                    </a>");
                out.println("                </div>");
                out.println("            </div>");
                out.println("        </div>");
            }

            out.println("    </div>");
            out.println("</div>");
            
            // Footer
            out.println("<div class=\"copyright\">");
            out.println("    <p>&copy; " + java.time.Year.now().getValue() + " Library Hub - Sacred Heart Degree College. All rights reserved.</p>");
            out.println("</div>");
            
            out.println("</body>");
            out.println("</html>");

            rs.close();
            db.pstmt.close();
            db.con.close();

        } catch (Exception e) {
            // Enhanced error handling
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Error - Search Book</title>");
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            out.println("<style>");
            out.println("    body { background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%); min-height: 100vh; }");
            out.println("    .error-container { max-width: 600px; margin: 100px auto; padding: 2rem; background: white; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"error-container text-center\">");
            out.println("    <div style=\"font-size: 4rem; color: #e74c3c; margin-bottom: 1rem;\">");
            out.println("        <i class=\"fas fa-exclamation-triangle\"></i>");
            out.println("    </div>");
            out.println("    <h2 class=\"text-danger\">Search Error</h2>");
            out.println("    <p class=\"text-muted mb-4\">An error occurred while searching for books. Please try again.</p>");
            out.println("    <div class=\"alert alert-danger\">");
            out.println("        <strong>Error Details:</strong> " + e.getMessage());
            out.println("    </div>");
            out.println("    <div class=\"mt-4\">");
            out.println("        <a href=\"search_book.jsp\" class=\"btn btn-primary mr-2\">");
            out.println("            <i class=\"fas fa-arrow-left mr-2\"></i>Back to Search");
            out.println("        </a>");
            out.println("        <a href=\"librarian_dashboard.jsp\" class=\"btn btn-secondary\">");
            out.println("            <i class=\"fas fa-tachometer-alt mr-2\"></i>Dashboard");
            out.println("        </a>");
            out.println("    </div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
            e.printStackTrace();
        }
    }
}