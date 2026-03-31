<%-- 
    Document   : editStudent
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String prn = request.getParameter("prn");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

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
        url = "jdbc:mysql://localhost:3306/student_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement("SELECT * FROM student WHERE prn=?");
    ps.setString(1, prn);
    rs = ps.executeQuery();

    if(rs.next()){
%>

<h2>Edit Student</h2>

<form action="updateStudent.jsp" method="post">
  <input type="hidden" name="prn" value="<%=rs.getString("prn")%>">

  First Name:
  <input type="text" name="fname" value="<%=rs.getString("fname")%>"><br><br>

  Last Name:
  <input type="text" name="lname" value="<%=rs.getString("lname")%>"><br><br>

  Email:
  <input type="email" name="email" value="<%=rs.getString("email")%>"><br><br>

  <input type="submit" value="Update Student">
</form>

<%
    }
} catch(Exception e){
    out.println("Error: " + e);
} finally {
    try{
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    } catch(Exception e){}
}
%>