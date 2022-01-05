package com.koreait.mooda.manager.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.manager.db.SqlMapConfig;
import com.koreait.mooda.manager.diary.DiaryDTO;
import com.koreait.mooda.manager.diary.DiarySearch;
import com.koreait.mooda.manager.member.MemberDTO;



public class CommentDAO {

	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public CommentDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}	
	//전체
	public List<CommentDTO> getCommentList(){
		List<CommentDTO> commentList = new ArrayList<>();
		commentList = sqlsession.selectList("Comment.list");
		return commentList;
	}
	
	//검색
	public List<CommentDTO> getSearchList(CommentSearch search){
		List<CommentDTO> commentList = new ArrayList<>();
		commentList = sqlsession.selectList("Comment.search", search);
		return commentList;
	}
	
	//신고글만보기
	public List<CommentDTO> getCommentReport(){
		List<CommentDTO> commentList = new ArrayList<>();
		commentList = sqlsession.selectList("Comment.report");
		return commentList;
	}
	

	
	public int edit(CommentDTO comment) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("c_idx", String.valueOf(comment.getC_idx()));
		dataMap.put("c_useridx", String.valueOf(comment.getC_useridx()));
		dataMap.put("c_didx", String.valueOf(comment.getC_didx()));
		dataMap.put("c_text", "관리자에 의해 차단된 게시글입니다");
		dataMap.put("c_regdate", comment.getC_regdate());
		dataMap.put("c_report", String.valueOf(comment.getC_report()));
		return sqlsession.update("Comment.edit", dataMap);
	}
	
	// 데이터를 삭제시켜주자
	public int del(CommentDTO comment) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("c_idx", String.valueOf(comment.getC_idx()));
		
		return sqlsession.delete("Comment.del", dataMap);
	}
	
}
