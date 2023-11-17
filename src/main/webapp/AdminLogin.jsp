<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div class="container">
    <h1>Admin Login</h1>
    <font color="red">
        <% if (request.getParameter("msg2") != null) { %>
            <%= request.getParameter("msg2") %>
        <% } %>
    </font>
    <font color="green">
        <% if (request.getParameter("msg1") != null) { %>
            <%= request.getParameter("msg1") %>
        <% } %>
    </font>
    <form action="ValidateAdmin" method="post">
        
            Username : <input type="text" name="uname">
            Password : <input type="password" name="pass">
            <input type="submit" value="Login" >
            <input onclick="location.href='index.html'" type="button" value="Exit" >
        
    </form>
    </div>
</body>

</html>
