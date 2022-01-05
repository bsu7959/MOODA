<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.member.MemberDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.member.MemberDAO" />
<jsp:useBean id="search"
	class="com.koreait.mooda.manager.member.MemberSearch" />
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
<jsp:setProperty property="*" name="search" />

<c:set var="memberList" value="${dao.getSearchList(search)}" />

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 회원정보</title>
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
					<p class="menu1_content_tab now_page"
						onclick="location.href='../member/moodaMem.jsp'">회원정보 관리</p>
					<p class="menu1_content_tab"
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
					<p>회원정보 관리</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<div class="searchTap">
						<form action="./mem_search.jsp">
							<select name="searchKey" class="manager_main_select">
								<option value="m_idx">회원번호</option>
								<option value="m_userid">아이디</option>
								<option value="m_userpw">비밀번호</option>
								<option value="m_name">이름</option>
								<option value="m_email">이메일</option>
								<option value="m_hp">휴대폰번호</option>
								<option value="m_nickname">별명</option>
								<option value="m_birth">생년월일</option>
								<option value="m_open">공개여부</option>
								<option value="m_regdate">가입일자</option>
							</select> <input type="text" class="input_search" name="searchValue">
							<input type="submit" class="input_submit" value="검색">
						</form>
					</div>
					<table>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>휴대폰번호</th>
							<th>닉네임</th>
							<th>생년월일</th>
							<th>관심사</th>
							<th>공개설정</th>
							<th>등록일자</th>
							<th>회원관리</th>
						</tr>
						<c:forEach var="member" items="${memberList}" varStatus="status">
							<tr>
								<form method="post">
									<td><input type="text" class="manager_form_input"
										value="${member.m_idx}" readonly="readonly" name="m_idx"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_userid}" name="m_userid"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_userpw}" name="m_userpw"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_name}" name="m_name"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_email}" name="m_email"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_hp}" name="m_hp"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_nickname}" name="m_nickname"></td>
									<td><input type="text" class="manager_form_input"
										value="${member.m_birth}" name="m_birth"></td>
									<c:choose>
										<c:when test="${member.m_open == 0}">
											<td><input type="text" class="manager_form_input"
												value="전체공개" readonly="readonly"></td>
										</c:when>
										<c:when test="${member.m_open == 1}">
											<td><input type="text" class="manager_form_input"
												value="친구만" readonly="readonly"></td>
										</c:when>
										<c:when test="${member.m_open == 2}">
											<td><input type="text" class="manager_form_input"
												value="비공개" readonly="readonly"></td>
										</c:when>
									</c:choose>
									<input type="hidden" value="${member.m_open}" name="m_open">
									<input type="hidden" value="${member.m_interest }"
										name="m_interest">
									<td><input type="text" class="manager_form_input"
										value="${member.m_regdate}" readonly="readonly"
										name="m_regdate"></td>
									<td><input type="button" class="manger_view_btn"
										onclick="location.href='./view.jsp?m_idx=${member.m_idx}'"
										value="상세보기">
									<td><input type="submit" class="manager_form_submit"
										value="수정" formaction="./mem_update.jsp" style=""><input
										type="submit" class="manager_form_submit" value="삭제"
										formaction="./mem_del.jsp"></td>
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