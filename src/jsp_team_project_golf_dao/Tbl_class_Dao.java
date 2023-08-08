package jsp_team_project_golf_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import jsp_team_project_golf_dto.Tbl_class_Dto;




public class Tbl_class_Dao {
	private DataSource datasource = null;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";

	public Tbl_class_Dao() {
		try {
			Class.forName(driver);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Tbl_class_Dto> getclasss() {
		ArrayList<Tbl_class_Dto> classs = new ArrayList<Tbl_class_Dto>();

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select*from Tbl_class_2023"; // 가지고 오고자 하는 쿼리문을 넣어준다
			con = DriverManager.getConnection(url, uid, upw); // 내어플리케이션이 오라클에 접속(connection)
			stmt = con.prepareStatement(query); // Preparedstatement(stmt)=커넥션객체에서 빨대가져옴(쿼리보낼거야)
			stmt.executeQuery(); // 빨대에서 쿼리를 오라클까지 전달하는 과정=채팅처럼 sql구문을 엔터쳐서 전달하면
			rs = stmt.executeQuery();  // 결과를 ResultSet으로 받아옴

			// 반복문을 사용해서 ArrayList에 가져온 데이터를 집어넣는다
			while (rs.next()) { // 데이터 한줄씩 가져오도록 해야니까 while문으로 돌림
				int c_no = rs.getInt("c_no"); // 자바객체로 바꾸기
				String class_area = rs.getString("class_area");
				int tuition = rs.getInt("tuition");
				int teacher_code = rs.getInt("teacher_code");

				Tbl_class_Dto tblClass = new Tbl_class_Dto(c_no, class_area, tuition, teacher_code);

				classs.add(tblClass); // 자바 배열에 가져온 데이터를 넣음
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close(); // 닫아줘야하는이유: 메모리 아낄 수 있어서?
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return classs;

	}

	
	public void Application(String class_name) {

		System.out.println("application()...");
		Connection con = null;
		PreparedStatement stmt = null; 

		try {
			String query ="insert into TBL_CLASS_2023 (class_name) values (mvc_board_seq.nextval,?)";
					
			con = datasource.getConnection();
			stmt = con.prepareStatement(query);

			stmt.setString(1, class_name);


			int rn = stmt.executeUpdate();
			System.out.println("write 한 갯수" + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}
	

}