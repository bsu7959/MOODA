<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.*" %>
<%@ page import="com.koreait.mooda.schedule.*" %>
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
	List<ScheduleDTO> list = new ArrayList<>();
	
%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/schedule.js"></script>
    <script src="../js/setting.js"></script>
    <%
		LocalDateTime today1 = LocalDateTime.now();
    	String nowYear = String.valueOf(today1).substring(0,4);
    	String nowMonth = String.valueOf(today1).substring(5,7);
    	int nowDay=0;// = String.valueOf(request.getParameter("nowday"));
    	if(request.getParameter("mini_s_main1") != null && !request.getParameter("mini_s_main1").equals("")) {
    		nowYear = String.valueOf(request.getParameter("mini_s_main1"));
    		if(Integer.parseInt(String.valueOf(request.getParameter("mini_s_main2"))) + 1 < 10) {
    			nowMonth = "0" + String.valueOf(Integer.parseInt(String.valueOf(request.getParameter("mini_s_main2"))) + 1);
    		} else {
    			nowMonth = String.valueOf(Integer.parseInt(String.valueOf(request.getParameter("mini_s_main2"))) + 1);
    		}
    		nowDay = Integer.parseInt(String.valueOf(request.getParameter("mini_s_main3"))) - 1;
    		
    %>
    <script>
    	today = new Date(<%=request.getParameter("mini_s_main1")%>, <%=request.getParameter("mini_s_main2")%>, 1);
    	miniToday = new Date(<%=request.getParameter("mini_s_main1")%>, <%=request.getParameter("mini_s_main2")%>, 1);
    </script>
      <%
    	} else if(request.getParameter("year_to_month1") != null && !request.getParameter("year_to_month1").equals("")) {
    		nowYear = request.getParameter("year_to_month1");
    %>
    <script>
    	today = new Date(<%=request.getParameter("year_to_month1")%>, <%=request.getParameter("year_to_month2")%>, today.getDate());
    	miniToday = new Date(<%=request.getParameter("year_to_month1")%>, <%=request.getParameter("year_to_month2")%>, today.getDate());
    </script>
    <%	
   	 list = scheduleDAO.list(nowYear,nowMonth,m_idx); 
    	}else{
    	list = scheduleDAO.list(nowYear, nowMonth, m_idx);
    	}
    %>
    <title>틀</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <style>
    	#write_schedule_btn {
    		display : inline-block;
    		margin : 120px 80px;
    		width : 60px;
    		height : 40px;
    		font-size : 20px;
    		opacity : 0.6;
    		border : 3px solid white;
    		text-align : center;
    	}
    	
    </style>
</head>

