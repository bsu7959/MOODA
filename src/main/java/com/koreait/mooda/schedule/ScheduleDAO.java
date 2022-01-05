package com.koreait.mooda.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;

public class ScheduleDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	List<ScheduleDTO> scheduleList = new ArrayList<>();
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ScheduleDAO() {
		sqlsession = ssf.openSession(true); 
		System.out.println("마이바티스 설정 성공!");
	}
	
	public List<ScheduleDTO> list (String year, String month, String useridx) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("s_useridx", useridx);
		dataMap.put("s_date", (year.substring(2,4) + "-" + month));
		
		scheduleList = sqlsession.selectList("Schedule.list", dataMap);
		return scheduleList;
	}
	
	public List<ScheduleDTO> getScheduleOne(String s_date, String s_useridx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("s_date", s_date);
		dataMap.put("s_useridx", s_useridx);
		return sqlsession.selectList("Schedule.selectSchedule", dataMap);
	}
	
	public int write (ScheduleDTO scheduleDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("s_useridx", String.valueOf(scheduleDTO.getS_useridx()));
		dataMap.put("s_alarm", String.valueOf(scheduleDTO.getS_alarm()));
		dataMap.put("s_date", scheduleDTO.getS_date());
		dataMap.put("s_time", scheduleDTO.getS_time());
		dataMap.put("s_content", scheduleDTO.getS_content());
		
		return sqlsession.insert("Schedule.write", dataMap);
	}
	
	public int delete (String s_idx) {
		return sqlsession.delete("Schedule.delete", s_idx);
	}
	
	public int edit (ScheduleDTO scheduleDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("s_useridx", String.valueOf(scheduleDTO.getS_useridx()));
		dataMap.put("s_alarm", String.valueOf(scheduleDTO.getS_alarm()));
		dataMap.put("s_content", scheduleDTO.getS_date());
		dataMap.put("s_time", scheduleDTO.getS_time());
		dataMap.put("s_content", scheduleDTO.getS_content());
		dataMap.put("s_idx", String.valueOf(scheduleDTO.getS_idx()));
		
		return sqlsession.insert("Schedule.edit", dataMap);
	}
}
