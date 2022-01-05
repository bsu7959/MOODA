let today = new Date();
let miniToday = new Date();
let temp = new Date();
let date = new Date();



// 월간달력
// 이전달
function prevCalendar() {
    for(let i=1; i<=42; i++) {
        document.getElementById("date" + i).innerHTML = null;
    }
    
    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
    printCalendar();
   
}

// 다음달
function nextCalendar() {
    for(let i=1; i<=42; i++) {
        document.getElementById("date" + i).innerHTML = null;
    }
    today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
    printCalendar();
    
}

// 월간 메인달력 생성기
function printCalendar() {
    // 달력 상단 연월 표시
    let CalendarTitleY = document.getElementsByClassName("title_year"); 
    let CalendarTitleM = document.getElementsByClassName("title_month");
    
   	document.getElementById("month_to_year").value = today.getFullYear();
    
    CalendarTitleY[0].innerHTML = today.getFullYear();
    CalendarTitleM[0].innerHTML = monthPrint(today.getMonth() + 1);
    
    // 이번달의 첫날
    let firstDate = new Date(today.getFullYear(),today.getMonth(),1); 
    // 이번달의 마지막날
    let lastDate = new Date(today.getFullYear(),today.getMonth()+1,0); 
    // 이번달 첫날의 요일
    let firstDay = firstDate.getDay();

    // 이번달 첫날과 마지막날 숫자로 추출
    let fisrtDateNum = firstDate.getDate();
    let lastDateNum = lastDate.getDate();
    if(firstDay != 0){  // 월 ~ 토
        for(i=firstDay; i<lastDateNum + firstDay; i++) {
            const nowDate = document.getElementById("date" + i);
            nowDate.innerHTML = i - firstDay + 1;
        }
    } else {    // 일요일, 요일이 0~6까지 놀아서 분리
        for(i=7; i<=lastDateNum + 7; i++) {
            const nowDate = document.getElementById("date" + i);
            nowDate.innerHTML = i-6;
        }
    }
    IsWrite();
}

// 미니달력
// 이전 미니달력
function prevMiniDiary() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()-1, 1);
    printMiniDiary();
   
}
// 다음 미니달력

function nextMiniDiary() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()+1, 1);
    printMiniDiary();
   
}
// 미니달력 생성기
// 다이어리
function printMiniDiary() {
    // 연월표시
    let miniCalendarTitle = document.getElementsByClassName("mini_title");
    miniCalendarTitle[0].innerHTML = miniToday.getFullYear() + "." + (miniToday.getMonth()+1);
    
    document.getElementById("mini_d_main1").value = miniToday.getFullYear();
    document.getElementById("mini_d_main2").value = miniToday.getMonth();

    // 이번달의 첫날
    let firstDate = new Date(miniToday.getFullYear(),miniToday.getMonth(),1); 
    // 이번달의 마지막날
    let lastDate = new Date(miniToday.getFullYear(),miniToday.getMonth()+1,0); 
    // 이번달 첫날의 요일
    let firstDay = firstDate.getDay();
    document.getElementById("mini_d_main3").value = firstDate.getDay();
    // 이번달 첫날과 마지막날 숫자로 추출
    let fisrtDateNum = firstDate.getDate();
    let lastDateNum = lastDate.getDate();
    if(firstDay != 0){  // 월 ~ 토
        for(i=firstDay; i<lastDateNum + firstDay; i++) {
            const nowDate = document.getElementById("miniDate" + i);
            nowDate.innerHTML = i - firstDay + 1;
        }
    } else {    // 일요일, 요일이 0~6까지 놀아서 분리
        for(i=7; i<=lastDateNum + 7; i++) {
            const nowDate = document.getElementById("miniDate" + i);
            nowDate.innerHTML = i-6;
        }
    }
}

// 미니달력의 월을 메인달력으로
// 다이어리
function submitMiniDiary() {
	document.getElementById("send_diary").submit();
}


