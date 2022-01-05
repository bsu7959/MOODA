<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
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
	String m_idx = request.getParameter("m_idx");
	String d_useridx = request.getParameter("d_useridx");
	if(dao.unfollow(m_idx, d_useridx)) {
		System.out.println("1");
		out.println("Y");
	}else {
		System.out.println("2");
		out.println("N");
	}
}
%>