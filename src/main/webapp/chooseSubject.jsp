<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Quiz Creator</title>

</head>
<body>
<div class="container">
		<h2>Add New Quiz</h2>
	<form action="AddQuiz" method="post"
		style="margin: 20px;">
		Quiz Name : <input type="text" name="subject"
			style="height: 10px; width: 100px;"> <br>
		<br> <input type="submit" value="Add Quiz"
			class="btn btn-outline-primary">

	</form>
		<h2>Quizzes</h2>
	<table border=1>
		<tr tr class="table-dark">
			<th>Subject Number</th>
			<th>Subject</th>
			<th colspan="3">Action</th>
		</tr>
		<%
			int i = 0;
			ArrayList<String> subjects = QuestionsDao.getAllSubjects();
			for (String e : subjects) {
		%>

		<tr>
			<td><%=++i%></td>
			<td><%=e%></td>

			<td><a href="QuestionList.jsp?subject=<%=e%>">View</a></td>
			<td><a href="AddQuestion.jsp?subject=<%=e%>">Add Questions</a></td>
			<td><a href="deleteSubject.jsp?subject=<%=e%>">Delete</a></td>

		</tr>
		<%
			}
		%>
		<tr>
			<th colspan="5"><input type="button" value="Back to Panel"
				onclick="location.href='AdminPanel.jsp'"></th>
		</tr>

	</table>

</div>
</body>
</html>


















