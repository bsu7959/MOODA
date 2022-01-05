<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<script>
	sessionStorage.clear();
	alert('로그아웃 하였습니다. 초기페이지로 돌아갑니다');
	location.href="../index.jsp"
</script>