package com.kh.semi.travel.model.dao;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.hospital.model.dao.HospitalDAO;
import com.kh.semi.hospital.model.vo.Hospital;
import com.kh.semi.hospital.model.vo.PageInfo;
import com.kh.semi.travel.model.vo.Travel;

public class TravelDAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	private Properties prop = null;	

	public TravelDAO() {
		String fileName = TravelDAO.class.getResource("/com/kh/semi/sql/travel/travel-query.xml").getPath();
		try {
			prop = new Properties();
			prop.loadFromXML(new FileInputStream(fileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/** 전체 지역정보 게시글 수 반환 DAO 
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Connection conn) throws Exception {
		int listCount =0;
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				listCount = rset.getInt(1);
			}
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}


	/** 여행 지역정보 목록 조회 DAO 
	 * @param conn
	 * @param pInfo
	 * @return tList
	 * @throws Exception
	 */
	public List<Travel> selectTravelList(Connection conn, PageInfo pInfo) throws Exception {
		List<Travel> tList = null;
		String query = prop.getProperty("selectTravelList");
		
		try {
			// SQL 구문 조건절에 대입할 변수 생성
			int startRow = (pInfo.getCurrentPage()-1) * pInfo.getLimit()+1;
			int endRow = startRow + pInfo.getLimit()-1;
			// 7개의 글 중에서 1페이지에 해당하는 글을 가져옴 : 7~2번째의 글만 가져오게 됨.
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,  endRow);
			
			rset = pstmt.executeQuery();
			
			tList = new ArrayList<Travel>();
			
			while(rset.next()) {
				Travel travel = new Travel(rset.getInt("TRAVEL_NO"),
											rset.getString("TRAVEL_TITLE"),
											rset.getInt("TRAVEL_READ_COUNT"),
											rset.getDate("TRAVEL_BOARD_DATE"));
				tList.add(travel);
			}
			
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return tList;
	}


	/** 지역정보 글 상세 조회 DAO 
	 * @param conn
	 * @param travelNo
	 * @return travel 
	 * @throws Exception
	 */
	public Travel selectTravel(Connection conn, int travelNo) throws Exception {
		// 1) 결과를 저장할 변수 선언
		Travel travel = null;
		
		// 2) SQL 구문 얻어오기
		String query = prop.getProperty("selectTravel");
		
		// 3) SQL 수행 후 결과를 notice에 저장
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, travelNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				travel = new Travel();
				
				travel.setTravelNo(rset.getInt("TRAVEL_NO"));
				travel.setTravelLocation(rset.getString("TRAVEL_LOCATION"));
				travel.setTravelTitle(rset.getString("TRAVEL_TITLE"));
				travel.setTravelContent(rset.getString("TRAVEL_CONTENT"));
				travel.setTravelReadCount(rset.getInt("TRAVEL_READ_COUNT"));
				travel.setTravelBoardDate(rset.getDate("TRAVEL_BOARD_DATE"));
			}
		} finally {
			// 4) 사용한 JDBC 객체 반환
			close(rset);
			close(pstmt);
		}
		// 5) 결과 반
		return travel;
	}


	/** 조회수 증가 DAO
	 * @param conn
	 * @param travelNo
	 * @return result
	 * @throws Exception
	 */
	public int increaseReadCount(Connection conn, int travelNo) throws Exception {
		int result = 0; 
		String query = prop.getProperty("increaseReadCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, travelNo);
			
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;
	}





}