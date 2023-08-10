package edu.global.tp.vote.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.global.tp.vote.dao.VoteDao;
import edu.global.tp.vote.dto.MemberDto;
import edu.global.tp.vote.dto.VoteDto;

public class VoteMemberCommand implements VoteCommand {
	// 인터페이스이므로 메소드 선언만 가능하다. 구현은 자손이 한다.
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	      VoteDao dao = new VoteDao();
	      
	      int result = dao.insertVote(request, response);
	      
	       request.setAttribute("voteMember", result);
	}
}
