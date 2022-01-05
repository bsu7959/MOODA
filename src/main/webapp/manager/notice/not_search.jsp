<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.notice.NoticeDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.notice.NoticeDAO" />
<jsp:useBean id="search" class="com.koreait.mooda.manager.notice.NoticeSearch" />
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
%>
<jsp:setProperty property="*" name="search"/>
<c:set var="noticeList" value="${dao.getNoticeSearch(search)}" />


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
			<div class="nav_bar clear">
			</div>
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
					<p>공지사항</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<div class="searchTap">
						<form action="not_search.jsp">
							<input type="text" placeholder="제목 또는 내용으로 검색" name="search_value"
								class="input_search"> <input type="submit" value="검색"
								class="input_submit"> <input type="button" value="글작성"
								class="input_write" onclick="location.href='./not_write.jsp'" />
						</form>
					</div>

					<table>
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
										value="${notice.n_title}" name="n_title"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_writer}" name="n_writer"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_content}" name="n_content"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_hit}" name="n_hit"></td>
									<td><input type="text" class="manager_form_input"
										value="${notice.n_date}" name="n_date"></td>
									<td><input type="button" class="manger_view_btn"
										onclick="location.href='./not_view.jsp?n_idx=${notice.n_idx}'"
										value="글보기">
								</form>
							</tr>
						</c:forEach>

					</table>
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