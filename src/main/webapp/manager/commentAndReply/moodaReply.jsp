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
<jsp:useBean id="dto" class="com.koreait.mooda.manager.reply.ReplyDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.reply.ReplyDAO" />


<jsp:useBean id="memberdto"
	class="com.koreait.mooda.manager.member.MemberDTO" />
<jsp:useBean id="memberdao"
	class="com.koreait.mooda.manager.member.MemberDAO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:setProperty name="dto" property="r_cidx" param="c_idx" />
<c:set var="replyList" value="${dao.getReplyList(dto)}" />


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 답글 관리</title>
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
						onclick="location.href='../commentAndReply/moodaComment.jsp'">댓글/답글
						관리</p>
					<p class="menu1_content_tab"
						onclick="location.href='../notice/notice.jsp'">공지사항</p>
					<p class="menu1_content_tab"
						onclick="location.href='../manager_logout.jsp'">관리자 로그아웃</p>
				</div>
			</div>

			<div class="manager_content">
				<div class="content_title">
					<p>답글(Reply) 관리</p>
				</div>
				<div class="content_mainPage manager_main_div">
					<input type="button" class="input_report_view_btn" value="신고글 보기"
						onclick="location.href='./reply_report.jsp'"
						style="width: 100px; height: 30px; margin: 10px 10px 10px 10px;">

					<table>
						<tr>
							<th>답글 index</th>
							<th>작성자 index</th>
							<th>작성자 id</th>
							<th>작성자 이름</th>
							<th>댓글 index</th>
							<th>댓글내용</th>
							<th>답글내용</th>
							<th>답글 등록일자</th>
							<th>신고정보</th>
							<th>관리</th>
						</tr>


						<c:forEach var="reply" items="${replyList}" varStatus="status">
							<c:set scope="page" var="r_useridx" value="${reply.r_useridx }"></c:set>
							<%
							String m_idx = String.valueOf(pageContext.getAttribute("r_useridx"));
							memberdto = memberdao.view(m_idx);
							%>
							<tr>
								<form method="post" name="replyForm">
									<form method="post" name="replyForm">
										<td><input type="text" class="manager_form_input"
											value="${reply.r_idx}" readonly="readonly" name="r_idx"></td>
										<td><input type="text" class="manager_form_input"
											value="${reply.r_useridx}" name="r_useridx"
											readonly="readonly"></td>
										<td><input type="text" class="manager_form_input"
											value="<%=memberdto.getM_userid()%>" readonly="readonly"></td>
										<td><input type="text" class="manager_form_input"
											value="<%=memberdto.getM_name()%>" readonly="readonly"></td>
										<td><input type="text" class="manager_form_input"
											value="${reply.r_cidx}" name="r_cidx" readonly="readonly"></td>
										<td><input type="text" class="manager_form_input"
											value="<%=request.getParameter("c_text")%>" name="r_cidx"
											readonly="readonly"></td>
										<td><input type="text" class="manager_form_input"
											value="${reply.r_text}" readonly="readonly" name="r_text"></td>
										<td><input type="text" class="manager_form_input"
											value="${reply.r_regdate}" name="r_regdate"></td>
										<td><input type="text" class="manager_form_input"
											value="${reply.r_report}" name="r_report"></td>
										<td><input type="submit" class="manager_form_submit"
											value="차단" formaction="./reply_update.jsp"><input
											type="submit" class="manager_form_submit" value="삭제"
											formaction="./reply_del.jsp"></td>
									</form>
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