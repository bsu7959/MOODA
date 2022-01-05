<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="dao" class="com.koreait.mooda.member.MemberDAO"/>
<jsp:useBean id="member" class="com.koreait.mooda.member.MemberDTO"/>
<!DOCTYPE html>
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
	List<String> interestList = new ArrayList<>();
	interestList = dao.selectInterest();
	member = dao.getOne(m_idx);
	System.out.println(interestList.size());
	System.out.println(member.getM_open());
	String[] hobby = member.getM_interest().split("%");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/login_style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/modify.js"></script>
    <title>무다 정보수정</title>
<script>
        function openCloseToc() {
            	document.getElementById('toc_button').textContent = '-';
            	$('#popup_background').removeClass('turnoff');
            	$('#popup_background').addClass('turnon');
            	$('#reg_interest_pop').removeClass('turnoff');
            	$('#reg_interest_pop').addClass('turnon');
        }
        $(function() {
        	$('input:checkbox[name=like]').prev().removeClass('like_checked');
        	$('input:checkbox[name=like]:checked').prev().addClass('like_checked');
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
                <input type="search" class="search" placeholder="검색">
                <img src="../images/mypage-icon.png" alt="mypage">
                <img src="../images/setting-icon.png" alt="setting">
                <img src="../images/logout-icon.png" alt="logout">
            </div>
        </div>
        <!-- header끝 -->

        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <!-- <img src="./구상중 img/mooda.png"> -->
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab">MOOD</p>
                    <p class="menu1_content_tab">CALENDER</p>
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
                                <li class="frontBot">Mooddiary</li>

                            </ul>
                        </div>
                    </div>

                    <!-- 회원가입 수정 칸 -->
                    <div class="main_rightWrap">
                    <form name="regform" id="" method="post" action="modify_ok.jsp" onsubmit="return sendit()">
                    
                        <div class="regCont">
                            <div class="regInput">
                                <input type="text" class="email" name="m_email" id="email" placeholder=" 이메일을 입력하세요" value=<%=member.getM_email() %>>
                                <input type="text" class="hp" name="m_hp" id="hp" placeholder=" 전화번호를 입력하세요" value=<%=member.getM_hp() %>>
                                <input type="password" class="pwre" name="m_userpw_cu" id="userpw_cu" placeholder=" 현재 비밀번호를 입력하세요">
                                <input type="password" class="pwn1" name="m_userpw" id="newuserpw" placeholder=" 새 비밀번호를 입력하세요">
                                <input type="password" class="pn2" name="m_userpw" id="newuserpwre"placeholder=" 새 비밀번호 확인번호를 입력하세요">
                                <input type="text" class="nick" name="m_nickname" id="nickname" placeholder=" 닉네임을 입력하세요" value=<%=member.getM_nickname() %>>
                                <input type="text" class="birth" name="m_birth" id="birth" placeholder=" 생년월일을 입력하세요" value=<%=member.getM_birth() %>>
                                <input type="hidden" id="userpw_check" value=<%=member.getM_userpw() %>>
                            </div>
                            <div class="regLike">
                                <ul>
										<li class="regLikeTitle">관심사</li>
                                        <li class="regLikeselect">
                                        <%
                                        	for(int i=0; i<5; i++) {
                                        		boolean isChecked = false;
                                        		for(String str : hobby) {
                                        			if(interestList.get(i).equals(str)) {
                                        				isChecked = true;
                                        				break;
                                        			}
                                        		}
                                        		if(isChecked) {
                                        		
                                        %>                                    
                                            	<label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %> checked></span></label>

                                        <%
                                        		}else {
                                        %>
                                        		<label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %>></span></label>
                                        <%
                                        		}
                                        		
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
                                        		boolean isChecked = false;
                                        		for(String str : hobby) {
                                        			if(interestList.get(i).equals(str)) {
                                        				isChecked = true;
                                        				break;
                                        			}
                                        		}
                                        		if(isChecked) {
                                        %>
                                           		<label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %> checked></span></label>
										<%
                                        		}else {
                                        %>
                                                <label><span id="likeradius"><div class="like_btn"><%=interestList.get(i) %></div><input type="checkbox" name="like" class="like" value=<%=interestList.get(i) %>></span></label>
										<%
                                        		}
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
                                        <input type="radio" name="m_open" value="2">비공개
                                        <input type="hidden" id="m_open_checked" value=<%=member.getM_open() %>>
                                    </li>
                                                                        <script>
                                    	const open = $('#m_open_checked').val();
                                    	console.log(open);
                                    	$("input:radio[name='m_open']:radio[value="+open+"]").prop('checked',true);
                                    </script>
                                </ul>
                            </div>
                            
							<div class="regBtn">
                                <input type="submit" value="회원정보수정">
                            </div>
                        </div>
                    
                    </form>
                    </div>
                    <!-- 회원가입 칸  끝-->
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