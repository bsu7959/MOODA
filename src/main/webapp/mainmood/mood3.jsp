<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.mooda.diary.DiaryDTO" %>
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
	LocalDateTime today = LocalDateTime.now();
	int month = Integer.parseInt(String.valueOf(today).substring(5,7));
	String realMonth = "";
	String year = String.valueOf(today).substring(0,4);
	if(month < 10) {
		realMonth = "0" + String.valueOf(month);
	}else {
		realMonth = String.valueOf(month);
	}
	System.out.println(year + "-" + month);
	list = dao.getDiaryList(m_idx, year + "-" + realMonth);
	System.out.println(today);
	System.out.println(realMonth);
	System.out.println(year);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOODA | MOOD</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script src="../js/setting.js"></script>
    <script src="../js/friends.js"></script>
    <script src="../js/diary.js"></script>

</head>

<body>
	<input type="hidden" id="m_idx" value=<%=m_idx %>>
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
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='./mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='./mood3.jsp' class="tab_highlighted title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='../maincal/cal1.jsp' class="title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab"><a href='../friends/friends.jsp' class="title_font_size">FRIENDS</a></p>
                    <p class="menu1_content_tab"><a href='../notice.jsp' class='title_font_size'>NOTICE</a></p>
                </div>
            </div>


            <div class="content">
                <div class="content_title">
				<p class="title_year title_font_size" id="title_year">2021</p>
                <div id="month_title">
                <ul>
               		<li><input type="button" id="prev_month_btn" onclick="prevMonth()"></li>
               		<li><span class="title_month" id="title_month">March</span></li>
               		<li><input type="button" id="next_month_btn" onclick="nextMonth()"></li>
                </ul>
                </div>
             
                </div>
                <div class="content_mainPage">
                     <div class="write_button" id="write_button"><img src="../images/+btn.png"></div>
                     <div class="mood_btn turnoff" id="mood_btn">
                         <img src="../images/xbtn.png">
                     </div>
                <%
                	if(list.size() == 0) {
                %>
                    <div class="content_mainPage_mood1box">
                        <div class="content_mainPage_mood1box_img1"><img src="../images/mood/big_mood.png"></div>
                        <p class="content_mainPage_mood1box_bgText">오늘의 기분은 어떤가요?</p>
                    </div>
                    <%
                	}else {
                    %>
                    <!-- 다이어리 컨텐츠 반복문 들어갈곳 -->
                    <div class="diary_mood_main">
                    	<%
                    	for(DiaryDTO diary : list) {
                    	%>
                        <div class="diary_mood_container" id="diary_mood_container" onclick="sendDiary(this)">
                            <img src="../images/mood/mood-<%=diary.getD_mood() %>.png">
                            <input type="hidden" id=<%=diary.getD_idx() %> value=<%=diary.getD_idx() %>>
                            <input type="hidden" id=<%=diary.getD_regdate() %> value=<%=diary.getD_regdate() %>>
                        </div>
						<%
                    	}
						%>
                    </div>
                    <%
                	}
                    %>                  
                    <div class="diary_mood_button" id="diary_mood_button">
                        <div class="add_mood turnoff" id="add_mood">
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-1.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-2.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-3.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-4.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-5.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-6.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-7.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-8.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-9.png">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="menu2 clear">
                <div class="menu2_content">

                </div>

            </div>
        </div>
        <script>
        'use strict';
		function sendDiary(e) {
			const d_idx = $(e).children().next().val();

					document.getElementById("comment_didx").value = d_idx;
					const xhr = new XMLHttpRequest();
					xhr.open("GET", "./diary_ok.jsp?d_idx="+d_idx, true);
					xhr.send();

					xhr.onreadystatechange = function() {
						if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
							const json = JSON.parse(xhr.responseText);
							console.log(json);
							console.log(json.d_mood);
							console.log(json.d_week);
							$('#diary_title').html(json.d_title);
							$('#diary_day').html(json.d_day);
							$('#diary_week').html(json.d_week);
							$('#diary_content').html(json.d_content);
							$('#diary_img').html(`<img src='../images/mood/mood-${json.d_mood}.png'>`);
							$('#d_idx').val(json.d_idx);
							console.log("이미지" + json.d_img);
							const img = json.d_img;
							if(img.length > 4){
								console.log("널");
								$('#diary_photo').html(`<img src='../upload/${json.d_img}' alt="이미지">`);
								
							}else{
								console.log("dd");
								$('#diary_photo').html('');
							}
							if(json.d_sticker != 100) {
								const folderNum = parseInt(json.d_sticker / 100);
								const stickerNum = json.d_sticker - folderNum * 100;
								$('#diary_sticker2').html(`<img src='../images/sticker${folderNum}/sticker-${folderNum}-${stickerNum}.png' alt="스티커">`);
							}
						}
					}
					for(let i=1; i<21; i++){
						document.getElementById("reply_idx"+i).innerHTML = null;
					}
					const xhr2 = new XMLHttpRequest();
					xhr2.open("GET", "./comment_ok.jsp?d_idx="+d_idx, true);
					xhr2.send();

					xhr2.onreadystatechange = function() {
						if(xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200) {
							const json = xhr2.responseText;
							console.log(json);
							let commentList = [];
							commentList = json.split("%");
							for(let i=0; i<commentList.length-1; i++){
								let commentName = [];
								commentName = commentList[i].split(",");
								document.getElementById("reply_idx"+(i+1)).innerHTML = commentName[1] + " : " + commentName[0];
							}
						}
					}

			$('#show_page').removeClass('turnoff');
			$('#show_page').addClass('turnon');
		}
        </script>
        <!-- body end -->
        <!-- 팝업 -->
        <!-- 작성창 -->
        <div class="write_page turnoff" id="write_page">
           <form id="diary_write" method="post" action="diary_write_ok.jsp"  enctype="multipart/form-data">
               <div class="write_page_closer" id="write_page_closer"></div>
               <div class="write_page_box">
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
                <div class="reply_content reply_idx<%=i%> content_font_size" id="reply_idx<%=i%>"></div>
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

</body>
	<script language="javascript" type="text/javascript">
		printYearMonth();
	</script>

</html>
<%}%>