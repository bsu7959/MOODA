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
	request.setCharacterEncoding("UTF-8");
	String m_idx = String.valueOf(session.getAttribute("m_idx"));
	System.out.println(m_idx);
	String fontStyle = request.getParameter("font_style");
	fontStyle = dao.fontStyle(fontStyle, m_idx);
	session.setAttribute("fontStyle", fontStyle);
	out.println(fontStyle);
}
%>