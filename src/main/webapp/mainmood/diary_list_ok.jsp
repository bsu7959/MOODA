<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.koreait.mooda.diary.DiaryDTO" %>
<jsp:useBean id="dao" class="com.koreait.mooda.diary.DiaryDAO"/>

<%
if(session.getAttribute("m_idx") == null || session.getAttribute("m_idx").equals("")) {
	System.out.println("2");
	%>
		<script>
			alert('잘못된 접근');
			location.href="../index.jsp";
		</script>
	<%
}else {
	String m_idx = request.getParameter("m_idx");
	String date = request.getParameter("date");
	List<DiaryDTO> list = new ArrayList<>();
	list = dao.getDiaryList(m_idx, date);
	String json2 = "";
	for(DiaryDTO diary : list) {
		json2 += String.valueOf(diary.getD_idx()) + "," + diary.getD_mood() + "%";
	}
	System.out.println(json2);
	out.println(json2);
}
%>