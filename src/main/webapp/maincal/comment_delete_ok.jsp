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
	
	if(commentDAO.delete(String.valueOf(request.getParameter("comment_idx"))) >= 1) {
%>
	<script>
		alert("삭제되었습니다.");
		location.href="./cal1.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("삭제에 실패했습니다.");
		history.back();
	</script>
<%
	}
}
%>