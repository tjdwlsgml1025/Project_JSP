package jsp_team_project_golf_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jsp_team_project_golf_dto.Tbl_gmember_Dto;

public class Tbl_gmember_Dao {

   private String driver = "oracle.jdbc.driver.OracleDriver";
   private String url = "jdbc:oracle:thin:@localhost:1521:xe";
   private String uid = "scott";
   private String upw = "tiger";

   public Tbl_gmember_Dao() {
      try {
         Class.forName(driver);

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

  
   public ArrayList<Tbl_gmember_Dto> getclasss() {
	    ArrayList<Tbl_gmember_Dto> gmemberList = new ArrayList<Tbl_gmember_Dto>();

      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;

      try {
         String query = "select*from Tbl_gmember_2023"; // 가지고 오고자 하는 쿼리문을 넣어준다
         con = DriverManager.getConnection(url, uid, upw); // 내어플리케이션이 오라클에 접속(connection)
         stmt = con.prepareStatement(query); // Preparedstatement(stmt)=커넥션객체에서 빨대가져옴(쿼리보낼거야)
         stmt.executeQuery(); // 빨대에서 쿼리를 오라클까지 전달하는 과정=채팅처럼 sql구문을 엔터쳐서 전달하면
         rs = stmt.executeQuery(); // 결과를 ResultSet으로 받아옴

         // 반복문을 사용해서 ArrayList에 가져온 데이터를 집어넣는다
         while (rs.next()) { // 데이터 한줄씩 가져오도록 해야니까 while문으로 돌림
            int c_no = rs.getInt("c_no"); // 자바객체로 바꾸기
            String c_name = rs.getString("c_name");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String grade = rs.getString("grade");

            
            
            Tbl_gmember_Dto gmember = new Tbl_gmember_Dto(c_no,c_name,phone,address,grade );

            gmemberList.add(gmember); // 자바 배열에 가져온 데이터를 넣음
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

      return gmemberList;

   }
   
// 자바에서 DB에 데이터를 입력하는 것 =insert
private DataSource datasource;

public void Tbl_gmember_CPDao() {
	//기존에 드라이버를 설정하고 Class.forName를 넣는 방식과 다르게 context.xml에 리소스 설정함.
	//context.xml에 있는 소스를 읽기 위해 context객체를 생성함.
	//jbdc/oracle:context.xml에서 name을 lookup 찾으라는 것.
	try {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	
	} catch (Exception e) {
		e.printStackTrace();
	}
}


   public int Application(String c_name, int c_no, String phone,String address,int tuition) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		String query = "insert into TBL_GMEMBER_2023 (c_no,c_name,phone,address) values(?,?,?,?)"; // 이부분을 실행시키기 위한
		int result = 0;

		try {
			con = datasource.getConnection(); //이렇게 
			stmt = con.prepareStatement(query);

			stmt.setInt(1, c_no);
			stmt.setString(2, c_name);
			stmt.setString(3, phone);
			stmt.setString(4, address);


			result = stmt.executeUpdate();

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

		return result;

	}

 
}
