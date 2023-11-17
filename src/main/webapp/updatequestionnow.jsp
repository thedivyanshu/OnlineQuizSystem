<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.onlineQuiz.Dao.QuestionsDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating Questions</title>
 <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<%
		String OriginalQuestion = request.getParameter("quesoriginal");
		String newQuestion = request.getParameter("quesmodified");
		String opta = request.getParameter("opta");
		String optb = request.getParameter("optb");
		String optc = request.getParameter("optc");
		String optd = request.getParameter("optd");
		String ans = request.getParameter("answer");
		String subject = request.getParameter("subject");
		int status = QuestionsDao.doUpdateNowRecord(OriginalQuestion, newQuestion, opta, optb, optc, optd, ans);
		if (status > 0) {
			response.sendRedirect("QuestionList.jsp?subject=" + subject);
		} else if (status == -1) {
			out.print("error from databse");

		} else {
			out.print("excepion occured");
		}
	%>
	</div>
</body>
</html>