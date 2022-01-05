<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="dto" class="com.koreait.mooda.moodcount.moodCountDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.koreait.mooda.moodcount.moodCountDAO"></jsp:useBean>
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
dto = dao.moodList(m_idx);
%>

<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mooda - 감정통계</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../js/setting.js"></script>
    <script src="../js/friends.js"></script>
    

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
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='../mainmood/mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <!--  <p class="menu1_content_tab "><a href='./base.jsp'>기본설정</a></p>-->
                    <p class="menu1_content_tab"><a href='./font.jsp' class=' title_font_size'>글자스타일</a></p>
                    <p class="menu1_content_tab"><a href='./background.jsp' class="title_font_size">배경</a></p>
                    <p class="menu1_content_tab"><a href='./stats.jsp' class=" tab_highlighted title_font_size">통계</a></p>
                    
                </div>
            </div>

            <div class="content">
                <div class="content_title">
                    
                </div>
                <div class="content_mainPage">
              
                    <div class="stats_container">
                        <h2 class="title_font_size">감정 통계 - 전체 기간 통계</h2>
                        <form action="./stats_search.jsp">
                        	<select name="year" style="width: 100px; padding: 5px; border: none; background: rgb(237,237,229)">
                        		<option value="none">년</option>
                        		<option value="2021">2021년</option>
                        		<option value="2020">2020년</option>
                        		<option value="2019">2019년</option>
                        		<option value="2018">2018년</option>
                        		<option value="2017">2017년</option>
                        		<option value="2016">2016년</option>
                        		<option value="2015">2015년</option>
                        		<option value="2014">2014년</option>
                        		<option value="2013">2013년</option>
                        		<option value="2012">2012년</option>
                        		<option value="2011">2011년</option>
                        		<option value="2020">2010년</option>
                        	</select>
                        	<select name="month" style="width: 100px; padding: 5px; border: none; background: rgb(237,237,229)">
                        		<option value="none">월</option>
                        		<option value="01">1월</option>
                        		<option value="02">2월</option>
                        		<option value="03">3월</option>
                        		<option value="04">4월</option>
                        		<option value="05">5월</option>
                        		<option value="06">6월</option>
                        		<option value="07">7월</option>
                        		<option value="08">8월</option>
                        		<option value="09">9월</option>
                        		<option value="10">10월</option>
                        		<option value="11">11월</option>
                        		<option value="12">12월</option>
                        	</select>
                        	<input type="submit" value="선택" style="width: 50px;">
                        </form>
                		
                        <div class="scroll_box">
                        <ul>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-1.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood1"></div>
                                <p id="moodbar1" class="semi_tit_font_size"> <%=dto.getMoodcount1() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-2.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood2"></div>
                                <p id="moodbar2" class="semi_tit_font_size"><%=dto.getMoodcount2() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-3.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood3"></div>
                                <p id="moodbar3" class="semi_tit_font_size"><%=dto.getMoodcount3() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-4.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood4"></div>
                                <p id="moodbar4" class="semi_tit_font_size"><%=dto.getMoodcount4() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-5.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood5"></div>
                                <p id="moodbar5" class="semi_tit_font_size"><%=dto.getMoodcount5() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-6.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood6"></div>
                                <p id="moodbar6" class="semi_tit_font_size"><%=dto.getMoodcount6() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-7.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood7"></div>
                                <p id="moodbar7" class="semi_tit_font_size"><%=dto.getMoodcount7() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-8.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood8"></div>
                                <p id="moodbar8" class="semi_tit_font_size"><%=dto.getMoodcount8() %> </p>
                            </li>
                            <li>
                                <div class="stats_img">
                                    <img src="../images/mood/mood-9.png" alt="#">
                                </div>
                                <div class="stats_bar" id="mood9"></div>
                                <p id="moodbar9" class="semi_tit_font_size"><%=dto.getMoodcount9() %> </p>
                            </li>
                        </ul>
                    </div>
                 
                    </div>
                </div>
            </div>
            <div class="menu2 clear">
                <div class="menu2_content">

                </div>
            </div>
        </div>
        <!-- body end -->

        <footer>
            <p>copyright</p>
        </footer>



    </div>

</body>

</html>
<%}%>