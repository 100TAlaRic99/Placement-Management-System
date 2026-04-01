<%-- 
    Document   : apply
    Created on : 4 Feb 2026, 8:12:46 pm
    Author     : defaultuser0
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get parameters matching what newCompanies.jsp sends
    String company = request.getParameter("company_name");
    String role = request.getParameter("role");

    // Get email from session instead of hardcoding
    String email = (String) session.getAttribute("studentUser");
    if (email == null) email = "student@gmail.com"; // fallback

    String message = "Application Submitted";
    boolean success = true;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Dynamic DB connection
    String host = System.getenv("DB_HOST");
    Connection con;

    if (host != null) {
        String port = System.getenv("DB_PORT");
        String db = System.getenv("DB_NAME");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");
        String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
        con = DriverManager.getConnection(url, user, pass);
    } else {
        String url = "jdbc:mysql://localhost:3306/applied_db";
        String user = "root";
        String pass = "spdt";
        con = DriverManager.getConnection(url, user, pass);
    }

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO applied_companies (student_email, company_name, role, apply_date) VALUES (?, ?, ?, CURDATE())"
    );
    ps.setString(1, email);
    ps.setString(2, company);
    ps.setString(3, role);

    ps.executeUpdate();
    ps.close();
    con.close();

} catch(Exception e){
    e.printStackTrace();
    success = false;
    message = "Error: " + e.getMessage();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Apply Success</title>
    <style>
        body{
            font-family: Arial;
            background:#f5f6fa;
            text-align:center;
            padding-top:100px;
        }
        .box{
            background:white;
            width:400px;
            margin:auto;
            padding:30px;
            border-radius:5px;
            box-shadow:0 0 10px #ccc;
        }
        a{
            display:inline-block;
            margin-top:20px;
            text-decoration:none;
            color:white;
            background:#4b6cb7;
            padding:10px 20px;
            border-radius:4px;
        }
    </style>
</head>
<body>

<div class="box">
    <% if (success) { %>
    <h2>Application Submitted ✅</h2>
    <p>You have successfully applied for <strong><%= company %></strong>.</p>
    <% } else { %>
    <h2>Application Failed ❌</h2>
    <p><%= message %></p>
    <% } %>
    <a href="newCompanies.jsp">Back to Companies</a>
</div>

</body>
</html>
