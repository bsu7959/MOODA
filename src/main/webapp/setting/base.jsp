<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>틀</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/friends.js"></script>
    <script src="../js/setting.js"></script>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="nav_bar clear set_nav">
                <a href='../Member/modify.jsp'><img src="../images/mypage-icon.png" alt="mypage"></a>
                <a href='./base.jsp'><img src="../images/setting-icon.png" alt="setting"></a>
                <a href='../Member/logout.jsp'><img src="../images/logout-icon.png" alt="logout"></a>
            </div>
        </div>
        <!-- header끝 -->
        <!-- body -->
        <form name="settingform" id="settingform" method ="post" action="setting_ok.jsp" onsubmit="return submit">
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='../mainmood/mood3.jsp'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='./base.jsp' class='tab_highlighted'>기본설정</a></p>
                    <p class="menu1_content_tab"><a href='./font.jsp'>글자스타일</a></p>
                    <p class="menu1_content_tab"><a href='./background.jsp'>배경</a></p>
                    <p class="menu1_content_tab"><a href='./stats.jsp'>통계</a></p>
                    
                </div>
            </div>

            <div class="content">
                <div class="content_title">

                </div>
                <div class="content_mainPage">
                    <div class="setting_container">
                        <div class="setting_public setting_box">
                            <h3 class="setting_title">공개 설정</h3>
                            <p><label><input type="radio" name="public_option" value="전체공개" >전체공개</label></p>
                            <p><label><input type="radio" name="public_option" value="친구공개" >친구공개</label></p>
                            <p><label><input type="radio" name="public_option" value="비공개" checked>비공개</label></p>
                        </div>
                        <script>
                        	
                        </script>
                        <div class="mooda_message setting_box">
                            <h3 class="setting_title">무다의 한마디</h3>
                            <label for="mooda_message_check">
                                <div class="switch" id="mooda_message_switch"><img src='../images/switch_bg.png'><div class="switch_circle"></div></div></label><input type="checkbox" value="mooda_message_check" name="mooda_message_check" id="mooda_message_check">
                        </div>
                        <div class="photo_filter setting_box">
                            <h3 class="setting_title">사진 필터</h3>
                            <label for="photo_filter_check">
                            <div class="switch" id="filter_switch"><img src='../images/switch_bg.png'><div class="switch_circle"></div></div></label><input type="checkbox" value="photo_filter_check" name="photo_filter_check" id="photo_filter_check">
                        </div>
                        <div class="custom_emotion setting_box">
                            <div class="custom_emotion_box">
                                <h3 class="setting_title">커스텀 감정 추가</h3>
                                <div class="custom_emotion_content">
                                <!-- 일단은 이미지 업로드 폴더게 있으면 열기  향상된 포문 처리 -->
                                  <%
                                  List<String> arr = new ArrayList<>();
                                  for(String file : arr) {
                                	  
                                  }
                                	  
                                  
                                  %>
                                </div>
                            </div>
                            <div class="custom_emotion_btn">
                                <div class="btn" id="custom_emotion_add">추가</div>
                                <div class="btn" id="custom_emotion_del">제거</div>
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
        </form>
        <!-- body end -->
        
        <footer>
            <p>copyright</p>
        </footer>

        <div class="popup_background turnoff" id="popup_background">
            <div class="custom_add_popUp turnoff" id="custom_add_popUp">
                <div class="closebtn">
                    <img src="../images/x-icon.png" alt="종료">
                </div>
                <form name="addForm" method="post" action="#" enctype="#">
                    <label for="file"><p class="file_name">파일명.png</p>
                        <p class="file_upload">파일추가</p></label>
                    <input type="file" name="file" id="file" style="display: none">
                    <p class="custom_text" id="custom_text">감정설명</p>
                    <input type="text" class="inputbox" id="inputbox" name="inputbox" placeholder="심심해">
                    <div class="emotionadd_btn">감정추가</div>
                </form>
            </div>
            <div class="custom_del_popUp turnoff" id="custom_del_popUp">
                <p class="popup_inner">정말로 제거하시겠습니까?</p>
                <span id="del_yes">예</span>
                <span id="del_no">아니오</span>
            </div>
        </div>

    </div>

</body>

</html>
