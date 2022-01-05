<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.notice.NoticeDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.notice.NoticeDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
if(session.getAttribute("m_idx") == null || session.getAttribute("m_idx").equals("")) {
	System.out.println("2");
	%>
		<script>
			alert('잘못된 접근');
			location.href="./index.jsp";
		</script>
	<%
}else {
%>
<c:set var="noticeList" value="${dao.getNoticeList()}" />
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>틀</title>
    <link rel="stylesheet" href="./css/style.css" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="./js/friends.js"></script>
    <script src="./js/setting.js"></script>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="nav_bar clear">
                <form method="get" action="./friends/search.jsp" name="search" id="search_frm">
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
                <a href='./Member/modify.jsp'><img src="./images/mypage-icon.png" alt="mypage"></a>
                <a href='./setting/font.jsp'><img src="./images/setting-icon.png" alt="setting"></a>
                <a href='./Member/logout.jsp'><img src="./images/logout-icon.png" alt="logout"></a>
            </div>
        </div>
        <!-- header끝 -->
        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='./mainmood/mood3.jsp'><img src="./images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='./mainmood/mood3.jsp' class=" title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='./maincal/cal1.jsp' class="title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab"><a href='./friends/friends.jsp' class="title_font_size">FRIENDS</a></p>
                    <p class="menu1_content_tab"><a href='./notice.jsp' class=' tab_highlighted title_font_size'>NOTICE</a></p>
                </div>
            </div>

            <div class="content">
                <div class="content_title">

                </div>
                <div class="content_mainPage">
                    <table class="notice_tb">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>내용</th>
							<th>조회수</th>
							<th>날짜</th>
							<th>상세보기</th>
						</tr>

						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr>
								<form method="post">
									<td><input type="text" class="manager_form_input"
										value="${notice.n_idx}" readonly="readonly" name="n_idx"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_title}"  readonly="readonly" name="n_title"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_writer}"  readonly="readonly" name="n_writer"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_content}"  readonly="readonly" name="n_content"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_hit}"  readonly="readonly" name="n_hit"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_date}"  readonly="readonly" name="n_date"></td>
									<td><input type="button" class="manger_view_btn"
										onclick="location.href='./notice_view.jsp?n_idx=${notice.n_idx}'"
										value="글보기">
								</form>
							</tr>
						</c:forEach>

					</table>
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