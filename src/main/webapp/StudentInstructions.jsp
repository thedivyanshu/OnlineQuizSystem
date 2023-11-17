<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.*"%>
<%@page import="com.onlineQuiz.pojo.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Dashboard</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">

		<%
        String name = StudentsDao.getStudentName(session.getAttribute("username").toString());
    %>


		<h2>
			Welcome
			<%= name %>
		</h2>


		<%
            int i = 1;
            String username = ""+session.getAttribute("username");
            ArrayList<Results> results = ResultsDao.getAllRecords(username);
        %>
		<table border=1>
			<tr>
				<th colspan="6"><h4>
						<font color="red">Previous Results</font>
					</h4></th>
			</tr>
			<tr>
				<th>Exam No.</th>
				<th>Subject</th>
				<th>No. of Questions</th>
				<th>Attempted</th>
				<th>Correct</th>
				<th>Wrong</th>
			</tr>
			<%
                for (Results e : results) {
            %>
			<tr>
				<td><%=i++%></td>
				<td><%=e.getSubject()%></td>
				<td><%=e.getQuestions()%></td>
				<td><%=e.getAttempted()%></td>
				<td><%=e.getCorrect()%></td>
				<td><%=e.getWrong()%></td>
			</tr>
			<%
                }
            %>
		</table>



		<h4>
			<font color="red">Instructions</font>
		</h4>
		<button class="logout-button" type="button"
			onclick="location.href='controller.LogoutStudent'">Logout</button>

		<%
                i = 1;
                ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
                for (Instructions e : allinsts) {
            %>

		<%=i++%>.
		<%=e.getInstruction()%>

		<%
                }
            %>


		<form action="Exam.jsp" method="get">
			<select name="subject" style="height: 45px; width: 300px;">
				<%
                    ArrayList<String> subjects = QuestionsDao.getAllSubjects();
                    for (String s : subjects) {
                %>
				<option value="<%=s%>"><%=s%></option>
				<%
                    }
                %>
			</select>
			<button type="submit">Start Test</button>
		</form>

	</div>
</body>
</html>
