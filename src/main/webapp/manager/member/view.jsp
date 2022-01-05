<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.member.MemberDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.member.MemberDAO" />
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
String m_idx = request.getParameter("m_idx");
dto = dao.view(m_idx);
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 회원정보 상세보기</title>
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
					<p>회원정보 상세보기</p>
				</div>

				<form class="manager_view_form" method="post">
					<p>
						<label class="view_label">회원번호 : </label><input type="text"
							name="m_idx" class="view_input" value="<%=dto.getM_idx()%>"
							readonly="readonly">
					</p>
					<p>
						<label class="view_label">아이디 : </label><input type="text"
							name="m_userid" class="view_input"
							value="<%=dto.getM_userid()%>">
					</p>
					<p>
						<label class="view_label">비밀번호 : </label><input type="text"
							name="m_userpw" class="view_input"
							value="<%=dto.getM_userpw()%>">
					</p>
					<p>
						<label class="view_label">이름 : </label><input type="text"
							name="m_name" class="view_input" value="<%=dto.getM_name()%>">
					</p>
					<p>
						<label class="view_label">이메일 : </label><input type="text"
							name="m_email" class="view_input" value="<%=dto.getM_email()%>">
					</p>
					<p>
						<label class="view_label">전화번호 : </label><input type="text"
							name="m_hp" class="view_input" value="<%=dto.getM_hp()%>">
					</p>
					<p>
						<label class="view_label">닉네임 : </label><input type="text"
							name="m_nickname" class="view_input"
							value="<%=dto.getM_nickname()%>">
					</p>
					<p>
						<label class="view_label">생년월일 : </label><input type="text"
							name="m_birth" class="view_input" value="<%=dto.getM_birth()%>">
					</p>
					<p>
						<label class="view_label">관심사 : </label><input type="text"
							name="m_interest" class="view_input"
							value="<%=dto.getM_interest()%>" readonly="readonly">
					</p>
					<c:choose>
						<c:when test="<%=dto.getM_open() == 0%>">
							<p>
								<label class="view_label">공개설정 : </label><input type="text"
									class="view_input" value="전체공개" readonly="readonly">
							</p>
						</c:when>
						<c:when test="<%=dto.getM_open() == 1%>">
							<p>
								<label class="view_label">공개설정 : </label><input type="text"
									class="view_input" value="친구만" readonly="readonly">
							</p>
						</c:when>
						<c:when test="<%=dto.getM_open() == 2%>">
							<p>
								<label class="view_label">공개설정 : </label><input type="text"
									class="view_input" value="비공개" readonly="readonly">
							</p>
						</c:when>
					</c:choose>
					<input type="hidden" value="${member.m_open}" name="m_open">
					<p>
						<label class="view_label">가입일자 : </label><input type="text"
							name="m_regdate" class="view_input"
							value="<%=dto.getM_regdate()%>" readonly="readonly">
					</p>
					<p>
						<label class="view_label">신고당한회수 : </label><input type="text"
							name="m_report" class="view_input"
							value="<%=dto.getM_report()%>" readonly="readonly">
					</p>
					<p>
						<label class="view_label">글씨크기설정 : </label><input type="text"
							name="m_fontsize" class="view_input"
							value="<%=dto.getM_fontsize()%>" readonly="readonly">
					</p>
					<p>
						<label class="view_label">글자폰트설정 : </label><input type="text"
							name="m_fontstyle" class="view_input"
							value="<%=dto.getM_fontstyle()%>" readonly="readonly">
					</p>
					<p>
						<label class="view_label">배경설정 : </label><input type="text"
							name="m_background" class="view_input"
							value="<%=dto.getM_background()%>" readonly="readonly">
					</p>
					<p>
						<label class="view_label">수정하기 : </label><input type="submit"
							class="view_btn" value="수정" formaction="./mem_update.jsp">
					</p>
					<p>
						<label class="view_label">삭제하기 : </label><input type="submit"
							class="view_btn" value="삭제" formaction="./mem_del.jsp">
					</p>
				</form>
			</div>
		</div>
		<!-- body end -->

		<footer>
			<p>copyright</p>
		</footer>

	</div>

</body>

</html><%}%>