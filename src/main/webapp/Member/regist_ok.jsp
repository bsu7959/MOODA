<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.koreait.mooda.member.MemberDTO" %>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
<jsp:useBean id="member" class="com.koreait.mooda.member.MemberDTO"/>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="member"/>
<%
	String m_interest = "";
	for(String interest : request.getParameterValues("like")) {
		m_interest += interest + "%";
	}
	System.out.println(member.getM_userid());
	System.out.println(member.getM_name());
	member.setM_interest(m_interest);
	
	if(dao.join(member) == 1) {
		%>
			<script>
				alert('회원가입이 완료되었습니다');
				location.href='../index.jsp';
			</script>
		<%
	}else {
		%>
			<script>
				alert('회원가입 실패');
				history.back();
			</script>
		<%
	}
%>
