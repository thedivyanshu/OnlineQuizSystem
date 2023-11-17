<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<%
		if (session.getAttribute("username") != null) {

		} else {
			String msg2 = "Please Login as Admin to Continue";
			response.sendRedirect("AdminLogin.jsp?msg2=" + msg2);
		}
	%>
		<h1>
			Welcome <%
					out.println(session.getAttribute("username"));
				%>
		</h1>
	<input onclick="location.href='StudentList.jsp';" type="button"value="Add/Update Student">
	<input onclick="location.href='InstructionList.jsp';" type="button"value="Add/Update Instructions">
	<input onclick="location.href='chooseSubject.jsp'" type="button"value="Manage Questions and Quizzes">
	<input onclick="location.href='LogoutAdmin'" type="button"value="Logout">
</div>
</body>
</html>


