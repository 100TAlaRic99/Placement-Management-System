<%-- 
    Document   : result
    Created on : 12 Mar 2026, 4:03:14 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int correct=0;
int total=0;

/* GET TEST ID */
String tid=request.getParameter("test_Id");
if(tid==null) tid=request.getParameter("id");

int testId=1;
if(tid!=null && !tid.equals("")){
    testId=Integer.parseInt(tid);
}

/* DATABASE CONNECTION */
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
    url = "jdbc:mysql://localhost:3306/test_db";
    user = "root";
    pass = "spdt";
} else {
    url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
}

con = DriverManager.getConnection(url, user, pass);

/* FIRST QUERY : CALCULATE SCORE */
ps = con.prepareStatement(
    "SELECT * FROM questions WHERE test_id=? ORDER BY id LIMIT 30"
);
ps.setInt(1,testId);
rs = ps.executeQuery();

int i=0;
while(rs.next()){
    total++;
    String correctAns = rs.getString("answer");
    String userAns = request.getParameter("q"+i);

    if(userAns!=null && userAns.equals(correctAns)){
        correct++;
    }
    i++;
}

/* PERCENTAGE */
int percent = 0;
if(total > 0){
    percent = (correct * 100) / total;
}

/* STATUS */
String status="Needs Improvement";
if(percent >= 70) status="Excellent";
else if(percent >= 40) status="Average";

/* SECOND QUERY FOR REVIEW */
ps = con.prepareStatement(
    "SELECT * FROM questions WHERE test_id=? ORDER BY id LIMIT 30"
);
ps.setInt(1,testId);
rs = ps.executeQuery();

i=0;
%>

<!DOCTYPE html>

<html>

<head>

<title>Test Result</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
margin:0;
padding:0;
}

.container{
width:700px;
margin:auto;
margin-top:40px;
}

.result-card{
background:linear-gradient(90deg,#1d3557,#2a9d8f);
color:white;
padding:40px;
border-radius:15px;
text-align:center;
}

.score{
font-size:60px;
font-weight:bold;
}

.status{
color:#ffb703;
font-size:20px;
margin-top:10px;
}

.info{
margin-top:10px;
font-size:16px;
}

.buttons{
margin-top:25px;
display:flex;
gap:20px;
}

.btn{
flex:1;
padding:12px;
border-radius:8px;
border:none;
font-size:16px;
cursor:pointer;
}

.dashboard{
background:#e5e7eb;
}

.retake{
background:#2563eb;
color:white;
}

.review{
margin-top:30px;
width:100%;
}

.card{
background:white;
border:1px solid #ffb3b3;
border-radius:10px;
padding:15px;
margin-bottom:15px;
}

.question{
font-weight:bold;
margin-bottom:8px;
}

.wrong{
color:red;
margin:3px 0;
}

.correct{
color:green;
margin:3px 0;
}

</style>

</head>

<body>

<div class="container">

<div class="result-card">

<h2>Your Score</h2>

<div class="score"><%=percent%>%</div>

<div class="status"><%=status%></div>

<div class="info">
<%=correct%>/<%=total%> Correct
</div>

</div>

<div class="buttons">

<button class="btn dashboard"
onclick="location.href='mocktest-dashboard.jsp'">
Dashboard
</button>

<button class="btn retake"
onclick="location.href='<%=request.getContextPath()%>/TestServlet?id=<%=testId%>'">
Retake Test
</button>

</div>

<div class="review">

<h2>Answer Review</h2>

<%

while(rs.next()){

String question=rs.getString("question");

String correctAns=rs.getString("answer");

String userAns=request.getParameter("q"+i);

%>

<div class="card">

<div class="question">
Q<%=i+1%>. <%=question%>
</div>

<p class="wrong">

<%

if(userAns==null){
%>

Your Answer: Not Answered

<%
}else{
%>

Your Answer: <%=userAns%>

<%
}
%>

</p>

<p class="correct">
Correct Answer: <%=correctAns%>
</p>

</div>

<%
i++;
}
%>

</div>

</div>

</body>

</html>

<%

if(rs!=null)rs.close();
if(ps!=null)ps.close();
if(con!=null)con.close();

%>

