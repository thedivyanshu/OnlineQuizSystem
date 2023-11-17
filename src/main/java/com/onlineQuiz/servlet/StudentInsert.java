package com.onlineQuiz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineQuiz.Dao.StudentsDao;
import com.onlineQuiz.pojo.Students;

@WebServlet("/controller.StudentInsert")
public class StudentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		String name = request.getParameter("name");

		Students st = new Students();
		st.setName(name);
		st.setPassword(password);
		st.setUsername(username);

		boolean status = StudentsDao.insertStudent(st);
		if (status) {
			String msg1 = "Student Added";
			response.sendRedirect("AddStudent.jsp?msg1=" + msg1);
		} else {
			String msg2 = "Student not Added";
			response.sendRedirect("AddStudent.jsp?msg2=" + msg2);
		}

	}

}
