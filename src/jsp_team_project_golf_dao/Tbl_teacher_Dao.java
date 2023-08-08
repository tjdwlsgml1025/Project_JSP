package jsp_team_project_golf_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import jsp_team_project_golf_dto.Tbl_teacher_Dto;

public class Tbl_teacher_Dao {

    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String uid = "scott";
    private String upw = "tiger";

    public Tbl_teacher_Dao() {
        try {
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Tbl_teacher_Dto> getclasss() {
        ArrayList<Tbl_teacher_Dto> teacherList = new ArrayList<Tbl_teacher_Dto>();

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "select * from Tbl_teacher_2023"; // 가지고 오고자 하는 쿼리문을 넣어준다
            con = DriverManager.getConnection(url, uid, upw); // 내어플리케이션이 오라클에 접속(connection)
            stmt = con.prepareStatement(query); // Preparedstatement(stmt)=커넥션객체에서 빨대가져옴(쿼리보낼거야)
            rs = stmt.executeQuery(); // 결과를 ResultSet으로 받아옴

            // 반복문을 사용해서 ArrayList에 가져온 데이터를 집어넣는다
            while (rs.next()) { // 데이터 한줄씩 가져오도록 해야니까 while문으로 돌림
                int teacher_code = rs.getInt("teacher_code");
                String teacher_name = rs.getString("teacher_name");
                String class_name = rs.getString("class_name");
                int class_price = rs.getInt("class_price");
                String teacher_regist_date = rs.getString("teacher_regist_date");

                Tbl_teacher_Dto teacher = new Tbl_teacher_Dto(teacher_code, teacher_name, class_name, class_price,
                        teacher_regist_date);

                teacherList.add(teacher); // 자바 배열에 가져온 데이터를 넣음
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close(); // 닫아줘야하는 이유: 메모리 아낄 수 있어서?
                if (stmt != null)
                    stmt.close();
                if (con != null)
                    con.close();

            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return teacherList;
    }

    public int calculateTotalSales(int teacherCode) {
        int totalSales = 0;

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT SUM(class_price) AS total_sales FROM Tbl_teacher_2023 WHERE teacher_code=?";
            con = DriverManager.getConnection(url, uid, upw);
            stmt = con.prepareStatement(query);
            stmt.setInt(1, teacherCode);
            rs = stmt.executeQuery();

            if (rs.next()) {
                totalSales = rs.getInt("total_sales");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (con != null)
                    con.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return totalSales;
    }

 

}
