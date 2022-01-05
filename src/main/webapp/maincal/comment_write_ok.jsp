<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="commentDTO" class="com.koreait.mooda.comment.CommentDTO"/>
<jsp:useBean id="commentDAO" class="com.koreait.mooda.comment.CommentDAO"/>
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
	int m_idx = Integer.parseInt(String.valueOf(session.getAttribute("m_idx")));
	commentDTO.setC_useridx(m_idx);
	commentDTO.setC_didx(Integer.parseInt(String.valueOf(request.getParameter("comment_didx"))));
	commentDTO.setC_text(String.valueOf(request.getParameter("comment_write")));
	
	if(commentDAO.write(commentDTO) >= 1) {
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