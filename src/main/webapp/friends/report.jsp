<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.koreait.mooda.diary.DiaryDAO"/>

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
	String d_idx = request.getParameter("d_idx");
	String d_useridx = request.getParameter("d_useridx");
	if(dao.report(d_idx, d_useridx) == 3) {
		out.println("Y");
	}else {
		out.println("N");
	}
}
%>