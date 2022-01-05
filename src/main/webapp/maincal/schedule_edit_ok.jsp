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
	scheduleDTO.setS_idx(Integer.parseInt(String.valueOf(request.getParameter(""))));
	scheduleDTO.setS_date(String.valueOf(request.getParameter("schedule_date")));
	if(Integer.parseInt(String.valueOf(request.getParameter("schedule_time_hour"))) < 10) {
		if(Integer.parseInt(String.valueOf(request.getParameter("schedule_time_minute"))) < 10) {
			scheduleDTO.setS_time("0" + String.valueOf(request.getParameter("schedule_time_hour")) + "-" + "0" + String.valueOf(request.getParameter("schedule_time_minute")));
		} else {
			scheduleDTO.setS_time("0" + String.valueOf(request.getParameter("schedule_time_hour")) + "-" + String.valueOf(request.getParameter("schedule_time_minute")));
		}
	} else {
		if(Integer.parseInt(String.valueOf(request.getParameter("schedule_time_minute"))) < 10) {
			scheduleDTO.setS_time(String.valueOf(request.getParameter("schedule_time_hour")) + "-" + "0" + String.valueOf(request.getParameter("schedule_time_minute")));
		} else {
			scheduleDTO.setS_time(String.valueOf(request.getParameter("schedule_time_hour")) + "-" + String.valueOf(request.getParameter("schedule_time_minute")));
		}
	}
	scheduleDTO.setS_content(String.valueOf(request.getParameter("schedule_content")));
	scheduleDTO.setS_alarm(Integer.parseInt(String.valueOf(request.getParameter("alarm_option"))));
	
	if(scheduleDAO.write(scheduleDTO) >= 1) {
%>
	<script>
		alert("등록되었습니다.");
		location.href = "./schedule.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alert("등록되지 않았습니다.");
		history.back();
	</script>
<%
	}
}
%>