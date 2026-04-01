<%-- 
    Document   : newCompanies
    Created on : 4 Feb 2026, 7:44:47 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // ---- Profile completeness check ----
    String studentId = (String) session.getAttribute("student_id");
    boolean profileComplete = false;

    if (studentId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String host = System.getenv("DB_HOST");
            Connection _con;
            if (host != null) {
                String _port = System.getenv("DB_PORT");
                String _db   = System.getenv("DB_NAME");
                String _user = System.getenv("DB_USER");
                String _pass = System.getenv("DB_PASS");
                _con = DriverManager.getConnection(
                    "jdbc:mysql://" + host + ":" + _port + "/" + _db + "?useSSL=false&allowPublicKeyRetrieval=true",
                    _user, _pass);
            } else {
                _con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/myprofile_db", "root", "spdt");
            }
            PreparedStatement _ps = _con.prepareStatement(
                "SELECT fname, lname, email, gender, address, marks10, marks12, graduation, branch, dob, phone FROM student_profile WHERE id=?");
            _ps.setInt(1, Integer.parseInt(studentId));
            ResultSet _rs = _ps.executeQuery();
            if (_rs.next()) {
                // All required fields must be non-null and non-empty
                String[] required = {
                    _rs.getString("fname"), _rs.getString("lname"),
                    _rs.getString("email"), _rs.getString("gender"),
                    _rs.getString("address"), _rs.getString("marks10"),
                    _rs.getString("marks12"), _rs.getString("graduation"),
                    _rs.getString("branch"), _rs.getString("dob"),
                    _rs.getString("phone")
                };
                profileComplete = true;
                for (String f : required) {
                    if (f == null || f.trim().isEmpty()) {
                        profileComplete = false;
                        break;
                    }
                }
            }
            _rs.close(); _ps.close(); _con.close();
        } catch (Exception _e) { _e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Companies | Placement Portal</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background:#f5f6fa;
}

/* Sidebar */
.sidebar{
    width:230px;
    height:100vh;
    background:#1e1e2f;
    position:fixed;
    color:white;
}
.sidebar h3{
    text-align:center;
    padding:20px 0;
    border-bottom:1px solid #333;
}
.sidebar a{
    display:block;
    padding:14px 20px;
    color:#ddd;
    text-decoration:none;
    border-bottom:1px solid #2c2c3c;
}
.sidebar a:hover{
    background:#2f2f44;
}

/* Header */
.header{
    margin-left:230px;
    height:60px;
    background:linear-gradient(to right,#4b6cb7,#182848);
    color:white;
    display:flex;
    align-items:center;
    padding:0 20px;
    font-size:20px;
}

/* Main */
.main{
    margin-left:230px;
    padding:30px;
}

.card{
    background:white;
    padding:25px;
    border-radius:4px;
}

/* Table */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}
th, td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
    font-size:14px;
}
th{
    background:#f1f1f1;
}
.apply-btn{
    padding:6px 15px;
    border:1px solid #4b6cb7;
    background:white;
    color:#4b6cb7;
    cursor:pointer;
    border-radius:3px;
}
.apply-btn:hover{
    background:#4b6cb7;
    color:white;
}
.apply-btn-disabled{
    padding:6px 15px;
    border:1px solid #ccc;
    background:#f0f0f0;
    color:#999;
    cursor:not-allowed;
    border-radius:3px;
}
.profile-warning{
    background:#fff3cd;
    border:1px solid #ffc107;
    color:#856404;
    padding:12px 18px;
    border-radius:4px;
    margin-bottom:18px;
    font-size:14px;
}

.footer{
    text-align:center;
    margin-top:30px;
    color:#777;
    font-size:13px;
}
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h3>STUDENT</h3>
    <a href="student_home.jsp">HOME</a>
    <a href="myprofile.jsp">MY PROFILE</a>
    <a href="newCompanies.jsp">NEW COMPANIES</a>
    <a href="student_home.jsp">LOGOUT</a>
