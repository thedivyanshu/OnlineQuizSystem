package com.onlineQuiz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineQuiz.Dao.StudentsDao;
import com.onlineQuiz.pojo.Students;

@WebServlet("/controller.ValidateStudent")
public class ValidateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateStudent() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String username = request.getParameter("uname");
		String password = request.getParameter("pass");

		Students sd = new Students();
		sd.setUsername(username);
		sd.setPassword(password);

		boolean status = StudentsDao.doValidate(sd);

		if (status) {

			// Logged in as student do something (pending)
			HttpSession studentsession = request.getSession();
			studentsession.setAttribute("username", sd.getUsername());
			studentsession.setAttribute("name", sd.getName());
			response.sendRedirect("StudentInstructions.jsp");

		} else {
			String msg = "Invalid Username or Password";
			response.sendRedirect("StudentLogin.jsp?msg=" + msg);

		}

	}
}
