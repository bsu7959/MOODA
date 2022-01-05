<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.diary.DiaryDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.diary.DiaryDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="diaryList" value="${dao.getDiaryList()}" />

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 게시물 관리</title>
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
					<p class="menu1_content_tab now_page"
						onclick="location.href='../diary/moodaDiary.jsp'">게시물 관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../commentAndReply/moodaComment.jsp'">댓글 관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../notice/notice.jsp'">공지사항</p>
					<p class="menu1_content_tab"
						onclick="location.href='../manager_logout.jsp'">관리자 로그아웃</p>
				</div>
			</div>

			<div class="manager_content">
				<div class="content_title">
					<p>게시물 관리</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<div class="searchTap">
						<form action="./diary_search.jsp">
							<select name="searchKey" class="manager_main_select">
								<option value="d_useridx">회원번호</option>
								<option value="d_mood">감정번호</option>
								<option value="d_regdate">게시물등록일자</option>
								<option value="d_idx">게시물 index</option>
								<option value="d_content">게시물 내용</option>
								<option value="d_open">전체공개(0), 친구만공개(1)</option>
								<option value="d_sticker">스티커 번호</option>
								<option value="d_img">등록이미지</option>
								<option value="d_latitude">위도</option>
								<option value="d_longitude">경도</option>
							</select> <input type="text" class="input_search" name="searchValue">
							<input type="submit" class="input_submit" value="검색"> <input
								type="button" class="input_report_view_btn" value="신고글 보기"
								onclick="location.href='./diary_report.jsp'">
						</form>
					</div>

					<table>
						<tr>
							<th>다이어리 index</th>
							<th>회원번호</th>
							<th>선택감정</th>
							<th>감정제목</th>
							<th>등록일자</th>
							<th>공개설정</th>
							<th>스티커번호</th>
							<th>등록 이미지</th>
							<th>위치정보(위도)</th>
							<th>위치정보(경도)</th>
							<th>신고회수</th>
							<th>상세보기</th>
							<th>관리</th>
						</tr>

						<c:forEach var="diary" items="${diaryList}" varStatus="status">
							<tr>
								<form method="post" name="diaryForm">
									<td><input type="text" class="manager_form_input"
										value="${diary.d_idx}" readonly="readonly" name="d_idx"></td>
									<td><input type="text" class="manager_form_input"
										value="${diary.d_useridx}" name="d_useridx"
										readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="${diary.d_mood}" name="d_mood" readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="${diary.d_title}" name="d_title" readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="${diary.d_regdate}" readonly="readonly"
										name="d_regdate" readonly="readonly"></td> <input
										type="hidden" value="${diary.d_content}" name="d_content">
									<c:choose>
										<c:when test="${diary.d_open == 0}">
											<td><input type="text" class="manager_form_input"
												value="전체공개" readonly="readonly"></td>
										</c:when>
										<c:when test="${diary.d_open == 1}">
											<td><input type="text" class="manager_form_input"
												value="친구만" readonly="readonly"></td>
										</c:when>
										<c:when test="${diary.d_open == 2}">
											<td><input type="text" class="manager_form_input"
												value="비공개" readonly="readonly"></td>
										</c:when>
									</c:choose>
									<input type="hidden" value="${diary.d_open}" name="d_open">
								<td><input type="text" class="manager_form_input"
									value="${diary.d_sticker}" name="d_sticker"></td>
								<td><input type="text" class="manager_form_input"
									value="${diary.d_img}" name="d_img"></td>
								<td><input type="text" class="manager_form_input"
									value="${diary.d_latitude}" name="d_latitude"></td>
								<td><input type="text" class="manager_form_input"
									value="${diary.d_longitude}" name="d_longitude"></td>
								<td><input type="text" class="manager_form_input"
									value="${diary.d_report}" readonly="readonly" name="d_report"></td>
								<td><input type="button" class="manger_view_btn"
									onclick="location.href='./view.jsp?d_idx=${diary.d_idx}'"
									value="상세보기">
								<td><input type="submit" class="manager_form_submit"
									value="차단" formaction="./diary_update.jsp"><input
									type="submit" class="manager_form_submit" value="삭제"
									formaction="./diary_del.jsp"></td>
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