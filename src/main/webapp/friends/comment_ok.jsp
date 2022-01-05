<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.koreait.mooda.comment.*" %>
<jsp:useBean id="commentDAO" class="com.koreait.mooda.comment.CommentDAO"/>
<jsp:useBean id="commentDTO" class="com.koreait.mooda.comment.CommentDTO"/>
<jsp:useBean id="memberDAO" class="com.koreait.mooda.member.MemberDAO"/>
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
	int d_idx = Integer.valueOf(String.valueOf(request.getParameter("d_idx")));
	System.out.println(d_idx);
	List<CommentDTO> commentList = commentDAO.selectList(d_idx);
	String json2 = "";
	for(CommentDTO c : commentList) {
		String temp = memberDAO.selectName(c.getC_useridx());
		json2 += c.getC_text() + "," + temp + "%";
	}
	out.println(json2);
}
%>