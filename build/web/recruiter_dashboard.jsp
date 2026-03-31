<%-- 
    Document   : recruiter_dashboard
    Created on : 22 Mar 2026, 2:07:18 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
Connection con = null;

try {
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
        url = "jdbc:mysql://localhost:3306/recuriterdashboard_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

} catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Recruiter Dashboard</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
body { background: #f4f6f9; }
.sidebar { width:220px;height:100vh;background:#1e2a38;position:fixed;color:white; }
.sidebar h3 { padding:20px;text-align:center; }
.sidebar a { display:block;color:white;padding:12px 20px;text-decoration:none; }
.sidebar a:hover { background:#2f4050; }
.content { margin-left:230px;padding:25px; }
</style>
</head>

<body>

<div class="sidebar">
    <h3>Recruiter</h3>

    <!-- ✅ FIXED LINKS -->
    <a href="<%= request.getContextPath() %>/recruiter_dashboard.jsp">Dashboard</a>

    <a href="<%= request.getContextPath() %>/jobpostings.jsp">Job Postings</a>

    <a href="<%= request.getContextPath() %>/home.jsp">Logout</a>
</div>

<div class="content">

<h2>Welcome, Recruiter!</h2>

<h4 class="mt-4">Student Profiles</h4>

<table class="table table-bordered mt-3">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Branch</th>
<th>10th</th>
<th>12th</th>
<th>Graduation</th>
<th>Actions</th>
</tr>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM students WHERE status='applied'");

while(rs.next()){
%>

<tr id="row-<%=rs.getInt("id")%>">
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("branch")%></td>
<td><%=rs.getDouble("tenth")%></td>
<td><%=rs.getDouble("twelfth")%></td>
<td><%=rs.getDouble("graduation")%></td>

<td>
<button onclick="updateStatus(<%=rs.getInt("id")%>, 'shortlisted')" 
class="btn btn-primary btn-sm">Shortlist</button>

<button onclick="updateStatus(<%=rs.getInt("id")%>, 'rejected')" 
class="btn btn-danger btn-sm">Reject</button>
</td>
</tr>

<%
}
%>

</table>

</div>

<!-- ✅ FIXED JavaScript -->
<script>
function updateStatus(id, status) {
    fetch("<%= request.getContextPath() %>/ShortlistServlet?id=" + id + "&status=" + status)
    .then(res => res.text())
    .then(data => {
        document.getElementById("row-" + id).remove();
    });
}
</script>

</body>
</html>