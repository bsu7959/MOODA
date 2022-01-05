package com.koreait.mooda.manager.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.manager.db.SqlMapConfig;

// try catch(외부프로그램 접속) 를 notice.xml

public class NoticeDAO {

	// 모든 회원정보를 dto의 객체 리스트로 통합하여 가져올 arrayList 생성
	List<NoticeDTO> noticeList = new ArrayList<>();
	NoticeDTO noticeView = new NoticeDTO();
	// session facotry로 read 해온 데이터 정보를 sqlsession에 저장하는 설정단계
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public NoticeDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}


	public List<NoticeDTO> getNoticeList() {

		noticeList = sqlsession.selectList("Notice.list");

		return noticeList;
	}
	
	public int hit(String n_idx) {
		return sqlsession.update("Notice.hit", n_idx);
	}
	
	public NoticeDTO getNoticeView(String n_idx) {
		noticeView = sqlsession.selectOne("Notice.view", n_idx);

		return noticeView;
	}
	
	public List<NoticeDTO> getNoticeSearch(NoticeSearch search) {
		
		noticeList = sqlsession.selectList("Notice.search", search);
		
		return noticeList;
	}

	// 데이터를 삭제시켜주자
	public int del(int n_idx) {

		return sqlsession.delete("Notice.n_del", n_idx);

	}

	 public int edit(NoticeDTO notice) {
	      HashMap<String, String> dataMap = new HashMap<>();
	      dataMap.put("n_idx", String.valueOf(notice.getN_idx()));
	      dataMap.put("n_title", notice.getN_title());
	      dataMap.put("n_content", notice.getN_content());

	      return sqlsession.update("Notice.edit", dataMap);

	   }
	

	
	public int write(NoticeDTO notice) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("n_writer", notice.getN_writer());
		dataMap.put("n_title", notice.getN_title());
		dataMap.put("n_content", notice.getN_content());

		return sqlsession.insert("Notice.write", dataMap);

	}

}