</div>

<!-- Header -->
<div class="header">
    ☰ &nbsp; PLACEMENT PORTAL
</div>

<!-- Main Content -->
<div class="main">
    <div class="card">
        <h2>COMPANIES</h2>

        <% if (!profileComplete) { %>
        <div class="profile-warning">
            ⚠️ <strong>Profile Incomplete:</strong> Please complete all required fields in
            <a href="myprofile.jsp" style="color:#856404; font-weight:bold;">My Profile</a>
            before applying to any company. (Resume upload is optional.)
        </div>
        <% } %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Criteria</th>
                <th>Role</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>

            <tr>
                <td>30001</td>
                <td>Wipro</td>
                <td>60% Throughout, BE/BTech/MCA/MTech</td>
                <td>Testing</td>
                <td>13/02/2021</td>
                <td>
                    <% if (profileComplete) { %>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="company_id" value="30001">
                        <input type="hidden" name="company_name" value="Wipro">
                        <input type="hidden" name="role" value="Testing">
                        <button class="apply-btn">APPLY</button>
                    </form>
                    <% } else { %>
                    <button class="apply-btn-disabled" disabled title="Complete your profile first">APPLY</button>
                    <% } %>
                </td>
            </tr>

            <tr>
                <td>30002</td>
                <td>TCS</td>
                <td>60% Throughout, BE/BTech/MCA/MTech</td>
                <td>Analyst</td>
                <td>21/02/2021</td>
                <td>
                    <% if (profileComplete) { %>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="company_id" value="30002">
                        <input type="hidden" name="company_name" value="TCS">
                        <input type="hidden" name="role" value="Analyst">
                        <button class="apply-btn">APPLY</button>
                    </form>
                    <% } else { %>
                    <button class="apply-btn-disabled" disabled title="Complete your profile first">APPLY</button>
                    <% } %>
                </td>
            </tr>

            <tr>
                <td>30003</td>
                <td>Capgemini</td>
                <td>60% Throughout, BE/BTech/MCA</td>
                <td>Engineer Trainee</td>
                <td>18/02/2021</td>
                <td>
                    <% if (profileComplete) { %>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="company_id" value="30003">
                        <input type="hidden" name="company_name" value="Capgemini">
                        <input type="hidden" name="role" value="Engineer Trainee">
                        <button class="apply-btn">APPLY</button>
                    </form>
                    <% } else { %>
                    <button class="apply-btn-disabled" disabled title="Complete your profile first">APPLY</button>
                    <% } %>
                </td>
            </tr>

            <tr>
                <td>30004</td>
                <td>Knowledge Lens</td>
                <td>60% Throughout, Only CSE & IT</td>
                <td>Java Developer</td>
                <td>30/03/2021</td>
                <td>
                    <% if (profileComplete) { %>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="company_id" value="30004">
                        <input type="hidden" name="company_name" value="Knowledge Lens">
                        <input type="hidden" name="role" value="Java Developer">
                        <button class="apply-btn">APPLY</button>
                    </form>
                    <% } else { %>
                    <button class="apply-btn-disabled" disabled title="Complete your profile first">APPLY</button>
                    <% } %>
                </td>
            </tr>

            <tr>
                <td>30005</td>
                <td>Persistent Pune</td>
                <td>60% Throughout, Only CSE & IT</td>
                <td>Java Developer</td>
                <td>20/03/2021</td>
                <td>
                    <% if (profileComplete) { %>
                    <form action="apply.jsp" method="post">
                        <input type="hidden" name="company_id" value="30005">
                        <input type="hidden" name="company_name" value="Persistent Pune">
                        <input type="hidden" name="role" value="Java Developer">
                        <button class="apply-btn">APPLY</button>
                    </form>
                    <% } else { %>
                    <button class="apply-btn-disabled" disabled title="Complete your profile first">APPLY</button>
                    <% } %>
                </td>
            </tr>

        </table>
    </div>

</div>

</body>
</html>
