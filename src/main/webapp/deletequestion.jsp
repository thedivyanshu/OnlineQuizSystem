<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.pojo.Questions"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Questions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container"> 
	<%
		Questions q = new Questions();
		q.setQuestion(request.getParameter("ques"));
		int status = QuestionsDao.deleteRecord(q);
		if (status > 0)
			response.sendRedirect("QuestionList.jsp?subject=" + request.getParameter("subject"));
		else
			out.print("Error");
	%>
	</div>
</body>
</html>