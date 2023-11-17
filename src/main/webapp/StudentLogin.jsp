<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Student Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">
    <h1>Student Login</h1>
    <font color="red">
        <% if (request.getParameter("msg") != null) { %>
            <%= request.getParameter("msg") %>
        <% } %>
    </font>
    <font color="green">
        <% if (request.getParameter("msg1") != null) { %>
            <%= request.getParameter("msg1") %>
        <% } %>
    </font>
    <form action="ValidateStudent" method="post">
        
            Username : <input type="text" name="uname" required>
            Password : <input type="password" name="pass" required>
            <input type="submit" value="Login" >
            <input onclick="location.href='index.html'" type="button" value="Exit" >
        
    </form>
    </div>
</body>

</html>
