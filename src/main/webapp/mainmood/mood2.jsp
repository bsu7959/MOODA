<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mood2</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../js/friends.js"></script>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="nav_bar clear">
                <input type="search" class="search" placeholder="검색">
                <a href='../member/modify.html'><img src="../images/mypage-icon.png" alt="mypage"></a>
                <a href='../setting/base.html'><img src="../images/setting-icon.png" alt="setting"></a>
                <a href='../member/login.html'><img src="../images/logout-icon.png" alt="logout"></a>
            </div>
        </div>
        <!-- header끝 -->

        <!-- body -->
        <div class="main_box">
            <div class="menu1">
                <div class="menu1_logo">
                    <a href='./mood1.html'><img src="../images/mooda_img.png"></a>
                </div>
                <div class="menu1_content">
                    <p class="menu1_content_tab"><a href='./mood1.html' class="tab_highlighted title_font_size">MOOD</a></p>
                    <p class="menu1_content_tab"><a href='../maincal/cal.html' class="title_font_size">CALENDAR</a></p>
                    <p class="menu1_content_tab"><a href='../friends/friends.html' class="title_font_size">FRIENDS</a></p>
                </div>
            </div>


            <div class="content">
                <div class="content_title">
                    <p class="title_year title_font_size">2021</p>
                    <p class="title_month">March</p>
                    <div class="content_title_highlighting"></div>
                </div>
                <div class="content_mainPage">
                    <div class="diary_mood_main">
                        <div class="diary_mood_container" id="diary_mood_container">
                            <img src="../images/mood/mood-1.png">
                        </div>
                        <div class="diary_mood_container">
                            <img src="../images/mood/mood-2.png">
                        </div>
                        <div class="diary_mood_container">
                            <img src="../images/mood/mood-3.png">
                        </div>
                        <div class="diary_mood_container">
                            <img src="../images/mood/mood-4.png">
                        </div>
                        <div class="diary_mood_container">
                            <img src="../images/mood/mood-5.png">
                        </div>
                    </div>
                    <div class="diary_mood_button">
                        <div class="add_mood">
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-1.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-2.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-3.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-4.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-5.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-6.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-7.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-8.png">
                            </div>
                            <div class="add_mood_container">
                                <img src="../images/mood/mood-9.png">
                            </div>
                        </div>
                        <div class="mood_btn">
                            <img src="../images/xbtn.png">
                        </div>
                    </div>
                </div>
            </div>

            <div class="menu2 clear">
                <div class="menu2_content">

                </div>

            </div>
        </div>
        <!-- body end -->
        <!-- 팝업 -->
        <!-- 작성창 -->
        <div class="write_page turnoff">
            <div class="write_page_closer"></div>
            <div class="write_page_box">
                <div class="write_date_and_day">
                    <span class="write_date">4</span>&nbsp;
                    <span class="write_day">WED</span>
                </div>
                <div class="main_mood_img">
                    <img src="../images/mood/mood-8.png" class="mood_img">
                </div>
                <div class="write_content_all">
                    <p class="write_title">기분 좋아</p>
                    <div class="marker clear">
                        <div class="marker_start">
                            <img src="../images/marker/marker_start_0001_핑크.png" class="marker_start_img">
                        </div>
                        <div class="marker_middle">
                            <img src="../images/marker/marker_middle_0001_핑크.png" class="marker_middle_img">
                        </div>
                        <div class="marker_end">
                            <img src="../images/marker/marker_end_0001_핑크.png" class="marker_end_img">
                        </div>
                    </div>
                    <p class="write_content">내용</p>
                </div>
            </div>
            <div class="write_page_img"></div>
            <div class="write_page_font"></div>
            <div class="write_page_sticker"></div>
            <div class="write_page_done"></div>
        </div>
        <!-- 열람창 -->
        <div class="show_page turnoff" id="show_page">
            <div class="show_page_closer" id="show_page_closer"></div>
            <div class="show_page_box">
                <div class="spb1">
                    <li class="spb1_Nday">1</li>
                    <li class="spb1_day">mon</li>
                </div>
                <div class="spb_img">
                    <img src="../images/mood/mood-8.png">
                </div>
                <div class="spb_title">완전 좋아!</div>
                <div class="spb_content">
                    <li>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error laudantium sint, similique
                        temporibus aperiam quas sunt eos, dolore soluta rem nemo culpa vel est velit! Facilis labore id
                        quaerat numquam.</li>
                </div>
                <div class="spb_photo">
                    사진 공간
                </div>
                <div class="spb_loc"><img src="../images/map-icon.png" id="map_ic">건대봉자 마라탕</div>
            </div>
            <div class="show_page_edit"></div>
            <div class="show_page_delete"></div>
            <div class="show_page_share"></div>
            <div class="show_page_reply" id="show_page_reply"></div>
        </div>
        <!-- 댓글창 -->
        <div class="reply_page turnoff" id="reply_page">
            <div class="reply_page_closer" id="reply_page_closer"></div>
            <div class="reply_page_box">
                <div class="reply_content reply_idx1"></div>
                <div class="reply_content reply_idx2"></div>
                <div class="reply_content reply_idx3"></div>
                <div class="reply_content reply_idx4"></div>
                <div class="reply_content reply_idx5"></div>
            </div>
            <div class="reply_page_write">
                <form>
                    <textarea name="reply_write"></textarea>
                    <input type="submit" name="reply_submit" value="작성">
                </form>
            </div>
        </div>
        <!-- 스티커 -->
        <div class="sticker_page turnoff">
            <div class="sticker_page_nav">

            </div>
            <div class="sticker_page_closer"></div>
            <div class="sticker_page_box"></div>

        </div>
        <footer>
            <p>copyright</p>
        </footer>

    </div>

</body>

</html>