// 연간달력
// 이전년
function prevYearCalendar() {
    for(let i=1; i<=42; i++) {
        for(let j=0; j<12; j++) {
            document.getElementsByClassName("date" + i)[j].innerHTML = null;
        }
    }
    today = new Date(today.getFullYear()-1, today.getMonth(), today.getDate());
    printYearCalendar();
   
}

// 다음년
function nextYearCalendar() {
    for(let i=1; i<=42; i++) {
        for(let j=0; j<12; j++) {
            document.getElementsByClassName("date" + i)[j].innerHTML = null;
        }
    }
    today = new Date(today.getFullYear()+1, today.getMonth(), today.getDate());
    printYearCalendar();
    
}

// 메인 연간달력 생성기
function printYearCalendar() {
    // 연도, 월 타이틀 변경
    let yearCalendarTitle = document.getElementsByClassName("year_box");
    let yearCalendarMonth = document.getElementsByClassName("cal_month");
    for(let i=0; i<12; i++){
    	document.getElementsByClassName("year_to_month1")[i].value = today.getFullYear();
    }
    yearCalendarTitle[0].innerHTML = today.getFullYear();
    for(let i=0; i<12; i++){
        yearCalendarMonth[i].innerHTML = monthPrint(i+1);     
    }

    // 이번달의 첫날
    let firstDate = new Date(today.getFullYear(),today.getMonth(),1);  
    // 이번달 추출
    let nowMonth = firstDate.getMonth();
    // 반복문으로 월별 달력 추출
    for(let i=0; i<12; i++){
        let temp1 = new Date(today.getFullYear(), i, 1);
        let temp2 = new Date(today.getFullYear(), i+1, 0);
        let firstDayOfMonth = temp1.getDay();
        let lasttDateOfMonth = temp2.getDate();
        let calendarContent = document.getElementsByClassName("cal_box")[i];
        
        if(firstDayOfMonth != 0){ // 월 ~ 토
            for(let j=firstDayOfMonth; j<lasttDateOfMonth + firstDayOfMonth; j++) {
                document.getElementsByClassName("date" + j)[i].innerHTML = j - firstDayOfMonth + 1;
            }
        } else { // 일요일
            for(let j=7; j<lasttDateOfMonth + 7; j++) {
                document.getElementsByClassName("date" + j)[i].innerHTML = j - 6;
            }
        }
        
    }
}

// 월 변환 함수
function monthPrint(int) {
    switch(int) {
        case 1:
            return "January";
        case 2:
            return "February";
        case 3:
            return "March";
        case 4:
            return "April";
        case 5:
            return "May";
        case 6:
            return "June";
        case 7:
            return "July";
        case 8:
            return "August";
        case 9:
            return "September";
        case 10:
            return "October";
        case 11:
            return "November";
        case 12:
            return "December";
    }
}

function submit() {
	document.getElementById("send_year").submit();
}
function submit0() {
	document.getElementById("send_month0").submit();
}
function submit1() {
	document.getElementById("send_month1").submit();
}
function submit2() {
	document.getElementById("send_month2").submit();
}
function submit3() {
	document.getElementById("send_month3").submit();
}
function submit4() {
	document.getElementById("send_month4").submit();
}
function submit5() {
	document.getElementById("send_month5").submit();
}
function submit6() {
	document.getElementById("send_month6").submit();
}
function submit7() {
	document.getElementById("send_month7").submit();
}
function submit8() {
	document.getElementById("send_month8").submit();
}
function submit9() {
	document.getElementById("send_month9").submit();
}
function submit10() {
	document.getElementById("send_month10").submit();
}
function submit11() {
	document.getElementById("send_month11").submit();
}

function submitDiary() {
	document.getElementById("diary_schedule").submit();
}
function submitSchedule() {
	document.getElementById("schedule_diary").submit();
}

// 작성


