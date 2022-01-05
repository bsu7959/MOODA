package com.koreait.mooda.etc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;
import com.koreait.mooda.diary.DiaryDTO;

public class EtcDAO {

	List<DiaryDTO> etcList = new ArrayList<>();
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public EtcDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}
	
	public List<DiaryDTO> getEtcList(){
		etcList = sqlsession.selectList("Etc.list");
		return etcList;
	}
	
	public List<String> getFontStyle() {
		List<String> list = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		list = sqlsession.selectList("Etc.fontStyle");
		for(String str : list) {
			if(str != null && !str.equals("")) {
				list2.add(str);
			}
		}
		return list2;
	}
	
	public List<String> getBackground() {
		List<String> list = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		list = sqlsession.selectList("Etc.background");
		for(String str : list) {
			if(str != null && !str.equals("")) {
				list2.add(str.trim());
			}
		}
		return list2;
	}
}