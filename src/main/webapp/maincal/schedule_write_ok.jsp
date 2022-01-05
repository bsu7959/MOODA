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
	String m_idx = String.valueOf(session.getAttribute("m_idx"));
	request.setCharacterEncoding("utf-8");
	scheduleDTO.setS_useridx(Integer.parseInt(m_idx));
	String year = String.valueOf(request.getParameter("schedule_year"));
	String month = String.valueOf(request.getParameter("schedule_month"));
	String date = String.valueOf(request.getParameter("schedule_date"));
	String hour = String.valueOf(request.getParameter("schedule_time_hour"));
	String minute = String.valueOf(request.getParameter("schedule_time_minute"));
	if(Integer.parseInt(month) < 10) {
		if(Integer.parseInt(date) < 10) {
			scheduleDTO.setS_date(year + "-" + "0" + month + "-" + "0" + date);
		} else {
			scheduleDTO.setS_date(year + "-" + "0" + month + "-" + date);
		}
	} else {
		if(Integer.parseInt(String.valueOf(request.getParameter("schedule_date"))) < 10) {
			scheduleDTO.setS_date(year + "-" + month + "-" + "0" + date);
		} else {
			scheduleDTO.setS_date(year + "-" + month + "-" + date);
		}
	}
	if(Integer.parseInt(hour) < 10) {
		if(Integer.parseInt(minute) < 10) {
			scheduleDTO.setS_time("0" + hour + "-" + "0" + minute);
		} else {
			scheduleDTO.setS_time("0" + hour + "-" + minute);
		}
	} else {
		if(Integer.parseInt(minute) < 10) {
			scheduleDTO.setS_time(hour + "-" + "0" + minute);
		} else {
			scheduleDTO.setS_time(hour + "-" + minute);
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

