package edu.golbal.ex.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.global.tp.vote.command.VoteCommand;
import edu.global.tp.vote.command.VoteListCommand;
import edu.global.tp.vote.command.VoteMainCommand;
import edu.global.tp.vote.command.VoteMemberCommand;
import edu.global.tp.vote.command.VoteMemberListCommand;
import edu.global.tp.vote.command.VoteResultCommand;
import edu.global.tp.vote.dao.VoteDao;

@WebServlet("/vote/*")
public class VoteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public VoteController() {
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
		VoteCommand command = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath()+"/vote";
		String com = uri.substring(conPath.length());
		String forwardPrefix = "/";
		VoteDao vote = new VoteDao();
		String context = request.getContextPath();
		System.out.println("=================" + context);

		if (com.equals("/votemain.do")) {
			command = new VoteMainCommand();
			command.execute(request, response);

			viewPage = "voteindex.jsp";
			
		} else if (com.equals("/voteMemberList.do")) { // 후보자 조회
			command = new VoteMemberListCommand();
			command.execute(request, response);

			viewPage = "voteMemberList.jsp";

		} else if (com.equals("/voteMember.do")) {
			command = new VoteMemberCommand();
			command.execute(request, response);

			viewPage = "voteMember.jsp";
			
		} else if (com.equals("/voteList.do")) {
			command = new VoteListCommand();
			command.execute(request, response);

			viewPage = "voteList.jsp";
			
		} else if (com.equals("/voteResult.do")) {
			command = new VoteResultCommand();
			command.execute(request, response);

			viewPage = "voteResult.jsp";
			
		} else if (com.equals("/vote.do")) {
			command = new VoteMemberCommand();
	         command.execute(request, response);
	         int result = (int) request.getAttribute("voteMember");
	         System.out.println(result);
	         response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out=response.getWriter(); if(result == 1) {
	         out.println("<script>");
	         out.println("alert('투표하기 정보가 정상적으로 등록 되었습니다!'); location.href='"+context+
	         "/votemain.do"+"'; "); out.println("</script>"); out.flush(); }else {
	         out.println("<script>");
	         out.println("alert('등록실패!'); location.href='"+context+"/votemain.do"+"'; ");
	         out.println("</script>"); out.flush(); }
	         
	         viewPage = "/votemain.do";
	      }

		 else {
			viewPage = "/votemain.do";
		}
		String[] tmpCom = viewPage.split("\\.");
		if("do".equals(tmpCom[1])) {
	         String redirectPage = conPath + viewPage;
	         response.sendRedirect(redirectPage);
	      } else {
	         String forwardPage = forwardPrefix + viewPage;
	         RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPage);
	         dispatcher.forward(request, response);
	      }
		
	}

}
