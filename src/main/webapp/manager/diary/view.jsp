<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="dto" class="com.koreait.mooda.manager.diary.DiaryDTO" />
<jsp:useBean id="dao" class="com.koreait.mooda.manager.diary.DiaryDAO" />
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
String d_idx = request.getParameter("d_idx");
dto = dao.view(d_idx);
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
String[] week = {"일","월","화","수","목","금","토"}; 
Calendar cal = Calendar.getInstance(); 
Date getDate; 
int day = Integer.parseInt(dto.getD_regdate().substring(8,10));
int w = 0;
try { 
	getDate = format.parse(dto.getD_regdate().substring(0,10)); 
	cal.setTime(getDate); 
	w = cal.get(Calendar.DAY_OF_WEEK)-1; 
	} catch (Exception e) { 
		e.printStackTrace(); 
	}
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지 - 게시물 상세보기</title>
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
					<p>게시물 상세보기</p>
				</div>
				<!-- 열람창 -->
				<div class="show_page turnoff" id="show_page">
        	<input type="hidden" id="d_idx">
            <div class="show_page_closer" id="show_page_closer" onclick="history.back()"></div>
            <div class="show_page_box">
                <div class="spb1">
                    <li class="spb1_Nday" id="diary_day"><%=day %></li>
                    <li class="spb1_day" id="diary_week"><%=week[w] %></li>
                </div>
                <div class="spb_img" id="diary_img">
                    <img src="../../images/mood/mood-<%=dto.getD_mood() %>.png">
                </div>
                <div class="spb_title" id="diary_title"><%=dto.getD_title() %></div>
                <div class="spb_content" id="diary_content">
                    <li><%=dto.getD_content() %></li>
                </div>
                <div class="spb_photo" id="diary_photo">
                <%

                	if(dto.getD_img()!=null && !dto.getD_img().equals("null")) {
                %>
                    <img src="../../upload/<%=dto.getD_img() %>">
                 <%
                	}
                 %>   	
                </div>
                <div class="spb_sticker" id="diary_sticker2">
                <%
                	if(dto.getD_sticker() != 100) {
                		int folderNum = dto.getD_sticker() / 100;
						int stickerNum = dto.getD_sticker() - folderNum * 100;
                %>
                <img src='../../images/sticker<%=folderNum %>/sticker-<%=folderNum %>-<%=stickerNum %>.png' alt="스티커">
               	<%
                	}
               	%>
                </div>
            </div>
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