<%-- 
    Document   : questions
    Created on : 27 Feb 2026, 9:09:02 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int testId = Integer.parseInt(request.getParameter("test_Id"));

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
        url = "jdbc:mysql://localhost:3306/test_db";
        user = "root";
        pass = "spdt";
    } else {
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
    }

    con = DriverManager.getConnection(url, user, pass);

    ps = con.prepareStatement("SELECT * FROM questions WHERE test_id=? LIMIT 30");
    ps.setInt(1,testId);

    rs = ps.executeQuery();

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Mock Test</title>

<style>

body{font-family:Arial;background:#f5f7fb;margin:0}

.header{
display:flex;
justify-content:space-between;
align-items:center;
padding:15px 40px;
background:white;
box-shadow:0 2px 5px rgba(0,0,0,0.1)
}

.timer{
background:#f1f3f6;
padding:6px 15px;
border-radius:20px;
margin-right:15px
}

.submit{
background:#e53935;
color:white;
border:none;
padding:8px 18px;
border-radius:6px;
cursor:pointer
}

.main{
display:flex;
padding:30px 60px;
gap:30px
}

.left{flex:3}

.right{
flex:1;
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 2px 8px rgba(0,0,0,0.05)
}

.card{
background:white;
padding:20px;
border-radius:12px;
margin-bottom:20px;
box-shadow:0 2px 8px rgba(0,0,0,0.05)
}

.options{
display:flex;
flex-direction:column;
gap:10px;
margin-top:10px;
}

.option{
border:1px solid #e0e0e0;
padding:12px;
border-radius:10px;
cursor:pointer;
display:block;
}

.option:hover{
background:#f1f5ff;
border-color:#2563eb
}

.navbtn{
display:inline-block;
padding:8px 12px;
margin:4px;
background:#e0e0e0;
border-radius:8px;
cursor:pointer
}

.active{
background:#2563eb;
color:white
}

.answered{
background:#22c55e !important;
color:white;
}

.next{
background:#2563eb;
color:white;
padding:10px 25px;
border:none;
border-radius:8px;
cursor:pointer
}

.prev{
background:#e0e0e0;
padding:10px 25px;
border:none;
border-radius:8px;
cursor:pointer
}

.btn-group{
display:flex;
justify-content:space-between;
margin-top:20px
}

.modal{
display:none;
position:fixed;
z-index:1000;
left:0;
top:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.6);
}

.modal-content{
background:white;
width:400px;
margin:15% auto;
padding:25px;
border-radius:10px;
text-align:center;
}

.modal-buttons{
margin-top:20px;
display:flex;
justify-content:center;
gap:15px;
}

.continue-btn{
padding:10px 20px;
background:#e0e0e0;
border:none;
border-radius:6px;
cursor:pointer
}

.final-submit{
padding:10px 20px;
background:#2563eb;
color:white;
border:none;
border-radius:6px;
cursor:pointer
}

</style>

<script>

let current = 0;

function showQuestion(index){

let qs=document.querySelectorAll(".question");

qs.forEach(q=>q.style.display="none");

qs[index].style.display="block";

let nav=document.querySelectorAll(".navbtn");

nav.forEach(n=>n.classList.remove("active"));

nav[index].classList.add("active");

current=index;

}

function nextQ(){

let total=document.querySelectorAll(".question").length;

if(current<total-1){
showQuestion(current+1);
}

}

function prevQ(){

if(current>0){
showQuestion(current-1);
}

}

window.onload=function(){
showQuestion(0);
}

document.addEventListener("change", function(e){

if(e.target.type==="radio"){

let name=e.target.name;

let index=name.replace("q","");

let nav=document.querySelectorAll(".navbtn");

nav[index].classList.add("answered");

}

});

function openModal(){

let total=document.querySelectorAll(".question").length;

let answered=document.querySelectorAll("input[type=radio]:checked").length;

document.getElementById("answerCount").innerText=answered;

document.getElementById("totalCount").innerText=total;

document.getElementById("submitModal").style.display="block";

}

function closeModal(){

document.getElementById("submitModal").style.display="none";

}

function submitTest(){

document.getElementById("testForm").submit();

}

</script>

</head>

<body>

<div class="header">

<h2>Mock Test</h2>

<div>

<span class="timer">⏱ 30:00</span>

<button class="submit" type="button" onclick="openModal()">
Submit
</button>

</div>

</div>

<div class="main">

<div class="left">

<form id="testForm" action="result.jsp" method="post">

<!-- IMPORTANT FIX -->

<input type="hidden" name="test_Id" value="<%=testId%>">

<%

int i=0;

while(rs.next()){

%>

<div class="card question">

<p><b>Question <%=i+1%> of 30</b></p>

<h3><%=rs.getString("question")%></h3>

<div class="options">

<label class="option">

<input type="radio" name="q<%=i%>" value="<%=rs.getString("option1")%>">

<%=rs.getString("option1")%>

</label>

<label class="option">

<input type="radio" name="q<%=i%>" value="<%=rs.getString("option2")%>">

<%=rs.getString("option2")%>

</label>

<label class="option">

<input type="radio" name="q<%=i%>" value="<%=rs.getString("option3")%>">

<%=rs.getString("option3")%>

</label>

<label class="option">

<input type="radio" name="q<%=i%>" value="<%=rs.getString("option4")%>">

<%=rs.getString("option4")%>

</label>

</div>

<div class="btn-group">

<button type="button" class="prev" onclick="prevQ()">
Previous
</button>

<button type="button" class="next" onclick="nextQ()">
Next
</button>

</div>

</div>

<%

i++;

}

%>

</form>

</div>

<div class="right">

<h3>Questions</h3>

<%

for(int j=0;j<i;j++){

%>

<span class="navbtn" onclick="showQuestion(<%=j%>)">
<%=j+1%>
</span>

<%

}

%>

</div>

</div>

<div id="submitModal" class="modal">

<div class="modal-content">

<h2>Submit Test?</h2>

<p>

You've answered

<b><span id="answerCount">0</span></b>

of

<b><span id="totalCount">30</span></b>

questions.

</p>

<div class="modal-buttons">

<button class="continue-btn" onclick="closeModal()">
Continue Test
</button>

<button class="final-submit" onclick="submitTest()">
Submit
</button>

</div>

</div>

</div>

</body>

</html>

<%

}catch(Exception e){

out.println(e);

}

finally{

if(rs!=null)rs.close();

if(ps!=null)ps.close();

if(con!=null)con.close();

}

%>