function IsWrite() {
	for(let i=1; i<42; i++) {
		if(document.getElementById("date" + i).innerHTML == "") {
			$('#emotion' + i).on('click', function() {
				$('#write_page').removeClass('turnon');
	    		$('#write_page').addClass('turnoff');
	    		$('#show_page').removeClass('turnon');
	        	$('#show_page').addClass('turnoff');
	        	$('#reply_page').removeClass('turnon');
	        	$('#reply_page').addClass('turnoff');
			});
		} else {
			$('#emotion' + i).on('click', function() {
				if(document.getElementById("emotion" + i).innerHTML.trim() == "" || document.getElementById("emotion" + i).innerHTML.trim() == null || document.getElementById("emotion" + i).innerHTML.trim() == undefined) {
					$('#write_page').removeClass('turnoff');
	    			$('#write_page').addClass('turnon');
	    			document.getElementById("write_date").innerHTML = document.getElementById("date" + i).innerHTML;
	    			switch(i % 7) {
	    				case 1:
	    					document.getElementById("write_day").innerHTML = "MON";
	    					break;
	    				case 2:
	    					document.getElementById("write_day").innerHTML = "TUE";
	    					break;
	    				case 3:
	    					document.getElementById("write_day").innerHTML = "WED";
	    					break;
	    				case 4:
	    					document.getElementById("write_day").innerHTML = "TUR";
	    					break;
	    				case 5:
	    					document.getElementById("write_day").innerHTML = "FRI";
	    					break;
	    				case 6:
	    					document.getElementById("write_day").innerHTML = "SAT";
	    					break;
	    				default:
	    					document.getElementById("write_day").innerHTML = "SUN";
	    			}
	    		} else {
	    			$('#show_page').removeClass('turnoff');
	        		$('#show_page').addClass('turnon');
	        		$('#reply_page').removeClass('turnoff');
	        		$('#reply_page').addClass('turnon');
	    		}
			});
		}		
	}
};

$(function() {
       let rretoday = new Date();   

   let rredate = rretoday.getDate();  // 날짜
   let rreday = rretoday.getDay();  // 요일
   const whatday = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
   		$('#write_date').text(rredate);
		$('#write_day').text(whatday[rreday]);
	const open = sessionStorage.getItem("open");
	console.log(open);
	$("input:radio[name='diary_open']:radio[value="+open+"]").prop('checked', true);
    $('#show_page_closer').on('click', function() {
        $('#show_page').removeClass('turnon');
        $('#show_page').addClass('turnoff');
        $('#reply_page').removeClass('turnon');
        $('#reply_page').addClass('turnoff');
    });
    $('#reply_page_closer').on('click', function() {
        $('#reply_page').removeClass('turnon');
        $('#reply_page').addClass('turnoff');
    });
    $('#write_page_sticker').on('click', function() {
        $('#sticker_page').removeClass('turnoff');
        $('#sticker_page').addClass('turnon');
    });
    $('#sticker_page_closer').on('click', function() {
        $('#sticker_page').removeClass('turnon');
        $('#sticker_page').addClass('turnoff');
    });
    $('#write_page_closer').on('click', function() {
        $('#write_page').removeClass('turnon');
        $('#write_page').addClass('turnoff');
        $('#sticker_page').removeClass('turnon');
        $('#sticker_page').addClass('turnoff');
    });
    $('#show_page_reply').on('click', function() {
        $('#reply_page').removeClass('turnoff');
        $('#reply_page').addClass('turnon');
    });
    
    // 감정 클릭하면 다음 감정으로 넘어가게
	$('#mood_img').on('click', function() {
		let moodValue = document.getElementById('diary_mood');
		let moodImage = document.getElementById('mood_img');
		if(Number(moodValue.value) == 9) {
			moodValue.value = 1;
			moodImage.src = "../images/mood/mood-1.png";
		} else {
			if(moodValue.value == "1") {
				moodValue.value = 2;	
			} else {
				moodValue.value = Number(moodValue.value) + 1;
			}			
			moodImage.src = "../images/mood/mood-" + moodValue.value + ".png";
		}
	});
	
	// 스티커 화면 넘어가기 미리보기 등등 스티커 관련
	let stickerView = document.getElementById('sticker_view');
	let stickerCode = document.getElementById('diary_sticker');
	for (let i=2; i<7; i++) {
		$('#sticker_nav'+i).on('click', function() {
			for(let j=1; j<29; j++) {
				let stickerContent = document.getElementById('sticker_content' + j);
				let stickerId = document.getElementById('sticker_id' + j);
				stickerId.value = 100 * i + j;
				stickerContent.src = "../images/sticker" + i + "/sticker-" + i + "-" + j + ".png";
				$('#sticker_content' + j).on('click', function() {
					stickerView.style.backgroundImage = "url('../images/sticker" + i + "/sticker-" + i + "-" + j + ".png')";
					stickerCode.value = stickerId.value;
				});
			}
		});
	}
	
	// input 이미지 버튼 숨기고 아이콘 누르면 대신 눌리게 
	let imageSelect = document.getElementById('diary_image');
	$('#write_page_img').on('click', function() {
		imageSelect.click();
	});
	
	// 폰트 버튼 눌리면 에디터 켜지도록
	$('#write_page_font').on('click', function() {
		$('#p_content').removeClass('form_control');
	});
});

