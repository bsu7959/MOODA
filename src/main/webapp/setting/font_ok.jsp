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
	String fontSize = request.getParameter("font_size");
	String m_idx = String.valueOf(session.getAttribute("m_idx"));
	fontSize = dao.fontSizing(fontSize, m_idx);
	session.setAttribute("fontSize", fontSize);
	out.println(fontSize);
}
%>