<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	request.setCharacterEncoding("utf-8");
	String uploadPath = request.getRealPath("upload");
	System.out.println(uploadPath);
	int size = 1024*1024*10;
	
	int m_idx = Integer.parseInt(String.valueOf(session.getAttribute("m_idx")));
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());		
		diaryDTO.setD_useridx(m_idx);
		diaryDTO.setD_mood(Integer.parseInt(String.valueOf(multi.getParameter("diary_mood"))));
		String year = String.valueOf(multi.getParameter("diary_write_year"));
		String month = String.valueOf(multi.getParameter("diary_write_month"));
		String date = String.valueOf(multi.getParameter("diary_write_date"));
		if(Integer.parseInt(month) < 10) {
			if(Integer.parseInt(date) < 10) {
				diaryDTO.setD_regdate(year + "0" + month + "0" + date + "000000");
			} else {
				diaryDTO.setD_regdate(year + "0" + month + date + "000000");
			}
		} else {
			if(Integer.parseInt(date) < 10) {
				diaryDTO.setD_regdate(year + month + "0" + date + "000000");
			} else {
				diaryDTO.setD_regdate(year  + month + date + "000000");
			}
		}
		diaryDTO.setD_title(String.valueOf(multi.getParameter("diary_title")));
		diaryDTO.setD_content(String.valueOf(multi.getParameter("diary_content")));
		System.out.println(String.valueOf(multi.getParameter("diary_content")));
		diaryDTO.setD_open(Integer.parseInt(String.valueOf(multi.getParameter("diary_open"))));
		diaryDTO.setD_sticker(Integer.parseInt(String.valueOf(multi.getParameter("diary_sticker"))));
		diaryDTO.setD_img(String.valueOf(multi.getFilesystemName("diary_image")));
		diaryDTO.setD_useridx(Integer.parseInt(String.valueOf(session.getAttribute("m_idx"))));
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if(diaryDAO.write(diaryDTO) >= 1) {
%>
	<script>
		alert("등록되었습니다.");
		location.href="./cal1.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("등록에 실패했습니다.");
		history.back();
	</script>
<%
	}
}
%>
