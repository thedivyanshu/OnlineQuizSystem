<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.InstructionsDao"%>
<%@page import="com.onlineQuiz.pojo.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Instructions List</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	<h3>
		<br>
		List of Instructions<br>
		<br>
	</h3>
	<table border=1>
		<tr class="table-dark">
			<th>Sl. No.</th>
			<th>Instruction</th>
			<th>Operation</th>
			<th>Action</th>
		</tr>
		<tr>
		<tr>
			<%
				int i = 0;
				ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
				for (Instructions e : allinsts) {
			%>
		
		<tr>
			<td><%=++i%></td>
			<td><%=e.getInstruction()%></td>

			<td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
			<td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>

		</tr>
		<%
			}
		%>
		<tr>
			<th colspan="1" rowspan="2"><input type="button"
				class="btn btn-outline-success" value="Add Instruction"
				onclick="location.href='AddInstruction.jsp'"></th>
			<th colspan="2"><input type="hidden"></th>
			<th colspan="1"><input type="button"
				class="btn btn-outline-danger" value="Back to Panel"
				onclick="location.href='AdminPanel.jsp'"></th>
		</tr>
	</table>
</div>

</body>
</html>