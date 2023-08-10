package edu.golbal.ex.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp_team_project_golf_command.GolfCommand;
import jsp_team_project_golf_command.MemberListCommand;
import jsp_team_project_golf_command.TeacherListCommand;

@WebServlet("/golf/*")
public class GolfController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GolfController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("doGet() ..");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost() ..");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("actionDo() ..");

		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		GolfCommand command = null;

		// 위의 세 줄은 http://localhost:8282/jsp_board/list.do에서 list.do를 꺼내기 위한 코드들
		String uri = request.getRequestURI();
		String conPath = request.getContextPath() + "/golf";
		String forwardPrefix = "/golf_jsp/";
		String com = uri.substring(conPath.length());

		System.out.println(com);

		if (com.equals("/teacher.do")) {
			command = new TeacherListCommand();
			command.execute(request, response);

			System.out.println(com);

			viewPage = "teacher.jsp";

		} else if (com.equals("/member.do")) {

			command = new MemberListCommand();
			command.execute(request, response);

			viewPage = "member.jsp";
			
		//} else if (com.equals("/result.do")) {

		//	command = new CalculateCommand();
		//	command.execute(request, response);

		//	viewPage = "result.jsp";

		} else if (com.equals("golf_jsp/insert.jsp")) {
			/* command = new ApplicationCommand(); */
			/* command.execute(request, response); */
			viewPage = "insert_result.jsp";
		} else {
			System.out.println("에러입니다.");			
			System.out.println(viewPage);
			viewPage = "/member.do";
		}

		String[] tmpCom = viewPage.split("\\.");
		if ("do".equals(tmpCom[1])) {
			String redirectPage = conPath + viewPage;
			response.sendRedirect(redirectPage);
		} else {
			String forwardPage = forwardPrefix + viewPage;
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPage);
			dispatcher.forward(request, response);
		}

		/*
		 * System.out.println("==============================" + viewPage);
		 * 
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		 * dispatcher.forward(request, response);
		 */
	}
}
