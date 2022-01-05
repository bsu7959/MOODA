<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.mooda.member.MemberDTO" %>
<jsp:useBean id="member" class="com.koreait.mooda.member.MemberDTO"/>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="member"/>
<%	
	member = dao.login(member);
	if(member != null) {
		if(!member.getM_userid().equals("admin1")) {
			session.setAttribute("m_idx", member.getM_idx());
		}
		session.setAttribute("m_userid", member.getM_userid());
		session.setAttribute("m_name", member.getM_name());
		session.setAttribute("fontSize", member.getM_fontSize());
		session.setAttribute("fontStyle", member.getM_fontStyle());
		session.setAttribute("background", member.getM_background());
		%>
		<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>MOODA | MOOD</title>
</head>
<body>
	<input type="hidden" id="idx" value=<%=member.getM_idx() %>>
	<input type="hidden" id="fontSize" value=<%=member.getM_fontSize() %>>
	<input type="hidden" id="fontStyle" value=<%=member.getM_fontStyle() %>>
	<input type="hidden" id="backgroundColor" value=<%=member.getM_background() %>>
	<input type="hidden" id="open" value=<%=member.getM_open() %>>
</body>

</html>
			<script>
				sessionStorage.setItem("m_idx", $('#idx').val());
				sessionStorage.setItem("fontSize", $('#fontSize').val());
				sessionStorage.setItem("fontStyle", $('#fontStyle').val());
				sessionStorage.setItem("backgroundColor", $('#backgroundColor').val());
				console.log($('#open').val());
				sessionStorage.setItem("open", $('#open').val());
				location.href="../index.jsp";
			</script>
		<%
	}else {
		%>
			<script>
				alert('로그인 실패');
				history.back();
			</script>
		<%
	}
%>

