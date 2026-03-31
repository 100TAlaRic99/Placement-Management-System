<%-- 
    Document   : companylist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html>
<head>
<title>Companies | Placement Portal</title>

<style>
body{
margin:0;
font-family: Arial, sans-serif;
background:#f5f6fa;
}

.topbar{
background:#5c6bc0;
color:white;
padding:15px 25px;
display:flex;
justify-content:flex-end;
align-items:center;
font-size:22px;
font-weight:bold;
}

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

.content{
margin-left:240px;
padding:30px;
margin-top:20px;
}

.btn{
padding:8px 15px;
border:1px solid #5a66c5;
background:white;
cursor:pointer;
text-decoration:none;
margin-bottom:10px;
display:inline-block;
}

.card{
background:white;
padding:20px;
border-radius:5px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th, td{
padding:10px;
border:1px solid #ccc;
text-align:left;
}

th{
background:#f4f4f4;
}

a.action{
color:blue;
text-decoration:none;
}
</style>

</head>

<body>

<div class="topbar">
PLACEMENT PORTAL
</div>

<div class="sidebar">
<a href="studentlist.jsp">STUDENTS</a>
<a href="companylist.jsp" class="active">COMPANIES</a>
<a href="placedstudents.jsp">PLACED STUDENTS</a>
<a href="home.jsp">LOGOUT</a>
</div>

<div class="content">

<a href="addCompany.jsp" class="btn">ADD COMPANY</a>

<div class="card">
<h3>COMPANIES</h3>

<table>

<tr>
<th>ID</th>
<th>Company Name</th>
<th>Criteria</th>
<th>Role</th>
<th>Package</th>
<th>Action</th>
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

    // 🔥 अगर ENV नहीं है → LOCAL DB use करो
    if(host == null){
        url = "jdbc:mysql://localhost:3306/pms_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement("SELECT * FROM company");
    rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
<td><%=rs.getInt("cid")%></td>
<td><%=rs.getString("cname")%></td>
<td><%=rs.getString("criteria")%></td>
<td><%=rs.getString("role")%></td>
<td><%=rs.getString("package")%></td>

<td>
<a class="action" href="editCompany.jsp?cid=<%=rs.getInt("cid")%>">Edit</a> |
<a class="action" href="deleteCompany.jsp?cid=<%=rs.getInt("cid")%>"
onclick="return confirm('Are you sure?')">Delete</a>
</td>
</tr>

<%
    }

}catch(Exception e){
    out.println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
}

// Close resources
try{
    if(rs != null) rs.close();
    if(ps != null) ps.close();
    if(con != null) con.close();
}catch(Exception e){}
%>

</table>

</div>

</div>

</body>
</html>