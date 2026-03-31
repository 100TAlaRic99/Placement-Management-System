<%-- 
    Document   : saveProfile
    Created on : 4 Feb 2026, 3:40:05 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.nio.file.Paths" %>

<%
String studentId = request.getParameter("id"); // hidden field from myprofile.jsp
String fname   = request.getParameter("fname");
String mname   = request.getParameter("mname");
String lname   = request.getParameter("lname");
String email   = request.getParameter("email");
String gender  = request.getParameter("gender");
String address = request.getParameter("address");
String marks10 = request.getParameter("marks10");
String marks12 = request.getParameter("marks12");
String diploma = request.getParameter("diploma");
String graduation = request.getParameter("graduation");
String branch  = request.getParameter("branch");
String dob     = request.getParameter("dob");
String phone   = request.getParameter("phone");
String skills  = request.getParameter("skills");

// File upload
Part filePart = request.getPart("resume");
String resumePath = null;
if(filePart != null && filePart.getSize() > 0){
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    String uploadDir = application.getRealPath("") + "uploads/"; // create 'uploads' folder in project
    java.io.File uploadFolder = new java.io.File(uploadDir);
    if(!uploadFolder.exists()){ uploadFolder.mkdirs(); }
    filePart.write(uploadDir + fileName);
    resumePath = "uploads/" + fileName;
}

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
  Class.forName("com.mysql.cj.jdbc.Driver");

// ENV variables (Railway)
String host = System.getenv("DB_HOST");
String port = System.getenv("DB_PORT");
String db   = System.getenv("DB_NAME");
String user = System.getenv("DB_USER");
String pass = System.getenv("DB_PASS");

String url;

// Local fallback
if(host == null){
    url = "jdbc:mysql://localhost:3306/myprofile_db";
    user = "root";
    pass = "spdt";
} else {
    url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
}

// Connection
Connection con = DriverManager.getConnection(url, user, pass);
    // 1. Check if record exists
    PreparedStatement check = con.prepareStatement("SELECT * FROM student_profile WHERE id=?");
    check.setString(1, studentId);
    ResultSet rs = check.executeQuery();

    if(rs.next()){
        // 2a. Record exists → UPDATE
        PreparedStatement ps = con.prepareStatement(
            "UPDATE student_profile SET fname=?, mname=?, lname=?, email=?, gender=?, address=?, marks10=?, marks12=?, diploma=?, graduation=?, branch=?, dob=?, phone=?, skills=?, resume_path=? WHERE id=?"
        );
        ps.setString(1, fname);
        ps.setString(2, mname);
        ps.setString(3, lname);
        ps.setString(4, email);
        ps.setString(5, gender);
        ps.setString(6, address);
        ps.setFloat(7, marks10==null||marks10.isEmpty()?0:Float.parseFloat(marks10));
        ps.setFloat(8, marks12==null||marks12.isEmpty()?0:Float.parseFloat(marks12));
        ps.setFloat(9, diploma==null||diploma.isEmpty()?0:Float.parseFloat(diploma));
        ps.setFloat(10, graduation==null||graduation.isEmpty()?0:Float.parseFloat(graduation));
        ps.setString(11, branch);
        ps.setDate(12, (dob==null||dob.isEmpty())?null:java.sql.Date.valueOf(dob));
        ps.setString(13, phone);
        ps.setString(14, skills);
        ps.setString(15, resumePath!=null?resumePath:rs.getString("resume_path"));
        ps.setString(16, studentId);
        ps.executeUpdate();
        ps.close();
    } else {
        // 2b. Record does not exist → INSERT
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO student_profile(id, fname, mname, lname, email, gender, address, marks10, marks12, diploma, graduation, branch, dob, phone, skills, resume_path) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        );
        ps.setString(1, studentId);
        ps.setString(2, fname);
        ps.setString(3, mname);
        ps.setString(4, lname);
        ps.setString(5, email);
        ps.setString(6, gender);
        ps.setString(7, address);
        ps.setFloat(8, marks10==null||marks10.isEmpty()?0:Float.parseFloat(marks10));
        ps.setFloat(9, marks12==null||marks12.isEmpty()?0:Float.parseFloat(marks12));
        ps.setFloat(10, diploma==null||diploma.isEmpty()?0:Float.parseFloat(diploma));
        ps.setFloat(11, graduation==null||graduation.isEmpty()?0:Float.parseFloat(graduation));
        ps.setString(12, branch);
        ps.setDate(13, (dob==null||dob.isEmpty())?null:java.sql.Date.valueOf(dob));
        ps.setString(14, phone);
        ps.setString(15, skills);
        ps.setString(16, resumePath);
        ps.executeUpdate();
        ps.close();
    }

    rs.close();
    check.close();
    con.close();

    // Redirect back to profile page
    response.sendRedirect("myprofile.jsp");

} catch(Exception e){
    out.println("Error: " + e);
}
%>