<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<%@page import="com.onlineQuiz.Dao.ResultsDao"%>
<%@page import="com.onlineQuiz.pojo.Questions"%>
<%@page import="com.onlineQuiz.pojo.Results"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	<%
	String[] dbans = new String[100];
	String subject = request.getParameter("subject");
	ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords(subject);
	int i = 0;
	int size = allQuestions.size();
	for (Questions e : allQuestions) {
		dbans[i] = e.getAnswer();
		i++;
	}
	String[] userans = new String[100];
	for (int j = 0; j < size; j++) {
		userans[j] = request.getParameter(Integer.toString(j));
	}
	int correctanswer = 0;
	int unattempted = 0;
	int wronganswer = 0;
	for (int k = 0; k < size; k++) {
		if (userans[k].equalsIgnoreCase(dbans[k])) {
			correctanswer++;
		} else if (userans[k].equals("e")) {
			unattempted++;
		} else {
			wronganswer++;
		}
	}
	int attemped = size - unattempted;

	String username = "" + session.getAttribute("username");

	Results rt = new Results();
	rt.setUsername(username);
	rt.setSubject(subject);
	rt.setQuestions(size);
	rt.setAttempted(attemped);
	rt.setCorrect(correctanswer);
	rt.setWrong(attemped - correctanswer);
	ResultsDao.insertResult(rt);
	%>
	<h1>

		Results

	</h1>
	<%

	%>
	<h2>
		====== Name:<%=session.getAttribute("name")%>
		====== Username:<%=session.getAttribute("username")%>
		======
	</h2>

	<table>
		<tr>
			<th scope="row">1</th>
			<td>Total no. of Questions</td>
			<td><%=size%></td>
		</tr>
		<tr>
			<th scope="row">2</th>
			<td>Number Of Questions Attempted</td>
			<td><%=attemped%></td>
		</tr>
		<tr>
			<th scope="row">3</th>
			<td>Number of Correct Answers</td>
			<td><h4>
					<font color="green"><%=correctanswer%>
				</h4> </font></td>
		</tr>
		<tr>
			<th scope="row">4</th>
			<td>Number of Wrong Answers</td>
			<td><font color="red"><h4><%=attemped - correctanswer%></h4></font></td>
		</tr>

	</table>
	<input onclick="location.href='StudentInstructions.jsp'" type="button"
		value="Exit">
	</div>
</body>
</html>