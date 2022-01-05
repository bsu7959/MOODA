package com.koreait.mooda.manager.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.manager.db.SqlMapConfig;
import com.koreait.mooda.manager.member.MemberDTO;


public class DiaryDAO {

	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public DiaryDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}
	
	public List<DiaryDTO> getDiaryList(){
		List<DiaryDTO> diaryList = new ArrayList<>();
		diaryList = sqlsession.selectList("Diary.list");
		return diaryList;
	}
	
	public List<DiaryDTO> getSearchList(DiarySearch search){
		List<DiaryDTO> diaryList = new ArrayList<>();
		diaryList = sqlsession.selectList("Diary.search", search);
		return diaryList;
	}
	//view
	public DiaryDTO view(String d_idx) {
		DiaryDTO diary = new DiaryDTO();
		diary = sqlsession.selectOne("Diary.view", d_idx);
		return diary;
	}
	
	//신고글만보기
		public List<DiaryDTO> getDiaryReport(){
			List<DiaryDTO> diaryList = new ArrayList<>();
			diaryList = sqlsession.selectList("Diary.report");
			return diaryList;
		}
			
	// 
	public int edit(DiaryDTO diary) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("d_useridx", String.valueOf(diary.getD_useridx()));
		dataMap.put("d_mood", String.valueOf(diary.getD_mood()));
		dataMap.put("d_regdate", diary.getD_regdate());
		dataMap.put("d_content", "관리자에의해 차단된 게시물입니다");
		dataMap.put("d_open", String.valueOf(diary.getD_open()));
		dataMap.put("d_sticker", "100");
		dataMap.put("d_img", null);
		dataMap.put("d_latitude", null);
		dataMap.put("d_longitude", null);
		dataMap.put("d_report", String.valueOf(diary.getD_report()));
		dataMap.put("d_idx", String.valueOf(diary.getD_idx()));
		return sqlsession.update("Diary.edit", dataMap);
	}
	
	
	// 데이터를 삭제시켜주자
	public int del(DiaryDTO diary) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("d_idx", String.valueOf(diary.getD_idx()));
		
		return sqlsession.delete("Diary.del", dataMap);
	}
	
}
