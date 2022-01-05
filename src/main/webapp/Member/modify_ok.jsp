<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.koreait.mooda.member.MemberDTO" %>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
<jsp:useBean id="member" class="com.koreait.mooda.member.MemberDTO"/>

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
%>
<jsp:setProperty property="*" name="member"/>
<%
	member.setM_idx(Long.parseLong(String.valueOf(session.getAttribute("m_idx"))));
	String m_interest = "";
	for(String interest : request.getParameterValues("like")) {
		m_interest += interest + "%";
	}
	member.setM_interest(m_interest);
	if(member.getM_userpw() == null || member.getM_userpw().equals("")) {
		member.setM_userpw(request.getParameter("m_userpw_cu"));
	}
	System.out.println(member);
	
	if(dao.modify(member) == 1) {
		%>
			<script>
				alert('회원정보 수정이 완료되었습니다');
				location.href='./logout.jsp';
			</script>
		<%
	}else {
		%>
			<script>
				alert('회원정보 수정 실패');
				history.back();
			</script>
		<%
	}
}
%>