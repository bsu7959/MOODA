package com.koreait.mooda.manager.reply;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.manager.comment.CommentDTO;
import com.koreait.mooda.manager.db.SqlMapConfig;
import com.koreait.mooda.manager.diary.DiaryDTO;

public class ReplyDAO {
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReplyDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}
	
	//검색
	public List<ReplyDTO> getReplyList(ReplyDTO reply){
		List<ReplyDTO> replyList = new ArrayList<>();
		replyList = sqlsession.selectList("Reply.list", reply);
		return replyList;
	}
	
	//신고글만보기
	public List<ReplyDTO> getReplyReport(){
		List<ReplyDTO> replyList = new ArrayList<>();
		replyList = sqlsession.selectList("Reply.report");
		return replyList;
	}
	// 받아온 데이터로 update 시키고 결과를 int로 return 해주자
	public int edit(ReplyDTO reply) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("r_idx", String.valueOf(reply.getR_idx()));
		dataMap.put("r_useridx", String.valueOf(reply.getR_useridx()));
		dataMap.put("r_cidx", String.valueOf(reply.getR_cidx()));
		dataMap.put("r_text", "관리자에 의해 차단된 게시글입니다");
		dataMap.put("r_regdate", reply.getR_regdate());
		dataMap.put("r_report", String.valueOf(reply.getR_report()));
		return sqlsession.update("Reply.edit", dataMap);
	}
	
	// 데이터를 삭제시켜주자
	public int del(ReplyDTO reply) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("r_idx", String.valueOf(reply.getR_idx()));
		
		return sqlsession.delete("Reply.del", dataMap);
	}
	
}
