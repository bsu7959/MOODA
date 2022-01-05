package com.koreait.mooda.diary;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mooda.db.SqlMapConfig;

public class DiaryDAO {

	List<DiaryDTO> diaryList = new ArrayList<>();
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public DiaryDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("설정 성공");
	}
	
	public List<DiaryDTO> getDiaryList(String m_idx, String date){
		HashMap<String, Object> dataMap = new HashMap<>();
		date = date + "%";
		dataMap.put("m_idx", m_idx);
		dataMap.put("date", date);
		
		diaryList = sqlsession.selectList("Diary.list", dataMap);
		System.out.println(diaryList.size());
		return diaryList;
	}
	
	public DiaryDTO getDiaryOne(String d_idx) {
		return sqlsession.selectOne("Diary.view", d_idx);
	}
	
	public int write (DiaryDTO diaryDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("d_useridx", String.valueOf(diaryDTO.getD_useridx()));
		dataMap.put("d_mood", String.valueOf(diaryDTO.getD_mood()));
		dataMap.put("d_regdate", diaryDTO.getD_regdate());
		dataMap.put("d_title", diaryDTO.getD_title());
		dataMap.put("d_content", diaryDTO.getD_content());
		dataMap.put("d_open", String.valueOf(diaryDTO.getD_open()));
		dataMap.put("d_sticker", String.valueOf(diaryDTO.getD_sticker()));
		dataMap.put("d_img", diaryDTO.getD_img());
		dataMap.put("d_latitude", String.valueOf(diaryDTO.getD_longitude()));
		dataMap.put("d_longitude", String.valueOf(diaryDTO.getD_latitude()));		
		
		return sqlsession.insert("Diary.write", dataMap);
	}
	
	public int delete (String d_idx) {
		return sqlsession.delete("Diary.delete", d_idx);
	}
	
	public int edit (DiaryDTO diaryDTO) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("d_idx", String.valueOf(diaryDTO.getD_idx()));
		dataMap.put("d_mood", String.valueOf(diaryDTO.getD_mood()));
		dataMap.put("d_title", diaryDTO.getD_title());
		dataMap.put("d_content", diaryDTO.getD_content());
		dataMap.put("d_open", String.valueOf(diaryDTO.getD_open()));
		dataMap.put("d_sticker", String.valueOf(diaryDTO.getD_sticker()));
		dataMap.put("d_img", diaryDTO.getD_img());
		dataMap.put("d_latitude", String.valueOf(diaryDTO.getD_longitude()));
		dataMap.put("d_longitude", String.valueOf(diaryDTO.getD_latitude()));
		
		return sqlsession.insert("Diary.edit", dataMap);
	}
	
	public List<DiaryDTO> friends(String m_idx) {
		List<Integer> followList = sqlsession.selectList("Member.following", m_idx);
		for(int d_useridx : followList) {
			List<DiaryDTO> list1 = new ArrayList<>();
			list1 = sqlsession.selectList("Diary.friends", d_useridx);
			diaryList.addAll(list1);
		}
		int size = diaryList.size();
		int k=0;
		DiaryDTO[] arr = new DiaryDTO[size];
		for(DiaryDTO di : diaryList) {
			arr[k] = di;
			k++;
		}
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i].getD_idx() < arr[j].getD_idx()) {
                    DiaryDTO temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        List<DiaryDTO> list = new ArrayList<>();
        for(DiaryDTO di : arr) {
        	list.add(di);
        }
		return list;
	}
	
	public String[] getNameId(int d_useridx) {
		String[] str = new String[2];
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap = sqlsession.selectOne("Diary.getIdName", d_useridx);
		str[0] = dataMap.get("m_userid");
		str[1] = dataMap.get("m_name");
		return str;
	}
	
	public List<DiaryDTO> suggest(String m_idx) {
		List<Integer> followList = sqlsession.selectList("Member.following", m_idx);
		String sql = m_idx + " ";
		for(int idx : followList) {
			sql += idx + " ";
		}
		sql = sql.trim().replace(" ",",");
		return sqlsession.selectList("Diary.suggest", sql);
	}
	
	public int followCheck(String m_idx, String d_useridx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("m_idx", m_idx);
		dataMap.put("d_useridx", d_useridx);
		int check = sqlsession.selectOne("Member.followCheck", dataMap);
		if(check > 0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	public int report(String d_idx, String d_useridx) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("d_idx", d_idx);
		dataMap.put("d_useridx", d_useridx);
		int k = sqlsession.selectOne("Report.reportCheck", dataMap);
		if(k > 0) {
			return 0;
		}else {
			int i = 0;
			i += sqlsession.update("Report.reportUser", d_useridx);
			i += sqlsession.update("Report.reportDiary", d_idx);
			i += sqlsession.insert("Report.reportAdd", dataMap);
			return i;
		}

	}
	
	public List<DiaryDTO> search(String input) {
		List<Integer> users = new ArrayList<>();
		List<DiaryDTO> list = new ArrayList<>();
		List<DiaryDTO> li2 = new ArrayList<>();
		users = sqlsession.selectList("Diary.searchUser", input);
		if(users.size() > 0) {
			for(int i : users) {
				List<DiaryDTO> li = new ArrayList<>();
				li = sqlsession.selectList("Diary.getAll",i);
				if(li.size() > 0) {
					list.addAll(li);
				}
			}
		}
		input = "%" + input + "%";
		li2 = sqlsession.selectList("Diary.search", input);
		if(li2.size() > 0) {
			list.addAll(li2);
		}

		int k=0;
		DiaryDTO[] arr = new DiaryDTO[list.size()];
		for(DiaryDTO di : list) {
			arr[k] = di;
			k++;
		}

		System.out.println(arr.length);
		if(arr.length > 1) {
	        for (int i = 0; i < arr.length; i++) {
	            for (int j = i + 1; j < arr.length; j++) {
	                if (arr[i].getD_idx() < arr[j].getD_idx()) {
	                	
	                    DiaryDTO temp = arr[i];
	                    arr[i] = arr[j];
	                    arr[j] = temp;
	                }
	            }
	        }
		}
        List<DiaryDTO> list3 = new ArrayList<>();
        for(DiaryDTO di : arr) {
        	list3.add(di);
        	System.out.println("인덱스"+di.getD_idx());
        }

		return list3;
	}
	
	
}
