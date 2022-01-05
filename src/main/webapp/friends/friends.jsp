<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.mooda.diary.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
	List<DiaryDTO> diaryList = new ArrayList<>();
	diaryList = dao.friends(m_idx);
	System.out.println(diaryList.size());
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOODA | FRIENDS</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/setting.js"></script>
    <script src="../js/friends.js"></script>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="nav_bar clear">
                <form method="get" action="./search.jsp" name="search" id="search_frm">
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
                    <a href='../mainmood/mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='../mainmood/mood3.jsp' class="title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='../maincal/cal1.jsp' class="title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab "><a href='./friends.jsp' class="tab_highlighted title_font_size">FRIENDS</a></p>
                    <p><a href='./friends.jsp' class="tab_highlighted sub_menu semi_tit_font_size">친구들</a></p>
                    <p class="sub_menu"><a href='./friends_suggest.jsp' class=" sub_menu semi_tit_font_size">추천</a></p>
                    <p class="menu1_content_tab"><a href='../notice.jsp' class='title_font_size'>NOTICE</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">

                </div>
                <div class="content_mainPage friends_mainPage">
<%
					for(DiaryDTO diary : diaryList) {
						System.out.println(diary.getD_idx());
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
						String[] week = {"일","월","화","수","목","금","토"}; 
						Calendar cal = Calendar.getInstance(); 
						Date getDate; 
						int w = 0;
						try { 
							getDate = format.parse(diary.getD_regdate().substring(0,10)); 
							cal.setTime(getDate); 
							w = cal.get(Calendar.DAY_OF_WEEK)-1; 
							} catch (Exception e) { 
								e.printStackTrace(); 
							}
						int followCheck = dao.followCheck(m_idx, String.valueOf(diary.getD_useridx()));
						String[] idName = dao.getNameId(diary.getD_useridx());
%>
                    <div class="friends_box">
                        <div class="friends_box_header clear">
                            <p class="friends_id semi_tit_font_size"><%=idName[0] %>(<%=idName[1] %>)</p>
                            <%
                            	if(followCheck==1) {
                            %>
                            <input class="friends_follow" type="button" value="언팔로우" onclick="unfollow(this)">
                            <input type="hidden" value=<%=m_idx %>>
                            <input type="hidden" name="f_didx" value=<%=diary.getD_useridx() %>>
                            <%
                            	}else {
                            %>
                            <input class="friends_follow" type="button" value="팔로우" onclick="follow(this)">
                            <input type="hidden" value=<%=m_idx %>>
                            <input type="hidden" name="f_didx" value=<%=diary.getD_useridx() %>>
                            <%
                            	}
                            %>
                            <div class="closeBtn" onclick="closeDiary(this)">
                                <img src="../images/x-icon.png" class="closeBtnImg">
                            </div>
                        </div>
                        

                        <div class="friends_box_body" id="friends_box_body" onclick="sendDiary(this)">
                        	<input type="hidden" class="d_idx" value=<%=diary.getD_idx() %>>
                        	<input type="hidden" class="d_useridx" value=<%=diary.getD_useridx() %>>
                            <div class="friends_date_and_day">
                                <span class="friends_date title_font_size"><%=Integer.parseInt(diary.getD_regdate().substring(8,10)) %></span>&nbsp;
                                <span class="friends_day semi_tit_font_size"><%=week[w] %></span>
                            </div>
                            <div class="friends_content">
                                <div class="friends_emo">
                                    <img src="../images/mood/mood-<%=diary.getD_mood() %>.png" class="friends_emo_img">
                                </div>
                                <p class="friends_feel semi_tit_font_size"><%=diary.getD_title() %></p>
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
                                <p class="friends_board_text content_font_size"><%=diary.getD_content() %></p>
                            </div>
                        </div>

                        <div class="icon_bottom clear">
                            <div class="friends_report" onclick="report(this)">
                                <img src="../images/report-icon.png" class="reportBtn">
                            </div>
                        </div>
                    </div>
                    <%
					}
                    %>
                    <!-- 반복문 처리 -->

                </div>
            </div>
						<script>
                        	function unfollow(e) {
                        		const m_idx = $(e).next().val();
                        		const d_useridx = $(e).next().next().val();
                    			const xhr = new XMLHttpRequest();
                        		xhr.open("GET", "unfollow.jsp?m_idx="+m_idx+"&d_useridx="+d_useridx, true);
                        		xhr.send();

                        		xhr.onreadystatechange = function() {
                        			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                        				const data = xhr.responseText.trim();
										if(data=="Y") {
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().val("팔로우");
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().removeAttr('onclick');
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().attr("onclick", "follow(this)");

										}
                        			}
                        		}
                        	}
                        	
                        	function follow(e) {
                        		const m_idx = $(e).next().val();
                        		const d_useridx = $(e).next().next().val();
                    			const xhr = new XMLHttpRequest();
                        		xhr.open("GET", "follow.jsp?m_idx="+m_idx+"&d_useridx="+d_useridx, true);
                        		xhr.send();

                        		xhr.onreadystatechange = function() {
                        			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                        				const data = xhr.responseText.trim();
										if(data=="Y") {
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().val("언팔로우");
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().removeAttr('onclick');
											$("input:hidden[name='f_didx']:hidden[value="+d_useridx+"]").prev().prev().attr("onclick", "unfollow(this)");

										}
                        			}
                        		}
                        	}
                        	function closeDiary(e) {
                        		$(e).parent().parent().remove();
                        	}
                        	
                        	function report(e) {
                        		const d_idx = $(e).parent().prev().children().val();
                        		const d_useridx = $(e).parent().prev().children().next().val();
                    			const xhr = new XMLHttpRequest();
                        		xhr.open("GET", "report.jsp?d_useridx="+d_useridx+"&d_idx="+d_idx, true);
                        		xhr.send();

                        		xhr.onreadystatechange = function() {
                        			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                        				const data = xhr.responseText.trim();
										if(data=="Y") {
											alert('신고되었습니다');
										}else {
											alert('신고에 실패했습니다');
										}
                        			}
                        		}
                        	}
                        </script>
            <div class="menu2 clear">
                <div class="menu2_content">

                </div>

            </div>
                    <footer>
            <p>copyright</p>
        </footer>
        </div>
        <!-- body end -->
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
            <script>
            	function diary_del() {
            		location.href="./diary_delete_ok.jsp?d_idx="+$('#d_idx').val();
            	}
            </script>
        </div>
        <div class="show_page_reply" id="show_page_reply"></div>
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



    </div>
    <script>
        'use strict';
		function sendDiary(e) {
			const d_idx = $(e).children().val();

					document.getElementById("comment_didx").value = d_idx;
					const xhr = new XMLHttpRequest();
					xhr.open("GET", "../mainmood/diary_ok.jsp?d_idx="+d_idx, true);
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
							console.log(json.d_sticker);
							if(json.d_sticker != 100 && json.d_sticker != 0) {
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

</body>

</html>
<%}%>