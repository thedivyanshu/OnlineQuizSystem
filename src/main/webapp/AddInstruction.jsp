<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Instructions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	<h3>
		<br>
		<>Add Instruction<br>
		<br>
	</h3>
	<form action="InstructionInsert">

		Instruction
		<textarea name="inst" style="height: 100px; width: 500px;"></textarea>

		<br> <!-- Added a line break to create space between the textarea and the buttons -->

		<input type="submit" value="Add" class="button"> 
		<input type="button" onclick="location.href='AdminPanel.jsp'" value="Home" class="button"> 
		<input type="button" onclick="location.href='InstructionList.jsp'" value="Back" class="button">

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
