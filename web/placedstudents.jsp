<%-- 
    Document   : placedstudents
    Created on : 2 Feb 2026, 2:35:51 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Placed Students</title>

<style>
body{
  margin:0;
  font-family: Arial, sans-serif;
  background:#f5f6fa;
}

/* TOP BAR */
.topbar{
  background:#5c6bc0;
  color:white;
  padding:15px 20px;
  display:flex;
  justify-content:space-between;
  align-items:center;
}
.topbar h2{ margin:0; }

/* SIDEBAR */
.sidebar{
  width:220px;
  height:100vh;
  background:#1f1f2e;
  position:fixed;
  top:0;
  left:0;
  padding-top:70px;
}
.sidebar a{
  display:block;
  padding:15px;
  color:#ccc;
  text-decoration:none;
}
.sidebar a:hover,
.sidebar a.active{
  background:#2d2d44;
  color:white;
}

/* MAIN CONTENT */
.main{
  margin-left:240px;
  padding:30px;
}
.box{
  background:white;
  padding:20px;
  border-radius:4px;
}

/* TABLE */
table{
  width:100%;
  border-collapse:collapse;
  margin-top:15px;
}
th,td{
  padding:10px;
  border-bottom:1px solid #ddd;
  text-align:left;
}
th{
  background:#f2f2f2;
}
</style>

</head>
<body>

<!-- TOP BAR -->
<div class="topbar">
  <span>☰</span>
  <h2>PLACEMENT PORTAL</h2>
</div>

<!-- SIDEBAR -->
<div class="sidebar">
  <a href="studentlist.jsp">STUDENTS</a>
  <a href="companylist.jsp">COMPANIES</a>
  <a href="placedstudents.jsp" class="active">PLACED STUDENTS</a>
  <a href="home.jsp">LOGOUT</a>
</div>

<!-- MAIN CONTENT -->
<div class="main">
  <h3>STUDENTS</h3>

  <div class="box">

    <!-- ❌ Export button removed -->

    <table>
      <tr>
        <th>PRN</th>
        <th>FName</th>
        <th>LName</th>
        <th>Email</th>
        <th>Company_name</th>
        <th>Placed_date</th>
        <th>Role</th>
      </tr>
<%
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
        url = "jdbc:mysql://localhost:3306/Export_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement("SELECT * FROM placed_students");
    rs = ps.executeQuery();

    while(rs.next()){
%>
      <tr>
        <td><%= rs.getString("prn") %></td>
        <td><%= rs.getString("fname") %></td>
        <td><%= rs.getString("lname") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("company_name") %></td>
        <td><%= rs.getDate("placed_date") %></td>
        <td><%= rs.getString("role") %></td>
      </tr>
<%
    }
}catch(Exception e){
%>
<tr>
  <td colspan="7">Error: <%= e %></td>
</tr>
<%
} finally {
    try{ if(rs!=null) rs.close(); } catch(Exception e){}
    try{ if(ps!=null) ps.close(); } catch(Exception e){}
    try{ if(con!=null) con.close(); } catch(Exception e){}
}
%>


    </table>
  </div>
</div>

</body>
</html>