<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<%@page import="com.onlineQuiz.pojo.Questions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question List</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
<h3>
	<br>
	 <%=request.getParameter("subject")%>
		Questions
	<br>
	<br>
</h3>


<table border=1>
	<tr tr class="table-dark">
		<th>Sl. No.</th>
		<th>Question</th>
		<th>Option A</th>
		<th>Option B</th>
		<th>Option C</th>
		<th>Option D</th>
		<th>Correct Answer</th>
		<th>Update</th>
		<th>Delete</th>
	</tr>
	<tr>
		<%
				int i = 0;
				String subject = request.getParameter("subject");
				ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords(subject);
				for (Questions e : allQuestions) {
			%>
	
	<tr>
		<td><%=++i%></td>
		<td><%=e.getQuestion()%></td>
		<td><%=e.getA()%></td>
		<td><%=e.getB()%></td>
		<td><%=e.getC()%></td>
		<td><%=e.getD()%></td>
		<td><%=e.getAnswer()%></td>
		<td><a
			href="updatequestion.jsp?ques=<%=e.getQuestion()%>&subject=<%=subject%>">Update</a></td>
		<td><a
			href="deletequestion.jsp?ques=<%=e.getQuestion()%>&subject=<%=subject%>">Delete</a></td>
	</tr>
	<%
			}
		%>
	<th colspan="4"><input type="button" value="Add Question"
		class="btn btn-outline-success"
		onclick="location.href='AddQuestion.jsp?subject=<%=subject%>'">
	</th>

	<th colspan="5"><input type="button"
		class="btn btn-outline-danger" value="Back to Panel"
		onclick="location.href='AdminPanel.jsp'"></th>

</table>
</div>
</body>
</html>