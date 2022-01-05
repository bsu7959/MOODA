<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="replyDTO" class="com.koreait.mooda.reply.ReplyDTO"/>
<jsp:useBean id="replyDAO" class="com.koreait.mooda.reply.ReplyDAO"/>
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
	int a = 3;
	replyDTO.setR_useridx(a);
	replyDTO.setR_cidx(a);
	replyDTO.setR_text(String.valueOf(request.getParameter("comment_write")));
	
	if(replyDAO.write(replyDTO) >= 1) {
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