<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineQuiz.Dao.InstructionsDao"%>
<%@page import="com.onlineQuiz.pojo.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating Instrctions</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
	<%
		String instoriginal = request.getParameter("instoriginal");
		String instmodified = request.getParameter("instmodified");

		int status = InstructionsDao.doUpdateNowRecord(instoriginal, instmodified);
		if (status > 0) {
			response.sendRedirect("InstructionList.jsp");
		} else if (status == -1) {
			out.print("error from databse");

		} else {
			out.print("excepion occured");
		}
	%>
	</div>
</body>
</html>