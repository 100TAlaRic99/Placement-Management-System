<%-- 
    Document   : deleteStudent
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String prn = request.getParameter("prn");

Connection con = null;
PreparedStatement ps = null;

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
        url = "jdbc:mysql://localhost:3306/student_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement("DELETE FROM student WHERE prn=?");
    ps.setString(1, prn);

    ps.executeUpdate();

    // Redirect after delete
    response.sendRedirect("studentlist.jsp");

}catch(Exception e){
    out.println("Error: " + e);
} finally {
    try{
        if(ps != null) ps.close();
        if(con != null) con.close();
    } catch(Exception e){}
}
%>