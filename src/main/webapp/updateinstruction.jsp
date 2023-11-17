<%--Document : updateinstruction--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.InstructionsDao" %>
<%@page import="com.onlineQuiz.pojo.Instructions" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Instructions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<h3>
		<br>
		Update Instructions<br>
		<br>
	</h3>
	<table border=1>
		<tr tr class="table-dark">
			<th>Sl. No.</th>
			<th>Instruction</th>
			<th>Update</th>
			<th>Delete>
		</tr>
		<tr>
		<tr>
			<%
				int i = 1;
				ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
				for (Instructions e : allinsts) {
					if (request.getParameter("inst").equals(e.getInstruction())) {
			%>
		
		<tr class="table-primary">
			<form action="updateinstructionnow.jsp">
				<input type="hidden" value="<%=e.getInstruction()%>" type="text"
					name="instoriginal">
				<td><%=i++%></td>
				<td><textarea name="instmodified"
						style="height: 100px; width: 500px;"><%=e.getInstruction()%></textarea></td>
				<td><input type="submit" value="update"
					class="btn btn-outline-danger"></td>
				<td><a
					href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>
			</form>
		</tr>
		<%
			} else {
		%>


		<tr>
			<td><%=i++%></td>
			<td><%=e.getInstruction()%></td>

			<td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
			<td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>

		</tr>
		<%
			}
			}
		%>
		<tr>
			<th colspan="1" rowspan="2"><input type="button"
				value="Add Instruction" onclick="location.href='AddInstruction.jsp'"></th>
			<th colspan="2"><input type="hidden"></th>
			<th colspan="1"><input type="button" value="Back to Panel"
				onclick="location.href='AdminPanel.jsp'"></th>
		</tr>
	</table>
	</div>
</body>
</html>