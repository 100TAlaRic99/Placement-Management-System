<%-- 
    Document   : registerprocess
    Created on : 15 Mar 2026, 3:04:33 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name").trim();
String email = request.getParameter("email").trim();
String password = request.getParameter("password");
String confirm = request.getParameter("confirm");

String error = "";

// =====================
// Server-side validation
// =====================
if(name.isEmpty() || !name.matches("[a-zA-Z\\s]+")) 
    error += "Invalid Full Name.<br>";

if(email.isEmpty() || !email.matches("^\\S+@\\S+\\.\\S+$")) 
    error += "Invalid Email.<br>";

if(password.isEmpty() || password.length() < 6) 
    error += "Password must be at least 6 characters.<br>";

if(confirm == null || !password.equals(confirm)) 
    error += "Passwords do not match.<br>";

if(!error.isEmpty()) {
    request.setAttribute("message", error);
    request.setAttribute("messageType", "error");
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);
    return;
}

// =====================
// Database connection
// =====================
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
        url = "jdbc:mysql://localhost:3306/register";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    // =====================
    // Duplicate Email Check
    // =====================
    ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
    ps.setString(1, email);
    rs = ps.executeQuery();

    if(rs.next()){
        request.setAttribute("message", "Email already registered!");
        request.setAttribute("messageType", "error");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
        return;
    }

    // =====================
    // Insert Data into users table
    // =====================
    ps = con.prepareStatement(
        "INSERT INTO users(name,email,password) VALUES(?,?,?)"
    );

    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,password);

    int i = ps.executeUpdate();

    if(i > 0){
        request.setAttribute("message", "Registration Successful!");
        request.setAttribute("messageType", "success");
    } else {
        request.setAttribute("message", "Registration Failed!");
        request.setAttribute("messageType", "error");
    }

    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);

} catch(Exception e) {

    request.setAttribute("message", "Error: " + e.getMessage());
    request.setAttribute("messageType", "error");
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);

} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>