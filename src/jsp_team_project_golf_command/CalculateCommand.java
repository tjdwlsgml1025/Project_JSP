package jsp_team_project_golf_command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jsp_team_project_golf_dao.Tbl_teacher_Dao;
import jsp_team_project_golf_dto.Tbl_teacher_Dto;

public class CalculateCommand implements GolfCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        Tbl_teacher_Dao teacherDao = new Tbl_teacher_Dao();

        // 특정 강사의 총 매출을 계산합니다. 여기서는 강사 코드를 1로 가정합니다.
        int teacherCode = 1; // 적절한 강사 코드로 변경하세요.
        int totalSales = teacherDao.calculateTotalSales(teacherCode);

        // 강사 리스트를 가져옵니다.
        List<Tbl_teacher_Dto> dtos = teacherDao.getclasss();

        System.out.println("====" + dtos.size());

        request.setAttribute("teacherlist", dtos);
        request.setAttribute("totalSales", totalSales);
    }
}
