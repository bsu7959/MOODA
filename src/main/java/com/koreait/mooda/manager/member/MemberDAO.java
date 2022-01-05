package com.koreait.mooda.manager.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.manager.db.SqlMapConfig;
import com.koreait.mooda.manager.diary.DiaryDTO;

public class MemberDAO {

	//모든 회원정보를 dto의 객체 리스트로 통합하여 가져올 arrayList 생성
	List<MemberDTO> memberList = new ArrayList<>();
	// session facotry로 read 해온 데이터 정보를 sqlsession에 저장하는 설정단계
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}
	
	// 모든 회원정보를 Member.list로 읽어와서 memberList로 반환시키자
	public List<MemberDTO> getMemberList() {
		
		memberList = sqlsession.selectList("Member.list");
		
		return memberList;
	}


	public List<MemberDTO> getSearchList(MemberSearch search) {
		
		memberList = sqlsession.selectList("Member.search", search);
		
		return memberList;
	}
	
	//신고글만보기
	public List<MemberDTO> getReportList(){
		List<MemberDTO> memberList = new ArrayList<>();
		memberList = sqlsession.selectList("Member.report");
		return memberList;
	}
	
	//view
	public MemberDTO view(String m_idx) {
		MemberDTO member = new MemberDTO();
		member = sqlsession.selectOne("Member.view", m_idx);
		return member;
	}
	
	// 받아온 데이터로 update 시키고 결과를 int로 return 해주자
	public int edit(MemberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_userid", member.getM_userid());
		dataMap.put("m_userpw", member.getM_userpw());
		dataMap.put("m_name", member.getM_name());
		dataMap.put("m_email", member.getM_email());
		dataMap.put("m_hp", member.getM_hp());
		dataMap.put("m_nickname", member.getM_nickname());
		dataMap.put("m_birth", member.getM_birth());
		dataMap.put("m_open", String.valueOf(member.getM_open()));
		dataMap.put("m_interest", member.getM_interest());
		dataMap.put("m_regdate", member.getM_regdate());
		dataMap.put("m_idx", String.valueOf(member.getM_idx()));
		
		return sqlsession.update("Member.edit", dataMap);
	}
	
	// 데이터를 삭제시켜주자
	public int del(MemberDTO member) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("m_idx", member.getM_idx());
		
		return sqlsession.delete("Member.del", dataMap);
	}
	
}
