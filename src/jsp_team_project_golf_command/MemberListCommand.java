package jsp_team_project_golf_command;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp_team_project_golf_dao.Tbl_gmember_Dao;
import jsp_team_project_golf_dto.Tbl_gmember_Dto;

public class MemberListCommand implements GolfCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        Tbl_gmember_Dao memberDao = new Tbl_gmember_Dao();
        
        List<Tbl_gmember_Dto> dtos = memberDao.getclasss();
    	

    	
        request.setAttribute("memberlist", dtos);
    }
}
