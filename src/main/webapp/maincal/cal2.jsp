<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/diary.js"></script>
    <script src="../js/setting.js"></script>
    <%
    	if(request.getParameter("month_to_year") != null && !request.getParameter("month_to_year").equals("")) {
    %>
    <script>
    	today = new Date(<%=request.getParameter("month_to_year")%>, today.getMonth(), today.getDate());
    </script>
    <%	
    	}
    %>
    
    <title>틀</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <style>
        .main_box>.content {
            width: 85%;
            float: left;
            height: 885px;
        }

        .content .content_title {
            padding-top: 100px;
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

        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='../mainmood/mood1.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='../mainmood/mood3.jsp'>MOOD</a></p>
                    <p class="menu1_content_tab"><a href='./cal1.jsp' class="tab_highlighted">CALENDAR</a></p>
                    <p class="menu1_content_tab2"><a href='./cal1.jsp' class="semi_tit_font_size">DIARY</a></p>
                    <p class="menu1_content_tab2"><a href='./schedule.jsp' class="semi_tit_font_size">SCHEDULE</a></p>
                    <p class="menu1_content_tab "><a href='../friends.jsp'>FRIENDS</a></p>
                    <p class="menu1_content_tab"><a href='../notice.jsp' class='title_font_size'>NOTICE</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">
                    <div class="prev_year" onclick="prevYearCalendar()"></div>
                    <div class="year_box"></div>
                    <div class="next_year" onclick="nextYearCalendar()"></div>
                </div>
                <div class="content_mainPage">
                <%
                for(int i=0; i<12; i++) {
                %>
                    <div class="month">
                        <p class="cal_month" onclick="submit<%=i%>()"></p>
                        <div class="cal_box">
                            <table width="100%" height="100%" border="0">
                                <tr>
                                    <td class="date1"></td>
                                    <td class="date2"></td>
                                    <td class="date3"></td>
                                    <td class="date4"></td>
                                    <td class="date5"></td>
                                    <td class="date6 yearSat"></td>
                                    <td class="date7 yearSun"></td>
                                </tr>
                                <tr>
                                    <td class="date8"></td>
                                    <td class="date9"></td>
                                    <td class="date10"></td>
                                    <td class="date11"></td>
                                    <td class="date12"></td>
                                    <td class="date13 yearSat"></td>
                                    <td class="date14 yearSun"></td>
                                </tr>
                                <tr>
                                    <td class="date15"></td>
                                    <td class="date16"></td>
                                    <td class="date17"></td>
                                    <td class="date18"></td>
                                    <td class="date19"></td>
                                    <td class="date20 yearSat"></td>
                                    <td class="date21 yearSun"></td>
                                </tr>
                                <tr>
                                    <td class="date22"></td>
                                    <td class="date23"></td>
                                    <td class="date24"></td>
                                    <td class="date25"></td>
                                    <td class="date26"></td>
                                    <td class="date27 yearSat"></td>
                                    <td class="date28 yearSun"></td>
                                </tr>
                                <tr>
                                    <td class="date29"></td>
                                    <td class="date30"></td>
                                    <td class="date31"></td>
                                    <td class="date32"></td>
                                    <td class="date33"></td>
                                    <td class="date34 yearSat"></td>
                                    <td class="date35 yearSun"></td>
                                </tr>
                                <tr>
                                    <td class="date36"></td>
                                    <td class="date37"></td>
                                    <td class="date38"></td>
                                    <td class="date39"></td>
                                    <td class="date40"></td>
                                    <td class="date41 yearSat"></td>
                                    <td class="date42 yearSun"></td>
                                </tr>
                            </table>
						</div>
                    </div>
                    <form id="send_month<%=i%>" method="post" action="./cal1.jsp">
                    	<input type="hidden" class="year_to_month1" name="year_to_month1" value="3333">
                    	<input type="hidden" class="year_to_month2" name="year_to_month2" value="<%=i%>">
                    	<input type="hidden" class="year_to_month3" name="year_to_month3" value="">
                    </form>
                <%
               	}
                %>
                </div>
            </div>
        </div>
        <!-- body end -->
        <!-- 팝업 -->
        <!-- 작성창 -->
        <div class="write_page turnoff">
            <div class="write_page_closer"></div>
            <div class="write_page_box">
                <div class="write_date_and_day">
                    <span class="write_date">4</span>&nbsp;
                    <span class="write_day">WED</span>
                </div>
                <div class="main_mood_img">
                    <img src="../images/mood/mood-8.png" class="mood_img">
                </div>
                <div class="write_content_all">
                    <p class="write_title">기분 좋아</p>
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
                    <p class="write_content">내용</p>
                </div>
            </div>
            <div class="write_page_img"></div>
            <div class="write_page_font"></div>
            <div class="write_page_sticker"></div>
            <div class="write_page_done"></div>
        </div>
        <!-- 열람창 -->
        <div class="show_page turnoff">
            <div class="show_page_closer"></div>
            <div class="show_page_box">
                <div class="spb1">
                    <li class="spb1_Nday">1</li>
                    <li class="spb1_day">mon</li>
                </div>
                <div class="spb_img">
                    <img src="../images/mood/mood-8.png">
                </div>
                <div class="spb_title">완전 좋아!</div>
                <div class="spb_content">
                    <li>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error laudantium sint, similique
                        temporibus aperiam quas sunt eos, dolore soluta rem nemo culpa vel est velit! Facilis labore id
                        quaerat numquam.</li>
                </div>
                <div class="spb_photo">
                    사진 공간
                </div>
                <div class="spb_loc"><img src="../images/map-icon.png" id="map_ic">건대봉자 마라탕</div>
            </div>
            <div class="show_page_edit"></div>
            <div class="show_page_delete"></div>
            <div class="show_page_share"></div>
            <div class="show_page_reply"></div>
        </div>
        <!-- 댓글창 -->
        <div class="reply_page turnoff">
            <div class="reply_page_closer"></div>
            <div class="reply_page_box">
                <div class="reply_content reply_idx1"></div>
                <div class="reply_content reply_idx2"></div>
                <div class="reply_content reply_idx3"></div>
                <div class="reply_content reply_idx4"></div>
                <div class="reply_content reply_idx5"></div>
            </div>
            <div class="reply_page_write">
                <form>
                    <textarea name="reply_write"></textarea>
                    <input type="submit" name="reply_submit" value="작성">
                </form>
            </div>
        </div>
        <!-- 스티커 -->
        <div class="sticker_page turnoff">
            <div class="sticker_page_nav">

            </div>
            <div class="sticker_page_closer"></div>
            <div class="sticker_page_box"></div>

        </div>
        <footer>
            <p>copyright</p>
        </footer>
    </div>
    
    </div>
    <script language="javascript" type="text/javascript">
        printYearCalendar();
    </script>
</body>

</html>
<%}%>