<%-- 
    Document   : Recruiterlogin
    Created on : 6 Feb 2026, 9:29:07 am
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String msg = "";

if(request.getParameter("login") != null){
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        // ENV variables (Railway)
        String host = System.getenv("DB_HOST");
        String port = System.getenv("DB_PORT");
        String db   = System.getenv("DB_NAME");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");

        String url;

        // 🔥 Local fallback
        if(host == null){
            url = "jdbc:mysql://localhost:3306/recruiter_db";
            user = "root";
            pass = "spdt";
        } else {
            url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
        }

        con = DriverManager.getConnection(url, user, pass);

        ps = con.prepareStatement(
            "SELECT * FROM recruiter WHERE recruiter_id=? AND password=?"
        );
        ps.setString(1, userid);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if(rs.next()){
            session.setAttribute("recruiterId", userid);
            response.sendRedirect("recruiter_dashboard.jsp");
        }else{
            msg = "Invalid User ID or Password";
        }

    }catch(Exception e){
        msg = "Server Error : " + e.getMessage();
    } finally {
        try{ if(rs != null) rs.close(); } catch(Exception e){}
        try{ if(ps != null) ps.close(); } catch(Exception e){}
        try{ if(con != null) con.close(); } catch(Exception e){}
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Login</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background:#eef1f6;
}

h2{
    text-align:center;
    margin-top:40px;
}

.login-box{
    width:380px;
    margin:60px auto;
    background:#5b63a7;
    padding:40px 30px;
    border-radius:6px;
    box-shadow:0 4px 12px rgba(0,0,0,0.2);
}

.login-box label{
    color:white;
    font-size:14px;
    display:block;
    margin-bottom:6px;
}

.login-box input{
    width:100%;
    padding:10px;
    margin-bottom:20px;
    border:none;
    border-radius:4px;
}

.login-box button{
    width:100%;
    padding:10px;
    background:#f1f1f1;
    border:none;
    border-radius:20px;
    cursor:pointer;
}

.error{
    color:yellow;
    text-align:center;
    margin-bottom:15px;
}
</style>
</head>

<body>

<h2>Recruiter Login Page</h2>

<div class="login-box">

    <% if(!msg.equals("")){ %>
        <div class="error"><%= msg %></div>
    <% } %>

    <form action="recruiterlogin.jsp" method="post">

        <label>User ID</label>
        <input type="text" name="userid" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit" name="login">Log In</button>

    </form>
</div>

</body>
</html>

