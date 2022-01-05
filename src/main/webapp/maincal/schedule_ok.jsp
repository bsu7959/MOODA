<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.koreait.mooda.schedule.ScheduleDTO" %>
<jsp:useBean id="scheduleDAO" class="com.koreait.mooda.schedule.ScheduleDAO"/>
<jsp:useBean id="scheduleDTO" class="com.koreait.mooda.schedule.ScheduleDTO"/>
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
	String s_date = request.getParameter("s_date");
	String s_useridx = String.valueOf(session.getAttribute("m_idx"));
	System.out.println(s_date);
	List<ScheduleDTO> scheduleList = scheduleDAO.getScheduleOne(s_date, s_useridx);
	SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd"); 
	String[] week = {"일","월","화","수","목","금","토"}; 
	Calendar cal = Calendar.getInstance(); 
	Date getDate; 
	int day = Integer.parseInt(s_date.substring(6,8));
	int w = 0;
	try { 
		getDate = format.parse(s_date); 
		cal.setTime(getDate); 
		w = cal.get(Calendar.DAY_OF_WEEK)-1; 
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
	String json = week[w] + "%";
	for(ScheduleDTO s : scheduleList) {
		System.out.println("알람"+s.getS_alarm());
		json += s.getS_time() + "," + s.getS_content() + ","  + s.getS_alarm() +  ","  + s.getS_idx() + "%";
	}
	
	out.println(json);
}
%>