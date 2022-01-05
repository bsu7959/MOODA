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
<jsp:useBean id="dto"
	class="com.koreait.mooda.manager.comment.CommentDTO" />
<jsp:useBean id="dao"
	class="com.koreait.mooda.manager.comment.CommentDAO" />

<jsp:useBean id="memberdto"
	class="com.koreait.mooda.manager.member.MemberDTO" />
<jsp:useBean id="memberdao"
	class="com.koreait.mooda.manager.member.MemberDAO" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="commentList" value="${dao.getCommentList()}" />

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 댓글관리</title>
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
					<p class="menu1_content_tab "
						onclick="location.href='../diary/moodaDiary.jsp'">게시물 관리</p>
					<p class="menu1_content_tab now_page"
						onclick="location.href='../commentAndReply/moodaComment.jsp'">댓글
						관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../notice/notice.jsp'">공지사항</p>
					<p class="menu1_content_tab"
						onclick="location.href='../manager_logout.jsp'">관리자 로그아웃</p>
				</div>
			</div>

			<div class="manager_content">
				<div class="content_title">
					<p>댓글(Comment) 관리</p>
				</div>
				<div class="content_mainPage manager_main_div">

					<div class="searchTap">
						<form action="./comment_search.jsp">
							<select name="searchKey" class="manager_main_select">
								<option value="c_idx">댓글 index</option>
								<option value="c_useridx">작성자 index</option>
								<option value="c_didx">게시물 index</option>
								<option value="c_text">댓글내용</option>
								<option value="c_regdate">댓글 등록일자</option>
							</select> <input type="text" class="input_search" name="searchValue">
						</form>
					</div>

					<table>
						<tr>
							<th>댓글 index</th>
							<th>작성자 index</th>
							<th>작성자 id</th>
							<th>작성자 이름</th>
							<th>게시물 index</th>
							<th>게시물 확인하기</th>
							<th>댓글내용</th>
							<th>댓글 등록일자</th>
							<th>관리</th>
						</tr>

						<c:forEach var="comment" items="${commentList}" varStatus="status">
							<c:set scope="page" var="c_useridx" value="${comment.c_useridx }"></c:set>
							<%
							String m_idx = String.valueOf(pageContext.getAttribute("c_useridx"));
							memberdto = memberdao.view(m_idx);
							%>
							<tr>
								<form method="post" name="commentForm">
									<td><input type="text" class="manager_form_input"
										value="${comment.c_idx}" readonly="readonly" name="c_idx"></td>
									<td><input type="text" class="manager_form_input"
										value="${comment.c_useridx}" name="c_useridx"
										readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="<%=memberdto.getM_userid()%>" readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="<%=memberdto.getM_name()%>" readonly="readonly"></td>
									<td><input type="text" class="manager_form_input"
										value="${comment.c_didx}" name="c_didx" readonly="readonly"></td>
									<td><input type="button" class="manager_form_rep"
										value="글보기"
										onclick="location.href='../diary/view.jsp?d_idx=${comment.c_didx}'"></td>
									<td><input type="text" class="manager_form_input"
										value="${comment.c_text}" name="c_text"></td>
									<td><input type="text" class="manager_form_input"
										value="${comment.c_regdate}" name="c_regdate"
										readonly="readonly"></td>
									<td><input type="submit" class="manager_form_submit"
										value="차단" formaction="./comment_update.jsp"><input
										type="submit" class="manager_form_submit" value="삭제"
										formaction="./comment_del.jsp"></td>
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

</html>
<%}%>