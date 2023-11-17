<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.StudentsDao" %>
<%@page import="com.onlineQuiz.pojo.Students" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	<h3>
		<br>
		Update Student Details<br>
		<br>
	</h3>

	<table border=1>
		<tr class="table-dark">
			<th>Sl. No.</th>
			<th>Username</th>
			<th>Name</th>
			<th>Password</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
				int i = 1;
				ArrayList<Students> allstudents = StudentsDao.getAllRecords();
				for (Students e : allstudents) {
					if (request.getParameter("username").equals(e.getUsername())) {
			%>
		
		<tr class="table-primary">
			<form action="updatestudentnow.jsp">
				<input type="hidden" value="<%=e.getUsername()%>" type="text"
					name="usernameoriginal">
				<td><%=i++%></td>
				<td><input type="text" value="<%=e.getUsername()%>"
					name="uname" style="height: 30px; width: 300px;"></input></td>
				<td><input type="text" value=<%=e.getName()%> name="name"
					style="height: 30px; width: 300px;"></input></td>
				<td><input type="text" value=<%=e.getPassword()%> name="pass"
					style="height: 30px; width: 300px;"></input></td>
				<td><input type="submit" value="update"
					class="btn btn-outline-danger"></td>
				<td><a href="deletestudent.jsp?username=<%=e.getUsername()%>">Delete</a></td>
			</form>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td><%=i++%></td>
			<td><%=e.getUsername()%></td>
			<td><%=e.getName()%></td>
			<td><%=e.getPassword()%></td>
			<td><a href="updatestudent.jsp?username=<%=e.getUsername()%>">Update</a></td>
			<td><a href="deletestudent.jsp?username=<%=e.getUsername()%>">Delete</a></td>
		</tr>
		<%
			}
			}
		%>
		<tr>
			<th colspan="2"><input type="button"
				class="btn btn-outline-success" value="Add Student"
				onclick="location.href='AddStudent.jsp'"></th>
			<th colspan="2"><input type="hidden"></th>
			<th colspan="2"><input type="button"
				class="btn btn-outline-danger" value="Back to Panel"
				onclick="location.href='AdminPanel.jsp'"></th>
		</tr>
	</table>
</div>
</body>
</html>
