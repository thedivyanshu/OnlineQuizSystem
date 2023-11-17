<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao" %>
<%@page import="com.onlineQuiz.pojo.Questions" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Questions</title>
 <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	<h3>
		<br>
		Update Question<br>
		<br>
	</h3>

	<%
	int i = 0;
	ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords(request.getParameter("subject"));
	for (Questions e : allQuestions) {
		if (request.getParameter("ques").equals(e.getQuestion())) {
	%>
	<form action="updatequestionnow.jsp">
		<input type="hidden" value="<%=e.getQuestion()%>" type="text"
			name="quesoriginal"> <input type="hidden"
			value="<%=request.getParameter("subject")%>" type="text"
			name="subject">
		<pre>
	Question: <textarea name="quesmodified"
				style="height: 100px; width: 700px;"><%=e.getQuestion()%>"</textArea>
	
	Option A: <input type="text" value=<%=e.getA()%> name="opta"
				style="height: 30px; width: 700px;"></input>
	
	Option B: <input type="text" value=<%=e.getB()%> name="optb"
				style="height: 30px; width: 700px;"></input>
	
	Option C: <input type="text" value=<%=e.getC()%> name="optc"
				style="height: 30px; width: 700px;"></input>
	
	Option D: <input type="text" value=<%=e.getD()%> name="optd"
				style="height: 30px; width: 700px;"></input>
		
	Answer:   <select name="answer" style="height: 30px; width: 100px;">
			<option value="a">a</option>
			<option value="b">b</option>
			<option value="c">c</option>
			<option value="d">d</option>
		</select>
		
	<input type="submit" value="update"> <a
				href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a>                                               <input
				type="button" value="Add Question"
				onclick="location.href='AddQuestion.jsp?subject=<%=request.getParameter("subject")%>'"> <input
				type="button"value="Back to Panel"
				onclick="location.href='AdminPanel.jsp'">
		</pre>
	</form>

	<%
			break;
	}
	}
	%>
</div>
</body>
</html>
