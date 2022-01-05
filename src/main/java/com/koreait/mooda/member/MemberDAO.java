package com.koreait.mooda.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;



public class MemberDAO {
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	List<String> interestList = new ArrayList<>();
	HashMap<String, String> dataMap = new HashMap<>();
	List<MemberDTO> memberList = new ArrayList<>();
	MemberDTO member = new MemberDTO();
	String nickname;
	
	public MemberDAO() {
		sqlsession = ssf.openSession(true);	// openSession(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공");
	}
	
	public List<String> selectInterest() {
		
		return interestList = sqlsession.selectList("Interest.selectInterest");
	}
	
	public int join(MemberDTO member) {
		dataMap.put("m_userid", member.getM_userid());
		dataMap.put("m_userpw", member.getM_userpw());
		dataMap.put("m_name", member.getM_name());
		dataMap.put("m_email", member.getM_email());
		dataMap.put("m_hp", member.getM_hp());
		dataMap.put("m_nickname", member.getM_nickname());
		dataMap.put("m_birth", member.getM_birth());
		dataMap.put("m_interest", member.getM_interest());
		dataMap.put("m_open", member.getM_open());
		return sqlsession.insert("Member.join", dataMap);
	}
	
	// 모든 회원정보를 Member.list로 읽어와서 memberList로 반환시키자
	public List<MemberDTO> getMemberList() {
		
		memberList = sqlsession.selectList("Member.list");
		
		return memberList;
	}
	
	public MemberDTO login(MemberDTO member) {
		dataMap.put("m_userid", member.getM_userid());
		dataMap.put("m_userpw", member.getM_userpw());
		dataMap = sqlsession.selectOne("Member.login", dataMap);
		if(dataMap != null) {
			member.setM_idx((Long.valueOf(String.valueOf(dataMap.get("m_idx")))));
			member.setM_name(dataMap.get("m_name"));
			member.setM_fontSize(dataMap.get("m_font_size"));
			member.setM_fontStyle(dataMap.get("m_font_style"));
			member.setM_background(dataMap.get("m_background"));
			member.setM_open(String.valueOf(dataMap.get("m_open")));
			System.out.println(String.valueOf(dataMap.get("m_open")));
			System.out.println(member.getM_open());
			return member;
		}else {
			return null;
		}
		
	}
	
	public MemberDTO getOne(String m_idx) {
		return sqlsession.selectOne("Member.getOne", m_idx);
	}
	
	public String fontSizing(String fontSize, String m_idx) {
		dataMap.put("fontSize", fontSize);
		dataMap.put("m_idx", m_idx);
		if(sqlsession.update("Member.fontSize", dataMap) == 1) {
			return fontSize;
		}
		return "0";
	}
	
	public String fontStyle(String fontStyle, String m_idx) {
		dataMap.put("fontStyle", fontStyle);
		dataMap.put("m_idx", m_idx);
		if(sqlsession.update("Member.fontStyle", dataMap) == 1) {
			return fontStyle;
		}
		return "다래 손글씨체";
	}
	
	public String background(String background, String m_idx) {
		dataMap.put("background", background);
		dataMap.put("m_idx", m_idx);
		if(sqlsession.update("Member.background", dataMap) == 1) {
			System.out.println(background);
			return background;
		}
		return "rgb(237,237,229)";
			
	}
	
	public int modify(MemberDTO member) {
		dataMap.put("m_idx", String.valueOf(member.getM_idx()));
		dataMap.put("m_userpw", member.getM_userpw());
		dataMap.put("m_email", member.getM_email());
		dataMap.put("m_hp", member.getM_hp());
		dataMap.put("m_nickname", member.getM_nickname());
		dataMap.put("m_birth", member.getM_birth());
		dataMap.put("m_interest", member.getM_interest());
		dataMap.put("m_open", member.getM_open());
		return sqlsession.update("Member.modify", dataMap);
	}
	
	public boolean unfollow(String m_idx, String d_useridx) {
		dataMap.put("m_idx", m_idx);
		dataMap.put("d_useridx", d_useridx);
		int result = sqlsession.delete("Member.unfollow", dataMap);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean follow(String m_idx, String d_useridx) {
		dataMap.put("m_idx", m_idx);
		dataMap.put("d_useridx", d_useridx);
		int result = sqlsession.delete("Member.follow", dataMap);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public String selectName(int idx) {
		
		return nickname = sqlsession.selectOne("Member.selectName", idx);
	}
	
}
