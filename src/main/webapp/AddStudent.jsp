<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add students</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
		<h3>
			<br>Add Student<br>
		</h3>

		<form action="StudentInsert">
			<pre>
	<h4>Enter student Details:</h4>

Name:         <input type="text" name="name" required>

Username:     <input type="text" name="uname" required>

Password:     <input type="password" name="pass" required>

             
             <input type="submit" value="Register">
             <div class="button-container">
                 <input type="button"
						onclick="location.href='AdminPanel.jsp'" value="Home"
						class="button">
                 <input type="button"
						onclick="location.href='StudentList.jsp'" value="Back"
						class="button">
             </div>
</pre>
		</form>
		<div>
			<font color="red"> <%
 if (request.getParameter("msg2") != null)
 	out.print(request.getParameter("msg2"));
 %>
			</font> <font color="green"> <%
 if (request.getParameter("msg1") != null)
 	out.print(request.getParameter("msg1"));
 %>
			</font>
		</div>
	</div>
</body>
</html>
