<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="scheduleDTO" class="com.koreait.mooda.schedule.ScheduleDTO"/>
<jsp:useBean id="scheduleDAO" class="com.koreait.mooda.schedule.ScheduleDAO"/>
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
	if(scheduleDAO.delete(String.valueOf(request.getParameter("s_idx"))) >= 1) {
%>
	<script>
		alert("삭제되었습니다.");
		location.href = "./schedule.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alert("삭제되지 않았습니다.");
		history.back();
	</script>
<%
	}
}
%>