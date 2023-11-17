<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Questions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
		int status = QuestionsDao.deleteSubject(request.getParameter("subject"));
		if (status > 0)
			response.sendRedirect("chooseSubject.jsp");
		else
			out.print("Error");
	%>
</body>
</html>