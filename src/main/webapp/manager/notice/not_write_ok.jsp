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
<jsp:useBean id="notice" class="com.koreait.mooda.manager.notice.NoticeDTO"/>
<jsp:useBean id="dao" class="com.koreait.mooda.manager.notice.NoticeDAO"/>
<jsp:setProperty property="*" name="notice"/>
<% if(dao.write(notice) == 1){
%>
   <script>
      alert('등록되었습니다');
      location.href="./notice.jsp";
   </script>
<%
   }else{
%>
   <script>
      alert('등록실패!');
      history.back();
   </script>
<%
   }
%><%}%>