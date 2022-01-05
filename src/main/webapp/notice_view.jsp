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
String n_idx = request.getParameter("n_idx");
int i = dao.hit(n_idx);
dto = dao.getNoticeView(n_idx);
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

			<div class="manager_content">
				<div class="content_title">
					<p>공지사항</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<div class="searchTap">
						<form action="not_search.jsp">
							
						</form>
					</div>
					<form method="post">
						<p>
							<label class="view_label">번호 : </label><input class="view_input2"
								name="n_idx" value="<%=dto.getN_idx()%>" readonly="readonly" style="background: rgb(237,237,227);">
						</p>
						<p>
							<label class="view_label">작성자 : </label><input
								class="view_input2" name="n_writer"
								value="<%=dto.getN_writer()%>" readonly="readonly" style="background: rgb(237,237,227);">
						</p>
						<p>
							<label class="view_label">제목 : </label><input type="text"
								id="title" class="view_input2" maxlength="30" name="n_title"
								value="<%=dto.getN_title()%>" readonly="readonly" style="background: rgb(237,237,227);">
						</p>
						<p>
							<label class="view_label">내용 : </label>
						</p>
						<p>
							<textarea name="n_content" cols="150" rows="10"
								readonly="readonly" style="padding: 10px; background: rgb(237,237,227);"><%=dto.getN_content()%></textarea>
						</p>
						<p>
							
							<input type="button" value="리스트" class="view_btn"
								onclick="location.href='./notice.jsp'">
						</p>

					</form>
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