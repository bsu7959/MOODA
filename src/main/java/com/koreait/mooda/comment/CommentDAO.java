package com.koreait.mooda.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;

public class CommentDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	List<CommentDTO> commentList = new ArrayList<>();
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public CommentDAO() {
		sqlsession = ssf.openSession(true); 
		System.out.println("마이바티스 설정 성공!");
	}
	
	public List<CommentDTO> selectList(int diaryIdx) {
		
		commentList = sqlsession.selectList("Comment.list", diaryIdx);
		
		return commentList;
	}
	
	public int write(CommentDTO commentDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("c_useridx", String.valueOf(commentDTO.getC_useridx()));
		dataMap.put("c_didx", String.valueOf(commentDTO.getC_didx()));
		dataMap.put("c_text", commentDTO.getC_text());
		
		return sqlsession.insert("Comment.write", dataMap);
	}
	
	public int edit(CommentDTO commentDTO) {
		
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("c_idx", String.valueOf(commentDTO.getC_idx()));
		dataMap.put("c_text", commentDTO.getC_text());
		
		return sqlsession.update("Comment.edit", dataMap);
	}
	
	public int delete(String commentIdx) {
		
		return sqlsession.delete("Comment.delete", commentIdx);
	}
}
