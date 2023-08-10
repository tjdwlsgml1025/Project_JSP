package edu.global.tp.vote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import edu.global.tp.vote.dto.MemberDto;
import edu.global.tp.vote.dto.ResultDto;
import edu.global.tp.vote.dto.VoteDto;

public class VoteDao {
	private DataSource datasource = null;


	public VoteDao() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	
	//투표 검수 조회
	public List<VoteDto> VoteList() {

		ArrayList<VoteDto> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "SELECT v_name,\r\n" + 
					"       '19'||substr(v_ssnum, 1, 2)||'년'||substr(v_ssnum, 3, 2)||'월'||substr(v_ssnum, 5, 2)||'일생' v_ssnum,\r\n" + 
					"       '만 '||(to_number(to_char(sysdate, 'yyyy')) - to_number('19'||substr(v_ssnum, 1, 2)))||'세' v_age,\r\n" + 
					"       CASE substr(v_ssnum, 7, 1)\r\n" + 
					"           WHEN '1' THEN '남'\r\n" + 
					"           ELSE '여'\r\n" + 
					"       END v_gender,\r\n" + 
					"       m_no,\r\n" + 
					"       substr(v_time, 1, 2)||':'||substr(v_time, 3, 2) v_time,\r\n" + 
					"       CASE v_confirm\r\n" + 
					"           WHEN 'Y' THEN '확인'\r\n" + 
					"           ELSE '미확인'\r\n" + 
					"       END v_confirm\r\n" + 
					"FROM tbl_vote_2023\r\n" + 
					"WHERE v_area = '제1투표장'";
			
			con = datasource.getConnection();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();

			// 반복문을 사용해서 ArrayList에 가져온 데이터를 집어넣는다.
			while (rs.next()) {

				String v_name = rs.getString("v_name");
				String v_ssnum = rs.getString("v_ssnum");
				String v_age = rs.getString("v_age");
				String v_gender = rs.getString("v_gender");
				String m_no = rs.getString("m_no");
				String v_time = rs.getString("v_time");
				String v_confirm = rs.getString("v_confirm");

				VoteDto votedto = new VoteDto(v_name, v_ssnum, v_age, v_gender, m_no, v_time, v_confirm);

				list.add(votedto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
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
		return list;
	}
	
	//투표 결과 조회
	public List<ResultDto> VoteResult() {
	   	
		ArrayList<ResultDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			//후보자 등수 화면 쿼리
			String query = "SELECT\r\n" + 
					"    M.m_no,\r\n" + 
					"    M.m_name,\r\n" + 
					"    count(*) AS v_total\r\n" + 
					"FROM tbl_member_2023 M\r\n" + 
					"JOIN tbl_vote_2023 V ON M.m_no = V.m_no\r\n" + 
					"WHERE V.v_confirm = 'Y'\r\n" + 
					"GROUP BY M.m_no, M.m_name\r\n" + 
					"ORDER BY v_total DESC";
			con = datasource.getConnection();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
							
				String M_no = rs.getString("M_no");
				String M_name = rs.getString("M_name");
				String V_total = rs.getString("V_total");
				
				ResultDto resultdto = new ResultDto(M_no, M_name, V_total);

				list.add(resultdto);				
				

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
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
		return list;
	}
	// 투표 후보 조회
	public List<MemberDto> MemberList() {
	  	
		ArrayList<MemberDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {

			// 후보 조회 화면 쿼리
			String query = "select d.m_no AS m_no, d.m_name AS m_name, a.p_name as p_name,"
					+ " case when substr(d.p_school,1,1) = '1' then '고졸'"
					+ " when substr(d.p_school,1,1) = '2' then '학사'"
					+ " when substr(d.p_school,1,1) = '3' then '석사'"
					+ " end as p_school,"
					+ " substr(d.m_ssnum,1,6)||'-'||substr(d.m_ssnum,7,14) AS m_ssnum,"
					+ " d.m_city AS m_city, a.p_tel1||'-'||a.p_tel2"
					+ "||'-'||a.p_tel3 as p_tel"
					+ " from TBL_PARTY_2023 a, TBL_MEMBER_2023 d"
					+ " where a.p_code=d.p_code";
			
			con = datasource.getConnection();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			 
			 while(rs.next()) {
				 
				 String m_no = rs.getString("m_no");
				 String m_name = rs.getString("m_name");
				 String p_name = rs.getString("p_name");
				 String p_school = rs.getString("p_school");
				 String m_ssnum = rs.getString("m_ssnum");
				 String m_city = rs.getString("m_city");
				 String p_tel = rs.getString("p_tel");
				 				 
				 MemberDto memberdto = new MemberDto(m_no, m_name, p_name, p_school, m_ssnum, m_city, p_tel);

				 list.add(memberdto);
				
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
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
		return list;
	}

	
	public int insertVote(HttpServletRequest request, HttpServletResponse response) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			
			String v_ssnum = request.getParameter("v_ssnum");
			String v_name = request.getParameter("v_name");
			String m_no = request.getParameter("m_no");
			String v_time = request.getParameter("v_time");
			String v_area = request.getParameter("v_area");
			String v_confirm = request.getParameter("v_confirm");
			
			String query = "INSERT INTO tbl_vote_2023 VALUES(?,?,?,?,?,?)";
			
			con= datasource.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setString(1, v_ssnum);
			stmt.setString(2, v_name);
			stmt.setString(3, m_no);
			stmt.setString(4, v_time);
			stmt.setString(5, v_area);
			stmt.setString(6, v_confirm);
			
			result = stmt.executeUpdate(); // 0실패, 1성공
			System.out.println(result);	
			con.close();
			stmt.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return result;
	}	


	
}