<body>


    <div class="container">
        <div class="header">
            <div class="nav_bar clear">
                <form method="get" action="../friends/search.jsp" name="search" id="search_frm">
                	<input type="search" class="search" placeholder="검색" name="input" id="search_input">
                	<div id="search_btn"></div>
                </form>
                <script>
            	$('#search_btn').on('click', function() {
            		if($('#search_input').val()!=''){
            		$('#search_frm').submit();
            		}else{
            			alert('검색어를 입력하세요');
            		}
            	});
                </script>
                <a href='../member/modify.jsp'><img src="../images/mypage-icon.png" alt="mypage"></a>
                <a href='../setting/font.jsp'><img src="../images/setting-icon.png" alt="setting"></a>
                <a href='../Member/logout.jsp'><img src="../images/logout-icon.png" alt="logout"></a>
            </div>
        </div>
        <!-- header끝 -->
		<%
			int cnt = 1;
        	for(ScheduleDTO schedule : list) {
        		int day = Integer.parseInt(schedule.getS_date().substring(6,8));
        %>
        		<input type="hidden" id=<%=cnt%> name=<%=day %> value=<%=schedule.getS_time() %>>
        		<input type="hidden" value=<%=schedule.getS_idx() %>>
        <%
        		cnt++;
        	}
        %>
        <input type="hidden" id="schedule_size" value=<%=list.size() %>>
        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='../mainmood/mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='../mainmood/mood3.jsp' class="title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='./cal1.jsp' class="tab_highlighted title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab2"><a href='./cal1.jsp' class=" semi_tit_font_size">DIARY</a></p>
                    <p class="menu1_content_tab2"><a href='./schedule.jsp' class="tab_highlighted semi_tit_font_size">SCHEDULE</a></p>
                    <p class="menu1_content_tab "><a href='../friends/friends.jsp' class="title_font_size">FRIENDS</a></p>
                    <p class="menu1_content_tab"><a href='../notice.jsp' class='title_font_size'>NOTICE</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">                 
                    <p class="title_year" id="title_year"onclick="submit()">2021</p>
                    <p class="title_month" id="title_month">April</p>
                    <div class="content_title_highlighting"></div>
                </div>
                <div class="content_mainPage">
                    <div class="day">
                        <div class="mon">MON</div>
                        <div class="tue">TUE</div>
                        <div class="wen">WED</div>
                        <div class="tur">TUR</div>
                        <div class="fri">FRI</div>
                        <div class="sat">SAT</div>
                        <div class="sun">SUN</div>
                    </div>
                    <div class="w1 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date1" class="date"></div>
                            <div id="emotion1" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date2" class="date"></div>
                            <div id="emotion2" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date3" class="date"></div>
                            <div id="emotion3" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date4" class="date"></div>
                            
                            
                            
                            <div id="emotion4" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date5" class="date"></div>
                            <div id="emotion5" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date6" class="date"></div>
                            <div id="emotion6" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date7" class="date"></div>
                            <div id="emotion7" class="emotion"></div>
                        </div>
                    </div>
                    <div class="w2 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date8" class="date"></div>
                            <div id="emotion8" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date9" class="date"></div>
                            <div id="emotion9" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date10" class="date"></div>
                            <div id="emotion10" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date11" class="date"></div>
                            <div id="emotion11" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date12" class="date"></div>
                            <div id="emotion12" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date13" class="date"></div>
                            <div id="emotion13" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date14" class="date"></div>
                            <div id="emotion14" class="emotion"></div>
                        </div>
                    </div>
                    <div class="w3 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date15" class="date"></div>
                            <div id="emotion15" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date16" class="date"></div>
                            <div id="emotion16" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date17" class="date"></div>
                            <div id="emotion17" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date18" class="date"></div>
                            <div id="emotion18" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date19" class="date"></div>
                            <div id="emotion19" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date20" class="date"></div>
                            <div id="emotion20" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date21" class="date"></div>
                            <div id="emotion21" class="emotion"></div>
                        </div>
                    </div>
                    <div class="w4 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date22" class="date"></div>
                            <div id="emotion22" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date23" class="date"></div>
                            <div id="emotion23" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date24" class="date"></div>
                            <div id="emotion24" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date25" class="date"></div>
                            <div id="emotion25" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date26" class="date"></div>
                            <div id="emotion26" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date27" class="date"></div>
                            <div id="emotion27" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date28" class="date"></div>
                            <div id="emotion28" class="emotion"></div>
                        </div>
                    </div>
                    <div class="w5 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date29" class="date"></div>
                            <div id="emotion29" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date30" class="date"></div>
                            <div id="emotion30" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date31" class="date"></div>
                            <div id="emotion31" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date32" class="date"></div>
                            <div id="emotion32" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date33" class="date"></div>
                            <div id="emotion33" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date34" class="date"></div>
                            <div id="emotion34" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date35" class="date"></div>
                            <div id="emotion35" class="emotion"></div>
                        </div>
                    </div>
                    <div class="w6 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date36" class="date"></div>
                            <div id="emotion36" class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date37" class="date"></div>
                            <div id="emotion37" class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date38" class="date"></div>
                            <div id="emotion38" class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date39" class="date"></div>
                            <div id="emotion39" class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date40" class="date"></div>
                            <div id="emotion40" class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date41" class="date"></div>
                            <div id="emotion41" class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date42" class="date"></div>
                            <div id="emotion42" class="emotion"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="menu2 clear">
                <div class="menu2_content">
                    <div class="prev_month" onclick="prevMiniSchedule()"></div>
                    <div class="mini_title"></div>
                    <div class="mini_calendar" onclick="submitMiniSchedule()">
                        <table width="100%" height="100%" border="0">
                            <tr>
                                <td id="miniDate1"></td>
                                <td id="miniDate2"></td>
                                <td id="miniDate3"></td>
                                <td id="miniDate4"></td>
                                <td id="miniDate5"></td>
                                <td id="miniDate6" class="miniSat"></td>
                                <td id="miniDate7" class="miniSun"></td>
                            </tr>
                            <tr>
                                <td id="miniDate8"></td>
                                <td id="miniDate9"></td>
                                <td id="miniDate10"></td>
                                <td id="miniDate11"></td>
                                <td id="miniDate12"></td>
                                <td id="miniDate13" class="miniSat"></td>
                                <td id="miniDate14" class="miniSun"></td>
                            </tr>
                            <tr>
                                <td id="miniDate15"></td>
                                <td id="miniDate16"></td>
                                <td id="miniDate17"></td>
                                <td id="miniDate18"></td>
                                <td id="miniDate19"></td>
                                <td id="miniDate20" class="miniSat"></td>
                                <td id="miniDate21" class="miniSun"></td>
                            </tr>
                            <tr>
                                <td id="miniDate22"></td>
                                <td id="miniDate23"></td>
                                <td id="miniDate24"></td>
                                <td id="miniDate25"></td>
                                <td id="miniDate26"></td>
                                <td id="miniDate27" class="miniSat"></td>
                                <td id="miniDate28" class="miniSun"></td>
                            </tr>
                            <tr>
                                <td id="miniDate29"></td>
                                <td id="miniDate30"></td>
                                <td id="miniDate31"></td>
                                <td id="miniDate32"></td>
                                <td id="miniDate33"></td>
                                <td id="miniDate34" class="miniSat"></td>
                                <td id="miniDate35" class="miniSun"></td>
                            </tr>
                            <tr>
                                <td id="miniDate36"></td>
                                <td id="miniDate37"></td>
                                <td id="miniDate38"></td>
                                <td id="miniDate39"></td>
                                <td id="miniDate40"></td>
                                <td id="miniDate41" class="miniSat"></td>
                                <td id="miniDate42" class="miniSun"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="next_month" onclick="nextMiniSchedule()"></div>
                </div>
				<div id="write_schedule_btn">작성</div>
            </div>
        </div>
        <!-- body end -->
        <!-- 팝업 -->
        <!-- 작성창 -->
        <div class="write_page turnoff" id="write_page">
        	<form id="schedule_write" method="post" action="schedule_write_ok.jsp">
	            <div class="write_page_closer" id="write_page_closer"></div>
	            <div class="write_page_box">
	                <div class="write_date_and_day">
	                	<span class="write_date" id="write_year"><input name="schedule_year" id="schedule_year" type="number" min="20" max="99" required></span>&nbsp;년
	                	<span class="write_date" id="write_month"><input name="schedule_month" id="schedule_month" type="number" min="1" max="12" required></span>&nbsp;월
	                    <span class="write_date" id="write_date"><input name="schedule_date" id="schedule_date" type="number" min="1" max="30" required></span>&nbsp;일	                    
	                </div>
	                <div class="write_content_all">                  
	                    <p class="write_content"><textarea cols="35" rows="10" class="textarea" name="schedule_content">스케줄 내용</textarea></p>
	                    <p class="write_time">
	                    	시간&nbsp; : &nbsp;                    		                    
  							<input type="number" id="schedule_time_hour" name="schedule_time_hour" min="0" max="23" required>
  							<label for="schedule_time_hour">시&nbsp;</label>                   	                    
  							<input type="number" id="schedule_time_minute" name="schedule_time_minute" min="0" max="59" required>
  							<label for="schedule_time_minute">분&nbsp;</label>                  		                   	
	                    </p>
	                    <input type="hidden" name="schedule_time_hour_form" id="schedule_time_hour_form" value="00">	                 
	                    <input type="hidden" name="schedule_time_minute_form" id="schedule_time_minute_form" value="00">
	                    <p class="write_alarm">알림설정&nbsp; : <label><input type="radio" name="alarm_option" value="1" checked>&nbsp;켜기&nbsp;</label>&nbsp;<label><input type="radio" name="alarm_option" value="0">&nbsp;끄기&nbsp;</label></p>                	                    
	                </div>
	            </div>
	            <div class="write_page_done"><input type="image" class="write_page_done_btn" src="../images/check-icon.png" alt="작성완료버튼"></div>
            </form>
        </div>
        <!-- 열람창 -->
        <div class="show_page turnoff" id="show_page">
            <div class="show_page_closer" id="show_page_closer"></div>
            <div class="show_page_box">
                <div class="spb1">
                    <li class="spb1_Nday" id="schedule_day">json.s_day</li>
                    <li class="spb1_day" id="schedule_week">json.s_week</li>
                </div>
                <%
                for(int i=1; i<10; i++) {
                %>
                <div id="scheduleElement<%=i%>">
                	<p><span id="scheduleTime<%=i%>">json.s_time</span><span id="scheduleAlarm<%=i%>">json.s_alarm</span></p>
                	<p id="scheduleText<%=i%>">json.s_text</p>
                </div>
                <%
                }
                %>
            </div>
            <div class="show_page_delete" id="show_page_delete"></div>
        </div>
        <footer>
            <p>copyright</p>
        </footer>
    </div>

	<form id="send_year" action="schedule2.jsp" method="post">
   		<input type="hidden" id="month_to_year" name="month_to_year" value="6783">                 	
    </form>
    <form id="send_schedule" action="schedule.jsp" method="post">
    	<input type="hidden" id="mini_s_main1" name="mini_s_main1" value="1111">
    	<input type="hidden" id="mini_s_main2" name="mini_s_main2" value="1">
    	<input type="hidden" id="mini_s_main3" name="mini_s_main3" value="3">
    </form>
    <script language="javascript" type="text/javascript">
        printCalendar();
        printMiniSchedule();
    </script>
    <script>
        'use strict';
        for(let i=1; i<=<%=cnt%>; i++) {
        	for(let j=1; j<43; j++) {
        		if($(`#date${j}`).text()==$(`#${i}`).attr('name')) {
        			const time = $(`#${i}`).val();
        			console.log(time);
        			const s_idx = $(`#${i}`).next().val();
        			document.getElementById('emotion' + j).innerHTML += time.substring(0,2) + "시 " + time.substring(3,5) + "분<br/>";
        		}
        	}
        }
    </script>
</body>

</html>
<%}%>