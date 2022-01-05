<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="diaryDTO" class="com.koreait.mooda.diary.DiaryDTO"/>
<jsp:useBean id="diaryDAO" class="com.koreait.mooda.diary.DiaryDAO"/>
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
	diaryDTO.setD_idx(Integer.parseInt(String.valueOf(request.getParameter(""))));
	diaryDTO.setD_mood(Integer.parseInt(String.valueOf(request.getParameter(""))));
	diaryDTO.setD_content(String.valueOf(request.getParameter("diary_content")));
	diaryDTO.setD_open(Integer.parseInt(String.valueOf(request.getParameter(""))));
	diaryDTO.setD_sticker(Integer.parseInt(String.valueOf(request.getParameter(""))));
	diaryDTO.setD_latitude(Double.parseDouble(String.valueOf(request.getParameter(""))));
	diaryDTO.setD_longitude(Double.parseDouble(String.valueOf(request.getParameter(""))));
	
	if(diaryDAO.edit(diaryDTO) >= 1) {
%>
	<script>
		alert("수정되었습니다.");
		location.href="./cal1.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("수정에 실패했습니다.");
		history.back();
	</script>
<%
	}
}
%>