<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.koreait.mooda.etc.EtcDAO"/>
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
	String fontSize = String.valueOf(session.getAttribute("fontSize")); 
	String fontStyle = String.valueOf(session.getAttribute("fontStyle"));
	String backgroundColor = String.valueOf(session.getAttribute("background"));
	List<String> backgroundList = new ArrayList<>();
	backgroundList = dao.getBackground();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOODA | SETTING</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                    <p class="menu1_content_tab"><a href='./font.jsp' class="title_font_size">글자스타일</a></p>
                    <p class="menu1_content_tab"><a href='./background.jsp' class='tab_highlighted title_font_size'>배경</a></p>
                    <p class="menu1_content_tab"><a href='./stats.jsp' class="title_font_size">통계</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">

                </div>
                <div class="content_mainPage">
                <form name="setting" id="setting" method="get" action="#">
                    <div class="background_style">
                        <h3 class="setting_title title_font_size">배경</h3>
                        <div class="background_box">
                        <script>
                        	function sendBackground(e) {
                        		const background = $(e).children().val();
                        		console.log($(e).children().val());
    							const xhr = new XMLHttpRequest();
    							xhr.open("GET", "background_ok.jsp?background="+background, true);
    							xhr.send();
    							xhr.onreadystatechange = function() {
    								if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
    									const result = xhr.responseText;
    									console.log(result);
    									backgroundSet(result);
    									sessionStorage.setItem("backgroundColor", result);
    								}
    							}
                        	}
                        	
                    
                        </script>
                        <input type="hidden" id="font_size_result" value=<%=fontSize %>>
                        <input type="hidden" id="font_style_result" value=<%=fontStyle %>>
                        <input type="hidden" value=<%=backgroundColor %> id="currentBg">
<%

	for(String background : backgroundList){
		
%>
                            <div class="background_box_style bg" id="bgtest" style="background-color: <%=background%>;" onclick="sendBackground(this)">
                            	<input type="hidden" class="hidden" value=<%=background %>>
                                <span class="bg" style="background-color: <%=background%>;"><ins class="bg title_font_size" style="background-color: <%=background%>;">25</ins> THU</span>
                                <div class="bg_img bg" style="background-color: <%=background%>;">
                                    <img src="../images/mood/mood-3.png" alt="이미지" class="bg" style="background-color: <%=background%>;">
                                </div>
                                <p class="bg" style="background-color: <%=background%>;">기분 최고!</p>
                            </div>
<%
	}
%>                     
                        </div>
                    </div>
                 </form>

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