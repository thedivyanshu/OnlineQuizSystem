<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Add Question</title>
</head>
<body>
	<div class="container">
	<h3>
		<br>
		Add Question<br>
		<br>
	</h3>
	<form action="QuestionInsert">
		<pre>
			<%String sub = request.getParameter("subject");%><input type="hidden"
				name="subject" value='<%=sub%>'>
Question:    <textarea name="Question"
				style="height: 75px; width: 700px;"></textarea>

Option A:    <input type="text" name="option1"
				style="height: 30px; width: 700px;">

Option B:    <input type="text" name="option2"
				style="height: 30px; width: 700px;">

Option C:    <input type="text" name="option3"
				style="height: 30px; width: 700px;">

Option D:    <input type="text" name="option4"
				style="height: 30px; width: 700px;">

Answer:      <select name="answer" style="height: 30px; width: 700px;">
             <option value="a">a</option>
             <option value="b">b</option>
             <option value="c">c</option>
             <option value="d">d</option>
             </select>
             </pre>
		<input type="submit" value="Done"> <input type="button"
			onclick="location.href='AdminPanel.jsp'" value="Home"> <input
			type="button"
			onclick="location.href='QuestionList.jsp?subject=<%=sub%>'"
			value="Back">

	</form>
	<div>
		<font color="red"> <%
 	if (request.getParameter("msg2") != null)
 		out.print(request.getParameter("msg2"));
 %>
		</font> <font color="green"> <%
 	if (request.getParameter("msg1") != null)
 		out.print(request.getParameter("msg1"));
 %>
		</font>
	</div>
</div>
</body>
</html>