<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.dbUtil.DbUtil"%>
<%@page import="com.onlineQuiz.Dao.InstructionsDao"%>
<%@page import="com.onlineQuiz.pojo.Instructions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Instructions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<%
		Instructions i = new Instructions();
		i.setInstruction(request.getParameter("inst"));
		int status = InstructionsDao.deleteRecord(i);
		if (status > 0)
			response.sendRedirect("InstructionList.jsp");
		else
			out.print("Error");
	%>
	</div>
</body>
</html>