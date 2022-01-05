<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
	if(!String.valueOf(session.getAttribute("m_userid")).equals("admin1")) {
		System.out.println("2");
		%>
			<script>
				alert('잘못된 접근');
				location.href="../../index.jsp";
			</script>
		<%
	}else {
%>
<jsp:useBean id="comment" class="com.koreait.mooda.manager.comment.CommentDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.comment.CommentDAO" />
<jsp:setProperty property="*" name="comment"/>

<% if(dao.del(comment)==1){
%>
	<script>
		alert('삭제되었습니다');
		location.href="./moodaComment.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert('삭제실패!');
		history.back();
	</script>
<%
	}
	}
%>