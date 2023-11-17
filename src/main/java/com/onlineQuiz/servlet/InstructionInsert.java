package com.onlineQuiz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineQuiz.Dao.InstructionsDao;
import com.onlineQuiz.pojo.Instructions;

@WebServlet("/controller.InstructionInsert")
public class InstructionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InstructionInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		String instruction = request.getParameter("inst");

		Instructions ist = new Instructions();
		ist.setInstruction(instruction);

		boolean status = InstructionsDao.insertInstruction(ist);
		if (status) {
			String msg1 = "Instruction Added";
			response.sendRedirect("AddInstruction.jsp?msg1=" + msg1);
		} else {
			String msg2 = "Instruction not Added";
			response.sendRedirect("AddInstruction.jsp?msg2=" + msg2);
		}

	}

}
