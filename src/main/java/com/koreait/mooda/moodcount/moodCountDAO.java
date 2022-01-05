package com.koreait.mooda.moodcount;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;

public class moodCountDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	List<moodCountDTO> mcList = new ArrayList<>();
	
	public moodCountDAO() {
		sqlsession = ssf.openSession(true); // openSessioni(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공");
	}


	public moodCountDTO moodList(String m_idx){
		moodCountDTO mcd = new moodCountDTO();
		mcd = sqlsession.selectOne("Moodcount.moodcount", m_idx);
		return mcd;
	}
	
	public moodCountDTO moodSearch(moodSearch ms) {
		
		moodCountDTO mcd = new moodCountDTO();
		mcd = sqlsession.selectOne("Moodcount.moodsearch", ms);
		return mcd;
	}
}