function moodDefault(num) {

}
function stickerClick() {
	document.getElementById('sticker_nav2').click();
}

function prevMonth() {
	currentMonth = getMonth();
	console.log(currentMonth);
	console.log(currentMonth-1);
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	printYearMonth();
	getMoodList();
}
function getMoodList() {
	const diary_mood_main = document.getElementsByClassName("diary_mood_main");
	diary_mood_main[0].innerHTML = "";
	m_idx = $('#m_idx').val();
	const year = $('#title_year').text();
	const month = getMonth();
	let realMonth = "";
	if(month < 10) {
		realMonth = "0" + String(month);
	}else{
		realMonth = String(month);
	}
	const date = year + "-" + realMonth;
	console.log(date);
	const xhr = new XMLHttpRequest();
	xhr.open("GET", "diary_list_ok.jsp?m_idx="+m_idx+"&date="+date, true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			const data = xhr.responseText;
			console.log(data);
			const str = data.split("%");
			for(let i=0; i<str.length-1; i++) {
				const arr = str[i].split(",");
				diary_mood_main[0].innerHTML += `<div class="diary_mood_container" id="diary_mood_container" onclick="sendDiary(this)">
                            <img src="../images/mood/mood-${arr[1]}.png">
                            <input type="hidden" id=${arr[0]} value=${arr[0]}>
                        </div>`
				
			}
		}
	}
}
function nextMonth() {
	currentMonth = getMonth();
	console.log(currentMonth);
	console.log(currentMonth+1);
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	printYearMonth();
	getMoodList();
}

function printYearMonth() {
	let yearTitle = document.getElementById("title_year");
	let monthTitle = document.getElementById("title_month");
	
	yearTitle.innerHTML = today.getFullYear();
	monthTitle.innerHTML = monthPrint(today.getMonth() + 1);

}
// 무드 다이어리 이모티콘, 인덱스번호 가져오기


