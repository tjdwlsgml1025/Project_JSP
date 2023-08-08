package jsp_team_project_golf_command;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp_team_project_golf_dao.Tbl_teacher_Dao;
import jsp_team_project_golf_dto.Tbl_teacher_Dto;

public class TeacherListCommand implements GolfCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        Tbl_teacher_Dao teacherDao = new Tbl_teacher_Dao();
        
        // 테이블에 있는 모든 데이터를 가져옵니다.
        List<Tbl_teacher_Dto> dtos = teacherDao.getclasss();
    	

    	
        request.setAttribute("teacherlist", dtos);
    }
}
