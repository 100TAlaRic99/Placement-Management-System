<%-- 
    Document   : RecruiterHome
    Created on : 4 Feb 2026, 8:47:42 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
/* session check (recommended) */
if(session.getAttribute("recruiterId")==null){
    response.sendRedirect("recruiterlogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Placement Portal</title>

<style>
*{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;
}
body{
    display:flex;
    background:#f5f5f5;
}

/* Sidebar */
.sidebar{
    width:220px;
    height:100vh;
    background:#1e1e2f;
    color:#fff;
    padding:20px;
}
.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    margin:15px 0;
}
.sidebar a:hover{
    background:#333;
    padding:5px;
}
.sidebar .copy{
    position:absolute;
    bottom:20px;
    font-size:12px;
}

/* Main */
.main{
    width:100%;
}

/* Topbar */
.topbar{
    background:#5a63a5;
    color:white;
    padding:15px;
    display:flex;
    align-items:center;
}
.topbar h2{
    margin-left:auto;
    margin-right:20px;
}

/* Content */
.content{
    background:white;
    margin:20px;
    padding:40px;
    border-radius:5px;
}
.content h3{
    margin-bottom:20px;
}

/* Table */
table{
    width:100%;
    border-collapse:collapse;
}
th{
    background:#eee;
    padding:10px;
    text-align:left;
}
td{
    padding:10px;
    border-bottom:1px solid #ddd;
}

/* Buttons */
.btn{
    padding:6px 14px;
    border:1px solid #5a63a5;
    background:white;
    color:#5a63a5;
    cursor:pointer;
}
.btn:hover{
    background:#5a63a5;
    color:white;
}
</style>

</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="#">HOME</a>
    <a href="home.jsp">LOGOUT</a>
</div>

<!-- Main Area -->
<div class="main">

    <div class="topbar">
        <h2>PLACEMENT PORTAL</h2>
    </div>

    <div class="content">
        <h3>STUDENTS</h3>

        <table>
            <tr>
                <th>ID</th>
                <th>FName</th>
                <th>LName</th>
                <th>Email</th>
                <th>10th</th>
                <th>12th</th>
                <th>Diploma</th>
                <th>Degree</th>
                <th>Branch</th>
                <th></th>
                <th></th>
            </tr>

<%
Connection con = null;
Statement st = null;
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
        url = "jdbc:mysql://localhost:3306/myprofile_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM student_profile");

    while(rs.next()){
%>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("fname")%></td>
                <td><%=rs.getString("lname")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getFloat("marks10")%></td>
                <td><%=rs.getFloat("marks12")%></td>
                <td><%=rs.getFloat("diploma")%></td>
                <td><%=rs.getFloat("graduation")%></td>
                <td><%=rs.getString("branch")%></td>
                <td><button class="btn">SELECT</button></td>
                <td><button class="btn">FEEDBACK</button></td>
            </tr>
<%
    }
    con.close();
}catch(Exception e){
    out.println(e);
}
%>

        </table>
    </div>
</div>

</body>
</html>