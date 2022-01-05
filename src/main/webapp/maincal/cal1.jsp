<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.mooda.diary.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDateTime" %>
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
	String m_idx = String.valueOf(session.getAttribute("m_idx"));
	List<DiaryDTO> list = new ArrayList<>();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script src="../js/setting.js"></script>
    <script src="../js/diary.js"></script>

    <%
		LocalDateTime today1 = LocalDateTime.now();
    	String nowYear = String.valueOf(today1).substring(0,4);
    	String nowMonth = String.valueOf(today1).substring(5,7);
    	int nowDay=0;// = String.valueOf(request.getParameter("nowday"));
    	if(request.getParameter("mini_d_main1") != null && !request.getParameter("mini_d_main1").equals("")) {
    		nowYear = String.valueOf(request.getParameter("mini_d_main1"));
    		if(Integer.parseInt(String.valueOf(request.getParameter("mini_d_main2"))) + 1 < 10) {
    			nowMonth = "0" + String.valueOf(Integer.parseInt(String.valueOf(request.getParameter("mini_d_main2"))) + 1);
    		} else {
    			nowMonth = String.valueOf(Integer.parseInt(String.valueOf(request.getParameter("mini_d_main2"))) + 1);
    		}
    		nowDay = Integer.parseInt(String.valueOf(request.getParameter("mini_d_main3"))) - 1;
    		System.out.println(nowYear + "-1" + nowMonth);
    		list = dao.getDiaryList(m_idx, nowYear + "-" + nowMonth);
    	
    		
    %>
    <script>
    	today = new Date(<%=request.getParameter("mini_d_main1")%>, <%=request.getParameter("mini_d_main2")%>, 1);
    	miniToday = new Date(<%=request.getParameter("mini_d_main1")%>, <%=request.getParameter("mini_d_main2")%>, 1);
    </script>
    <%
    	} else if(request.getParameter("year_to_month1") != null && !request.getParameter("year_to_month1").equals("")) {
    %>
    <script>
    	today = new Date(<%=request.getParameter("year_to_month1")%>, <%=request.getParameter("year_to_month2")%>, today.getDate());
    	miniToday = new Date(<%=request.getParameter("year_to_month1")%>, <%=request.getParameter("year_to_month2")%>, today.getDate());
    </script>
    <%	
    	nowYear = request.getParameter("year_to_month1");
   	 	list = dao.getDiaryList(m_idx, nowYear + "-" + nowMonth);
    	} else {
    		System.out.println(nowYear + "-3" + nowMonth);
    		list = dao.getDiaryList(m_idx, nowYear + "-" + nowMonth);
    	}
    %>
    <title>틀</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
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
                <a href='../Member/modify.jsp'><img src="../images/mypage-icon.png" alt="mypage"></a>
                <a href='../setting/font.jsp'><img src="../images/setting-icon.png" alt="setting"></a>
                <a href='../Member/logout.jsp'><img src="../images/logout-icon.png" alt="logout"></a>
            </div>
        </div>
        <!-- header끝 -->

        <!-- body -->
        <%

        	for(DiaryDTO diary : list) {
        		int day = Integer.parseInt(diary.getD_regdate().substring(8,10));
        %>
        		<input type="hidden" id=<%=day%> value=<%=diary.getD_mood() %>>
        		<input type="hidden" value=<%=diary.getD_idx() %>>
        <%
        	}
        %>
        <input type="hidden" id="diary_size" value=<%=list.size() %>>

        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='../mainmood/mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='../mainmood/mood3.jsp' class="title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='./cal1.jsp' class="tab_highlighted title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab2"><a href='./cal1.jsp' class="tab_highlighted semi_tit_font_size">DIARY</a></p>
                    <p class="menu1_content_tab2"><a href='./schedule.jsp' class="semi_tit_font_size">SCHEDULE</a></p>
                    <p class="menu1_content_tab "><a href='../friends/friends.jsp' class="title_font_size">FRIENDS</a></p>
                    <p class="menu1_content_tab"><a href='../notice.jsp' class='title_font_size'>NOTICE</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">                 
                    <p class="title_year" onclick="submit()">2021</p>
                    <p class="title_month" id="title_month">April</p>
                </div>
                <div class="content_mainPage">
                    <div class="day">
                        <div class="mon">MON</div>
                        <div class="tue">TUE</div>
                        <div class="wen">WEN</div>
                        <div class="tur">TUR</div>
                        <div class="fri">FRI</div>
                        <div class="sat">SAT</div>
                        <div class="sun">SUN</div>
                    </div>
                    <div class="w1 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date1" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date2" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date3" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date4" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date5" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date6" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date7" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>
                    <div class="w2 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date8" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date9" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date10" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date11" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date12" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date13" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date14" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>
                    <div class="w3 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date15" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date16" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date17" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date18" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date19" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date20" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date21" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>
                    <div class="w4 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date22" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date23" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date24" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date25" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date26" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date27" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date28" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>
                    <div class="w5 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date29" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date30" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date31" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date32" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date33" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date34" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date35" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>
                    <div class="w6 week">
                        <div class="mon right_border" onclick="writeOn(this)">
                            <div id="date36" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tue right_border" onclick="writeOn(this)">
                            <div id="date37" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="wen right_border" onclick="writeOn(this)">
                            <div id="date38" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="tur right_border" onclick="writeOn(this)">
                            <div id="date39" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="fri right_border" onclick="writeOn(this)">
                            <div id="date40" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sat right_border" onclick="writeOn(this)">
                            <div id="date41" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                        <div class="sun" onclick="writeOn(this)">
                            <div id="date42" class="date"></div>
                            <div class="emotion"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="menu2 clear">
                 <div class="menu2_content">
                    <div class="prev_month" onclick="prevMiniDiary()"></div>
                    <div class="mini_title"></div>
                    <div class="mini_calendar" onclick="submitMiniDiary()">
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
                    <div class="next_month" onclick="nextMiniDiary()"></div>
                </div>

            </div>
        </div>
        <!-- body end -->
        <!-- 팝업 -->
        <!-- 작성창 -->
        <div class="write_page turnoff" id="write_page">
           <form id="diary_write" method="post" action="diary_write_ok.jsp"  enctype="multipart/form-data">
               <div class="write_page_closer" id="write_page_closer"></div>
               <div class="write_page_box">
               <script>
               'use strict';
	               let rretoday = new Date();   
	
	               let rredate = rretoday.getDate();  // 날짜
	               let rreday = rretoday.getDay();  // 요일
	               const whatday = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
	               console.log(rredate);
	               console.log(whatday[rreday]);
	               $('#write_date').html(rredate);
	               $('#write_day').html(whatday[rreday]);
               </script>
                   <div class="write_date_and_day">
                       <span class="write_date" id="write_date"></span>&nbsp;
                       <span class="write_day" id="write_day"></span>
                       <input type="hidden" name="diary_write_year" id="diary_write_year" value="2021">
                       <input type="hidden" name="diary_write_month" id="diary_write_month" value="04">
                       <input type="hidden" name="diary_write_date" id="diary_write_date" value="07">
                   </div>
                   <div class="main_mood_img">
                       <img src="../images/mood/mood-1.png" class="mood_img" id="mood_img">
                       <input type="hidden" name="diary_mood" id="diary_mood" value="1">
                   </div>
                   <div class="write_content_all">
                       <p class="write_title"><input type="text" name="diary_title" value="기분 좋아"></p>
                       <div class="marker clear">
                           <div class="marker_start">
                               <img src="../images/marker/marker_start_0001_핑크.png" class="marker_start_img">
                           </div>
                           <div class="marker_middle">
                               <img src="../images/marker/marker_middle_0001_핑크.png" class="marker_middle_img">
                           </div>
                           <div class="marker_end">
                               <img src="../images/marker/marker_end_0001_핑크.png" class="marker_end_img">
                           </div>
                       </div>
                       <p class="write_content"><textarea cols="35" rows="6" class="form_control" id="p_content" name="diary_content"></textarea></p>
                       <script type="text/javascript"></script>
                       <div id="sticker_view" style="width : 40px; height : 40px; background-size : 100% 100%;"></div>
                       <input type="hidden" name="diary_sticker" id="diary_sticker" value="100">
                                         
                   </div>
               </div>
                                      <p class="write_open">공개설정&nbsp; : 
                          <label><input type="radio" name="diary_open" value="0">&nbsp;전체공개&nbsp;</label>&nbsp;
                          <label><input type="radio" name="diary_open" value="1">&nbsp;친구공개&nbsp;</label>&nbsp;
                          <label><input type="radio" name="diary_open" value="2" checked>&nbsp;나만보기&nbsp;</label>&nbsp;
                       </p>  
               <div class="write_page_img" id="write_page_img"></div>
               <input type="file" name="diary_image" id="diary_image" accept="image/*" style="display : none">
               <div class="write_page_font" id="write_page_font" onclick="CKEDITOR.replace('p_content', {height: 160})"></div>
               <div class="write_page_sticker" id="write_page_sticker" onclick="stickerClick();"></div>
               <div class="write_page_done"><input type="image" class="write_page_done_btn" src="../images/check-icon.png" alt="작성완료버튼"></div>
            </form>
        </div>
        <!-- 열람창 -->
        <div class="show_page turnoff" id="show_page">
        	<input type="hidden" id="d_idx">
            <div class="show_page_closer" id="show_page_closer"></div>
            <div class="show_page_box">
                <div class="spb1">
                    <li class="spb1_Nday" id="diary_day">json.d_day</li>
                    <li class="spb1_day content_font_size" id="diary_week">json.d_week</li>
                </div>
                <div class="spb_img" id="diary_img">
                    <img src="../images/mood/mood-8.png">
                </div>
                <div class="spb_title content_font_size" id="diary_title">완전 좋아!</div>
                <div class="spb_content content_font_size" id="diary_content">
                    <li>json.d_content</li>
                </div>
                <div class="spb_photo" id="diary_photo">
                    json.d_img
                </div>
                <div class="spb_sticker" id="diary_sticker2">
                </div>
            </div>
            <div class="show_page_delete" onclick="diary_del()"></div>
            <div class="show_page_reply" id="show_page_reply"></div>
            <script>
            	function diary_del() {
            		location.href="./diary_delete_ok.jsp?d_idx="+$('#d_idx').val();
            	}
            </script>
        </div>
        <!-- 댓글창 -->
        <div class="reply_page turnoff" id="reply_page">
            <div class="reply_page_closer" id="reply_page_closer"></div>
            <div class="reply_page_box">
            <%
            	for(int i=1; i<21; i++) {
            %>
                <div class="reply_content reply_idx<%=i%>" id="reply_idx<%=i%>"></div>
            <%
            	}
            %>  
            </div>
            <div class="reply_page_write">
                <form id="reply_page_form" method="post" action="./comment_write_ok.jsp">
                    <textarea name="comment_write" required></textarea>
                    <input type="hidden" name="comment_didx" id="comment_didx" value="">
                    <input type="submit" name="reply_submit" value="작성">
                </form>
            </div>
        </div>
        <!-- 스티커 -->
        <div class="sticker_page turnoff" id="sticker_page">
            <div class="sticker_page_nav">
            <%
            	for(int i=2; i<7; i++) {
            		
          	%>
          		<img src="../images/sticker<%=i%>/sticker-<%=i%>-1.png" class="sticker_nav" id="sticker_nav<%=i%>" style="width : 40px; maring : 0 20px;">
            <%	
            	}
            %>
            </div>
            <div class="sticker_page_closer" id="sticker_page_closer"></div>
            <div class="sticker_page_box" style="overflow : scroll">
            <%
            	for(int i=1; i<29; i++) {           		
			%>
				<img src="../images/sticker2/sticker-2-<%=i%>.png" class="sticker_content" id="sticker_content<%=i%>" style="width : 75px; height : 75px; margin : 12px;">
				<input type="hidden" id="sticker_id<%=i%>" value="<%=200+i%>"> 
            <%
            	}
            %>
            </div>

        </div>
        <footer>
            <p>copyright</p>
        </footer>
    </div>

	<form id="send_year" action="cal2.jsp" method="post">
   	<input type="hidden" id="month_to_year" name="month_to_year" value="6783">                 	
    </form>
    <form id="send_diary" action="cal1.jsp" method="post">
    	<input type="hidden" id="mini_d_main1" name="mini_d_main1" value="1111">
    	<input type="hidden" id="mini_d_main2" name="mini_d_main2" value="1">
    	<input type="hidden" id="mini_d_main3" name="mini_d_main3" value="1">
    </form>
    <script language="javascript" type="text/javascript">
    printCalendar();
    printMiniDiary();
    moodDefault(1);
    </script>
    <!-- 작성된 일기 받아오기 -->
    <script>
        'use strict';
        for(let i=1; i<=42; i++) {
        	for(let j=1; j<43; j++) {
        		if($(`#date${j}`).text()==$(`#${i}`).attr('id')) {
        			const mood = $(`#${i}`).val();
        			const d_idx = $(`#${i}`).next().val();
        			$(`#date${j}`).next().html(`<img src='../images/mood/mood-${mood}.png'>
        			<input type="hidden" value=${d_idx}>`);
        			break;
        		}
        	}
        }
    </script>
</body>

</html>
<%}%>