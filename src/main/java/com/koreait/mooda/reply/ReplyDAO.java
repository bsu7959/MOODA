package com.koreait.mooda.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;

public class ReplyDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	List<ReplyDTO> replyList = new ArrayList<>();
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReplyDAO() {
		sqlsession = ssf.openSession(true); 
		System.out.println("마이바티스 설정 성공!");
	}
	
	public List<ReplyDTO> selectList(String commentIdx) {
		
		replyList = sqlsession.selectList("Reply.list", commentIdx);
		
		return replyList;
	}
	
	public int write(ReplyDTO replyDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("r_useridx", String.valueOf(replyDTO.getR_useridx()));
		dataMap.put("r_didx", String.valueOf(replyDTO.getR_cidx()));
		dataMap.put("r_text", replyDTO.getR_text());
		
		return sqlsession.insert("Reply.write", dataMap);
	}
	
	public int edit(ReplyDTO replyDTO) {
		
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("r_idx", String.valueOf(replyDTO.getR_idx()));
		dataMap.put("r_text", replyDTO.getR_text());
		
		return sqlsession.update("Reply.edit", dataMap);
	}
	
	public int delete(String replyIdx) {
		
		return sqlsession.delete("Reply.delete", replyIdx);
	}
}
