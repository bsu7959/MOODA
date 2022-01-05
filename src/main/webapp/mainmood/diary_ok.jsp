<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:useBean id="dao" class="com.koreait.mooda.diary.DiaryDAO"/>
<jsp:useBean id="diary" class="com.koreait.mooda.diary.DiaryDTO"/>
<%
if(session.getAttribute("m_idx") == null || session.getAttribute("m_idx").equals("")) {
	%>
		<script>
			alert('잘못된 접근');
			location.href="../index.jsp";
		</script>
	<%
}else {
	String d_idx = request.getParameter("d_idx");
	diary = dao.getDiaryOne(d_idx);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
	String[] week = {"일","월","화","수","목","금","토"}; 
	Calendar cal = Calendar.getInstance(); 
	Date getDate; 
	int day = Integer.parseInt(diary.getD_regdate().substring(8,10));
	int w = 0;
	try { 
		getDate = format.parse(diary.getD_regdate().substring(0,10)); 
		cal.setTime(getDate); 
		w = cal.get(Calendar.DAY_OF_WEEK)-1; 
		} catch (Exception e) { 
			e.printStackTrace(); 
		}

	String json = "{ \"d_idx\" : \""+diary.getD_idx()+"\",\"d_mood\" : \""+diary.getD_mood()+"\", \"d_img\" : \""+diary.getD_img()+"\", \"d_title\" : \""+diary.getD_title()+"\",\"d_day\" : \""+day+"\", \"d_week\" : \""+week[w]+"\", \"d_content\" : \""+diary.getD_content()+"\",\"d_sticker\" : \""+diary.getD_sticker()+"\",\"d_mood\" : \""+diary.getD_mood()+"\",\"d_img\" : \""+diary.getD_img()+"\",\"d_latitude\" : \""+diary.getD_latitude()+"\",\"d_longitude\" : \""+diary.getD_longitude()+"\"}";
	out.println(json);
}
%>