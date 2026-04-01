<%-- 
    Document   : student_home
    Created on : 2 Feb 2026, 4:14:14 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*,java.util.*" %>

<%
    // --------- Fetch student name from myprofile_db ---------
    String username = (String) session.getAttribute("studentUser");
    String studentId = (String) session.getAttribute("student_id");
    String firstName = "Student"; // default
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

// ======== Profile DB ========
String host = System.getenv("DB_HOST");
String port = System.getenv("DB_PORT");
String db   = System.getenv("DB_NAME");
String user = System.getenv("DB_USER");
String pass = System.getenv("DB_PASS");

String urlProfile;
if(host==null){  // local fallback
    urlProfile = "jdbc:mysql://localhost:3306/myprofile_db";
    user = "root";
    pass = "spdt";
} else {
    urlProfile = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
}

Connection conProfile = DriverManager.getConnection(urlProfile, user, pass);

        // Try to get name from student_profile table using student_id
        if(studentId != null) {
            PreparedStatement ps = conProfile.prepareStatement(
                "SELECT fname FROM student_profile WHERE id=?");
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                String fname = rs.getString("fname");
                if(fname != null && !fname.isEmpty()) {
                    firstName = fname;
                }
            }
            rs.close();
            ps.close();
        }
        conProfile.close();
    } catch(Exception e) { e.printStackTrace(); }

    // --------- Fetch recent companies from company_db ---------
    List<Map<String,String>> companies = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String host = System.getenv("DB_HOST");
        Connection conCompany;

        if(host != null) {
            String port = System.getenv("DB_PORT");
            String db = System.getenv("DB_NAME");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASS");
            String urlCompany = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            conCompany = DriverManager.getConnection(urlCompany, dbUser, dbPass);
        } else {
            conCompany = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/company_db","root","spdt");
        }

        Statement st = conCompany.createStatement();
        ResultSet rs = st.executeQuery(
    "SELECT id, name, criteria, role FROM companies ORDER BY id ASC LIMIT 5");
        while(rs.next()){
            Map<String,String> c = new HashMap<>();
            c.put("id", rs.getString("id"));
            c.put("name", rs.getString("name"));
            c.put("criteria", rs.getString("criteria"));
            c.put("role", rs.getString("role"));
            companies.add(c);
        }
        conCompany.close();
    } catch(Exception e) { e.printStackTrace(); }
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { margin:0; font-family: Arial, Helvetica, sans-serif; background:#f4f6f8; }
.topbar { height:60px; background:#5c63b8; color:white; display:flex; align-items:center; justify-content:space-between; padding:0 20px; }
.topbar .menu { font-size:22px; cursor:pointer; }
.topbar .title { font-size:20px; font-weight:bold; }
.sidebar { width:220px; height:100vh; background:#1f1f2e; position:fixed; top:0; left:0; padding-top:60px; }
.sidebar a { display:block; padding:15px 20px; color:#ccc; text-decoration:none; font-size:14px; }
.sidebar a:hover { background:#2e2e42; color:white; }
.main { margin-left:220px; }
.content { padding:30px; }
.dashboard-card { background:#ffffff; border-radius:10px; padding:20px; margin-bottom:20px; text-align:center; box-shadow:0 2px 6px rgba(0,0,0,0.1); }
.dashboard-card h3 { margin-bottom:10px; }
.table thead { background:#e0e0e0; }
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="student_home.jsp">HOME</a>
    <a href="newCompanies.jsp">NEW COMPANIES</a>
    <a href="myprofile.jsp">MY PROFILE</a>
    <a href="home.jsp">LOGOUT</a>
</div>

<!-- Main Area -->
<div class="main">
    <!-- Top Bar -->
    <div class="topbar">
        <div class="menu"></div>
        <div class="title">STUDENT HOME</div>
        <div style="font-size:15px; font-weight:bold;">👤 <%= firstName %></div>
    </div>

    <!-- Page Content -->
    <div class="content">
        <!-- Welcome -->
        <h2>Hello <%= firstName %></h2>
        <p>Welcome to your placement dashboard! Check latest companies and update your profile for better opportunities.</p>

        <!-- Dashboard Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>5</h3>
                    <p>Applications Submitted</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>8</h3>
                    <p>Companies Eligible</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card">
                    <h3>2</h3>
                    <p>Upcoming Interviews</p>
                </div>
            </div>
        </div>

        <!-- Recent Companies Table -->
        <div class="card shadow p-3">
            <h4>Recent Companies</h4>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Criteria</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                <% for(Map<String,String> c : companies) { %>
                    <tr>
                        <td><%= c.get("id") %></td>
                        <td><%= c.get("name") %></td>
                        <td><%= c.get("criteria") %></td>
                        <td><%= c.get("role") %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>