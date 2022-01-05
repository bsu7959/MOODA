<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
<!DOCTYPE html>
<html lang="en">
<%
	List<String> interestList = new ArrayList<>();
	interestList = dao.selectInterest();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/login_style.css" rel="stylesheet" type="text/css">
    <title>무다 회원가입</title>
    <style>
        #toc-content{
            display: none;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/regist.js"></script>
    <script>
        function openCloseToc() {
            	document.getElementById('toc_button').textContent = '-';
            	$('#popup_background').removeClass('turnoff');
            	$('#popup_background').addClass('turnon');
            	$('#reg_interest_pop').removeClass('turnoff');
            	$('#reg_interest_pop').addClass('turnon');
        }
        $(function() {
        	$('#reg_interest_pop .closebtn').on('click', function() {
        		$('#popup_background').removeClass('turnon');
            	$('#popup_background').addClass('turnoff');
            	$('#reg_interest_pop').removeClass('turnon');
            	$('#reg_interest_pop').addClass('turnoff');
            	document.getElementById('toc_button').innerHTML = '+';
        	});
        	$('input:checkbox[name=like]').on('click', function() {
            	$('input:checkbox[name=like]').prev().removeClass('like_checked');
            	$('input:checkbox[name=like]:checked').prev().addClass('like_checked');
        	});
        		
        });
    </script>

</head>

<body>
    <div class="container">
        <div class="header">
            <div class="nav_bar clear">
                <input type="text" placeholder="검색">
                <img src="#">마이페이지 <img src="#">환경설정 <img src="#"> 로그아웃
            </div>
        </div>
        <!-- header끝 -->

        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab">MOOD</p>
                    <p class="menu1_content_tab">CALENDAR</p>
                    <p class="menu1_content_tab">FRIENDS</p>
                </div>
            </div>

            <div class="content">
                <div class="content_mainPage">
                    <div class="main_leftWrap">
                        <div class="main_left">
                            <ul>
                                <li class="frontLogo">
                                    <img src="../images/mooda_img.png">
                                </li>
                                <li class="frontTop">MOODA</li>
                                <li class="frontMiddle">내안의 나와 마주하는 시간</li>
                                <li class="frontBot">Mood Diary</li>

                            </ul>
                        </div>
                    </div>
                    <!-- 회원가입 수정칸 시작 -->
                    <div class="main_rightWrap">
                        <form name="regform" method="post" action="regist_ok.jsp" onsubmit="return sendit()">                       
                            <div class="regCont">
                                <div class="regInput"> 
                                	<input type="text" name="m_userid" id="userid" placeholder="아이디를 입력하세요">
                                	<input type="password" name="m_userpw" id="userpw" placeholder="비밀번호를 입력하세요">
                                    <input type="password" name="m_userpw_re" id="signpw_re" placeholder="비밀번호 확인을 입력하세요">
                                    <input type="text" name="m_name" id="name" placeholder="이름을 입력하세요">
                                    <input type="text" name="m_email" id="email" placeholder="이메일을 입력하세요">
                                    <input type="text" name="m_hp" id="hp" placeholder="전화번호를 입력하세요">
                                    <input type="text" name="m_nickname" id="nickname" placeholder="닉네임을 입력하세요">
                                    <input type="text" name="m_birth" id="birth" placeholder="생년월일을 입력하세요">
                                </div>
                                <div class="regLike">
                                    <ul>
                                        <li class="regLikeTitle">관심사</li>
                                        <li class="regLikeselect">
                                       <%
                                        	for(int i=0; i<5; i++) {
                                        		
                                        %>                                    
                                            	<label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %>></span></label>

                                        <%
                                        		}
                                        %>
                                        	<span id="toc_button" onclick="openCloseToc()">+</span>
	                                        <div class="popup_background turnoff" id="popup_background">
									            <div class="reg_interest_pop turnoff" id="reg_interest_pop">
									                <div class="closebtn">
									                    <img src="../images/x-icon.png" alt="종료">
									                </div>
									                <div class="interest_content">
                                        <%
                                        	for(int i=5; i<interestList.size(); i++) {
                                        %>
                                           		<label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %>></span></label>
										 <%
                                        	}
										 %>
                                          			</div>
                                            	</div>
									        </div>

                                        </li>
                                    </ul>
                                </div>
                                <div class="regConfig" style="display: none">
                                    <ul>
                                        <li class="con_tit">공개설정</li>
                                        <li class="con_cont">
                                            <input type="radio" name="m_open" value="0">전체 공개
                                            <input type="radio" name="m_open" value="1">친구 공개
                                            <input type="radio" name="m_open" value="2" checked>비공개
                                        </li>
                                    </ul>
                                </div>
                                <div class="yakgwan">
                                    <p>회원 가입 시 정보처리 방침 이용약관을 동의한 것으로 간주합니다.</p>
                                </div>
                                <div class="regBtn">
                                    <input type="submit" value="회원가입">
                                </div>
                            </div>                       
                        </form>
                    </div>
                    <!-- 회원가입 수정칸 끝 -->
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