<%-- 
    Document   : myprofile
    Created on : 4 Feb 2026, 2:47:09 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | Placement Portal</title>

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

/* Form */
.form-row{
    display:flex;
    gap:20px;
    margin-bottom:15px;
}
.form-group{
    flex:1;
}
label{
    font-size:14px;
    color:#333;
}
input, textarea, select{
    width:100%;
    padding:10px;
    margin-top:5px;
    border:1px solid #ccc;
    border-radius:3px;
    background:#f9f9f9;
}
textarea{
    resize:none;
    height:100px;
}

button{
    padding:10px 30px;
    background:#4b6cb7;
    border:none;
    color:white;
    font-size:14px;
    border-radius:3px;
    cursor:pointer;
}
button:hover{
    background:#182848;
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

<%
    // Session check
String studentId = (String) session.getAttribute("student_id");

// Initialize variables
String fname="", mname="", lname="", email="", gender="", address="";
String marks10="", marks12="", diploma="", graduation="", branch="", dob="", phone="", skills="";
String resumePath="";

if(studentId != null){
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
            url = "jdbc:mysql://localhost:3306/myprofile_db";
            user = "root";
            pass = "spdt";
        } else {
            url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
        }

        con = DriverManager.getConnection(url, user, pass);

        ps = con.prepareStatement("SELECT * FROM student_profile WHERE id=?");
        ps.setString(1, studentId);
        rs = ps.executeQuery();

        if(rs.next()){
            fname = rs.getString("fname");
            mname = rs.getString("mname");
            lname = rs.getString("lname");
            email = rs.getString("email");
            gender = rs.getString("gender");
            address = rs.getString("address");
            marks10 = rs.getString("marks10");
            marks12 = rs.getString("marks12");
            diploma = rs.getString("diploma");
            graduation = rs.getString("graduation");
            branch = rs.getString("branch");
            dob = rs.getString("dob");
            phone = rs.getString("phone");
            skills = rs.getString("skills");
            resumePath = rs.getString("resume_path"); // Optional: show uploaded file
        }
    }catch(Exception e){
        out.println("Error: "+e);
    }finally{
        try{ if(rs!=null) rs.close(); } catch(Exception e){}
        try{ if(ps!=null) ps.close(); } catch(Exception e){}
        try{ if(con!=null) con.close(); } catch(Exception e){}
    }
}
%>

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
        <h2>My Profile</h2>

        <!-- Updated form: enctype added for file upload -->
        <form action="SaveProfileServlet" method="post" enctype="multipart/form-data">
          <input type="hidden" name="id" value="<%= studentId %>">

            <div class="form-row">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="fname" value="<%= fname %>" required>
                </div>
                <div class="form-group">
                    <label>Middle Name</label>
                    <input type="text" name="mname" value="<%= mname %>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="lname" value="<%= lname %>" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="<%= email %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender" required>
                        <option value="">Select</option>
                        <option value="male" <%= "male".equals(gender) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= "female".equals(gender) ? "selected" : "" %>>Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address"><%= address %></textarea>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>10th Marks</label>
                    <input type="number" step="0.01" name="marks10" value="<%= marks10 %>" required>
                </div>
                <div class="form-group">
                    <label>12th Marks</label>
                    <input type="number" step="0.01" name="marks12" value="<%= marks12 %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Diploma Percentage</label>
                    <input type="number" step="0.01" name="diploma" value="<%= diploma %>">
                </div>
                <div class="form-group">
                    <label>Graduation Marks</label>
                    <input type="number" step="0.01" name="graduation" value="<%= graduation %>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Branch</label>
                    <input type="text" name="branch" value="<%= branch %>">
                </div>
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dob" value="<%= dob %>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="<%= phone %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Skills</label>
                    <textarea name="skills"><%= skills %></textarea>
                </div>
            </div>

            <!-- Upload Resume Button -->
            <div class="form-row">
                <div class="form-group">
                    <label>Upload Resume</label>
                    <input type="file" name="resume" accept=".pdf,.doc,.docx">
                    <% if(resumePath != null && !resumePath.isEmpty()){ %>
                        <p>Previously uploaded: <a href="<%= resumePath %>" target="_blank">View Resume</a></p>
                    <% } %>
                </div>
            </div>

            <button type="submit">SAVE</button>

        </form>
    </div>
</div>

</body>
</html>