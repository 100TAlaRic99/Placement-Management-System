<%-- 
    Document   : addstudent
    Created on : 30 Jan 2026, 2:59:09 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #f2f5fc;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: #4b57a3;
        width: 320px;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    .card label {
        color: #ffffff;
        font-size: 13px;
        margin-bottom: 4px;
        display: block;
    }

    .card input {
        width: 100%;
        padding: 6px 8px;
        margin-bottom: 12px;
        border: none;
        border-radius: 4px;
        outline: none;
        font-size: 13px;
    }

    .card input::placeholder {
        color: #999;
        font-size: 12px;
    }

    .btn {
        width: 100%;
        padding: 7px;
        border: none;
        border-radius: 20px;
        background: #ffffff;
        color: #4b57a3;
        font-size: 14px;
        cursor: pointer;
        font-weight: bold;
    }

    .btn:hover {
        background: #e6e9ff;
    }
</style>

</head>
<body>

    <div class="card">
        <form action="AddStudentServlet" method="post">

            <label>PRN Number</label>
            <input type="number" name="prn" placeholder="Students PRN number" required>

            <label>First Name</label>
            <input type="text" name="fname" placeholder="Students first name" required>

            <label>Middle Name</label>
            <input type="text" name="mname" placeholder="Students middle name">

            <label>Last Name</label>
            <input type="text" name="lname" placeholder="Students last name" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="Students email id" required>

            <input type="submit" value="Save" class="btn">

        </form>
    </div>

</body>
</html>

