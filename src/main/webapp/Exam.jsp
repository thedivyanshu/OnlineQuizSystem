<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.QuestionsDao"%>
<%@page import="com.onlineQuiz.pojo.Questions"%>
<%@ page import="java.util.*"%>

<html>
<head>
<title>Examination</title>
<script>
	
<%
ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords(request.getParameter("subject"));
int length= allQuestions.size();
String clock = request.getParameter("clock");
			if (clock == null){
				int tim = length*30;
				clock = String.valueOf(tim);}%>
	var timeout =
<%=clock%>
	function timer() {
		if (timeout > 0) {
			timeout--;
			document.forma.clock.value = "Time Over";
			document.forma.clock.value = timeout;
			window.setTimeout("timer()", 1000);
		} else {
			document.forma.clock.value = "Time Over";
			formb.submit();
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="style.css">

</head>

<body onload="timer()">

	<form name="forma" action="<%=request.getRequestURL()%>">

		<font color="green">Time Left <input size="1" name="clock"
			id="fno" value="<%=clock%>" style="background: #ffcdd2" readonly></font><br><br>
		<h4 style="color:red;"><%=request.getParameter("subject") %> Test</h4>
	</form>
	
	<form action="Result.jsp" name="formb">
		<font color="red">Questions Left</font>

		<table class="table table-hover">
			<thead>
				<tr class="table-warning">
					<th>s no.</th>
					<th>Question</th>
					<th>Option A</th>
					<th>Option B</th>
					<th>Option C</th>
					<th>Option D</th>
				</tr>
			</thead>
			<tr>

				<%
					int i = 1;

					int radioname = 0;
					
					for (Questions e : allQuestions) {
				%><%=i%>
				<%
					
				%>
			
			<tr>
				<td><%=i++%></td>
				<td><%=e.getQuestion()%></td>
				<td><input type="radio" value="a" name="<%=radioname%>"><%=e.getA()%></td>
				<td><input type="radio" value="b" name="<%=radioname%>"><%=e.getB()%></td>
				<td><input type="radio" value="c" name="<%=radioname%>"><%=e.getC()%></td>
				<td><input type="radio" value="d" name="<%=radioname%>"><%=e.getD()%></td>

			</tr>
			<input type="radio" value="e" name="<%=radioname%>" checked="checked" class="radioButton">
			
			<%
				radioname++;
				}
			%>
		</table>
		<input type="hidden" name="subject" value="<%=request.getParameter("subject")%>">
			<input  type="submit" value="submit">

	</form>
</body>
</div>
</html>
