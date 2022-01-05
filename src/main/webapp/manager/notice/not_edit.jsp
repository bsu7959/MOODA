<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.notice.NoticeDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.notice.NoticeDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
if(!String.valueOf(session.getAttribute("m_userid")).equals("admin1")) {
	System.out.println("2");
	%>
		<script>
			alert('잘못된 접근');
			location.href="../../index.jsp";
		</script>
	<%
}else {

String n_idx = request.getParameter("n_idx");
dto = dao.getNoticeView(n_idx);
System.out.println(dto.getN_content());
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 공지사항</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">
		<div class="header">
			<div class="nav_bar clear"></div>
		</div>
		<!-- header끝 -->

		<!-- body -->
		<div class="main_box">
			<div class="manager_menu1">
				<div class="menu1_logo">
					<img src="../../images/mooda_img.png">
				</div>
				<div class="menu1_content">
					<h3 class="admin_menu">관리자 페이지</h3>
					<p class="menu1_content_tab "
						onclick="location.href='../member/moodaMem.jsp'">회원정보 관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../diary/moodaDiary.jsp'">게시물 관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../commentAndReply/moodaComment.jsp'">댓글 관리</p>
					<p class="menu1_content_tab now_page"
						onclick="location.href='../notice/notice.jsp'">공지사항</p>
					<p class="menu1_content_tab"
						onclick="location.href='../manager_logout.jsp'">관리자 로그아웃</p>
				</div>
			</div>

			<div class="manager_content">
				<div class="content_title">
					<p>공지사항 - 수정</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<div class="searchTap">
						
					</div>

					<form method="post" action="./not_edit_ok.jsp">
						<input type="hidden" name="n_idx" value="<%= dto.getN_idx() %>">
						<p><label class="view_label">작성자 : </label><input class="view_input2" name="n_writer" value="<%=dto.getN_writer()%>"></p>
						<p><label class="view_label">제목 : </label><input type="text" id="title" class="view_input2" maxlength="30" name="n_title" value="<%=dto.getN_title()%>"></p>
						<p><label class="view_label">작성일자 : </label><input class="view_input2" name="n_date" value="<%=dto.getN_date()%>"></p>
						<p><label class="view_label">내용 : </label></p>
						<p>
							<textarea name="n_content" cols="150" rows="10" style="padding: 10px;"><%=dto.getN_content() %></textarea>
						</p>
						<p>
							<input type="submit" value="등록" class="view_btn" >
							<input type="button" value="리스트" class="view_btn" onclick="location.href='./notice.jsp'">	
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

</html><%}%>