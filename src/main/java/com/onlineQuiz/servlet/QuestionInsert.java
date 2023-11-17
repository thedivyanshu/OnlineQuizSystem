package com.onlineQuiz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineQuiz.Dao.QuestionsDao;
import com.onlineQuiz.pojo.Questions;

@WebServlet("/controller.QuestionInsert")
public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String subject = request.getParameter("subject");
		String question = request.getParameter("Question");
		String a = request.getParameter("option1");
		String b = request.getParameter("option2");
		String c = request.getParameter("option3");
		String d = request.getParameter("option4");
		String answer = request.getParameter("answer");

		Questions q = new Questions();
		q.setA(a);
		q.setB(b);
		q.setC(c);
		q.setD(d);
		q.setAnswer(answer);
		q.setQuestion(question);
		q.setSubject(subject);

		boolean status = QuestionsDao.insertQuestion(q);

		if (status) {
			String msg1 = "Question Added";
			response.sendRedirect("AddQuestion.jsp?msg1=" + msg1 + "&subject=" + subject);
		} else {
			String msg2 = "Question not Added";
			response.sendRedirect("AddQuestion.jsp?msg2=" + msg2 + "&subject=" + subject);
		}

	}

}