// 캘린더 다이어리 상세보기
function writeOn(e) {
	month = getMonth();
	day = $(e).children('.date').text();
	console.log(month);
	console.log(day);
	console.log(parseInt(month+day));
	console.log(getToday());
       let rretoday = new Date();   

   let rredate = rretoday.getDate();  // 날짜
   let rreday = rretoday.getDay();  // 요일
   const whatday = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
	if($(e).children('.emotion').html() == "" && parseInt(month+day)==getToday() ) {
		$('#write_date').text(rredate);
		$('#write_day').text(whatday[rreday]);
		$('#write_page').removeClass('turnoff');
	    $('#write_page').addClass('turnon');
	}else if($(e).children('.emotion').html() != "") {
			const d_idx = $(e).children('.emotion').children().next().val();
			document.getElementById("comment_didx").value = d_idx;
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "../mainmood/diary_ok.jsp?d_idx="+d_idx, true);
			xhr.send();

			xhr.onreadystatechange = function() {
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					const json = JSON.parse(xhr.responseText);
					console.log(json);
					console.log(json.d_mood);
					console.log(json.d_week);
					$('#diary_title').html(json.d_title);
					$('#diary_day').html(json.d_day);
					$('#diary_week').html(json.d_week);
					$('#diary_content').html(json.d_content);
					$('#diary_img').html(`<img src='../images/mood/mood-${json.d_mood}.png'>`);
					$('#d_idx').val(json.d_idx);
					console.log("이미지" + json.d_img);
					const img = json.d_img;
					if(img.length > 4){
						console.log("널");
						$('#diary_photo').html(`<img src='../upload/${json.d_img}' alt="이미지">`);
						
					}else{
						console.log("dd");
						$('#diary_photo').html('');
					}
					if(json.d_sticker != 100) {
						const folderNum = parseInt(json.d_sticker / 100);
						const stickerNum = json.d_sticker - folderNum * 100;
						$('#diary_sticker2').html(`<img src='../images/sticker${folderNum}/sticker-${folderNum}-${stickerNum}.png' alt="스티커">`);
					}
				}
			}
			for(let i=1; i<21; i++){
				document.getElementById("reply_idx"+i).innerHTML = null;
			}
			const xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "./comment_ok.jsp?d_idx="+d_idx, true);
			xhr2.send();

			xhr2.onreadystatechange = function() {
				if(xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200) {
					const json = xhr2.responseText;
					console.log(json);
					let commentList = [];
					commentList = json.split("%");
					for(let i=0; i<commentList.length-1; i++){
						let commentName = [];
						commentName = commentList[i].split(",");
						document.getElementById("reply_idx"+(i+1)).innerHTML = commentName[1] + " : " + commentName[0];
					}
				}
			}

			$('#show_page').removeClass('turnoff');
			$('#show_page').addClass('turnon');
	}

	//if($(this).children('.emotion').innerHTML != "")
}
function temp1(e) {
	for(let i=1; i<21; i++){
		document.getElementById("reply_idx"+i).innerHTML = null;
	}
	month = getMonth();
	day = $(e).children('.date').text();
	console.log(month);
	console.log(day);
	console.log(parseInt(month+day));
	console.log(getToday());
	if($(e).children('.emotion').html() == "" && parseInt(month+day)==getToday() ) {
		$('#write_page').removeClass('turnoff');
	    $('#write_page').addClass('turnon');
	}else if($(e).children('.emotion').html() != "") {
			const d_idx = $(e).children('.emotion').children().next().val();
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "../maincal/comment_ok.jsp?d_idx="+d_idx, true);
			xhr.send();

			xhr.onreadystatechange = function() {
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					const json = xhr.responseText;
					console.log(json);
					let commentList = [];
					commentList = json.split("%");
					for(let i=0; i<commentList.length; i++){
						console.log(commentList[i]);
						document.getElementById("reply_idx"+(i+1)).innerHTML = commentList[i];
					}
				}
			}
	}
}
function getMonth() {
	console.log($('#title_month').text());
	switch($('#title_month').text()) {
		case "January":
			return 1;
		case "February":
			return 2;
		case "March":
			return 3;
		case "April":
			return 4;
		case "May":
			return 5;
		case "June":
			return 6;
		case "July":
			return 7;
		case "August":
			return 8;
		case "September":
			return 9;
		case "October":
			return 10;
		case "November":
			return 11;
		case "December":
			return 12;
		
	}
}
function getToday() {
	let today = new Date();   
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	return parseInt(String(month) + String(date));

}
function monthPrint(int) {
    switch(int) {
        case 1:
            return "January";
        case 2:
            return "February";
        case 3:
            return "March";
        case 4:
            return "April";
        case 5:
            return "May";
        case 6:
            return "June";
        case 7:
            return "July";
        case 8:
            return "August";
        case 9:
            return "September";
        case 10:
            return "October";
        case 11:
            return "November";
        case 12:
            return "December";
	}
}