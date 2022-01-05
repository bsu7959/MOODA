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
    document.getElementById("schedule_date").max = Number(lastDate.getDate());
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
        for(i=7; i<lastDateNum + 7; i++) {
            const nowDate = document.getElementById("date" + i);
            nowDate.innerHTML = i-6;
        }
    }
    IsWrite();
}

// 미니달력
// 이전 미니달력
function prevMiniSchedule() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()-1, 1);
    printMiniSchedule();
   
}
// 다음 미니달력
function nextMiniSchedule() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()+1, 1);
    printMiniSchedule();
   
}
// 미니달력 생성기
function printMiniSchedule() {
    // 연월표시
    let miniCalendarTitle = document.getElementsByClassName("mini_title");
    miniCalendarTitle[0].innerHTML = miniToday.getFullYear() + "." + (miniToday.getMonth()+1);
    
    document.getElementById("mini_s_main1").value = miniToday.getFullYear();
    document.getElementById("mini_s_main2").value = miniToday.getMonth();
    
    // 이번달의 첫날
    let firstDate = new Date(miniToday.getFullYear(),miniToday.getMonth(),1); 
    // 이번달의 마지막날
    let lastDate = new Date(miniToday.getFullYear(),miniToday.getMonth()+1,0); 
    // 이번달 첫날의 요일
    let firstDay = firstDate.getDay();
    // 이번달 첫날과 마지막날 숫자로 추출
    document.getElementById("mini_s_main3").value = firstDate.getDay();
    let fisrtDateNum = firstDate.getDate();
    let lastDateNum = lastDate.getDate();
    if(firstDay != 0){  // 월 ~ 토
        for(i=firstDay; i<lastDateNum + firstDay; i++) {
            const nowDate = document.getElementById("miniDate" + i);
            nowDate.innerHTML = i - firstDay + 1;
        }
    } else {    // 일요일, 요일이 0~6까지 놀아서 분리
        for(i=7; i<lastDateNum + 7; i++) {
            const nowDate = document.getElementById("miniDate" + i);
            nowDate.innerHTML = i-6;
        }
    }
}

// 미니달력의 월을 메인달력으로
function submitMiniSchedule() {
	document.getElementById("send_schedule").submit();
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
	    		$('#show_page').removeClass('turnon');
	        	$('#show_page').addClass('turnoff');
	        	$('#reply_page').removeClass('turnon');
	        	$('#reply_page').addClass('turnoff');
			});
		} else {
			$('#emotion' + i).on('click', function() {
				$('#show_page').removeClass('turnoff');
        		$('#show_page').addClass('turnon');
        		$('#reply_page').removeClass('turnoff');
        		$('#reply_page').addClass('turnon');
			});
		}		
	}
};

$(function() {
	$('#write_schedule_btn').on('click', function() {
		$('#write_page').removeClass('turnoff');
	    $('#write_page').addClass('turnon');
	});
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
    });
    $('#show_page_reply').on('click', function() {
        $('#reply_page').removeClass('turnoff');
        $('#reply_page').addClass('turnon');
    });
});

function writeOn(e) {
   let s_date = 0;
   if(parseInt(document.getElementById('mini_s_main2').value)+1 < 10) {
      if(parseInt($(e).children('.date').text()) < 10) {
         s_date = document.getElementById('mini_s_main1').value.substring(2,4) + "-0" + (parseInt(document.getElementById('mini_s_main2').value)+1) + "-0" + $(e).children('.date').text();
      } else {
         s_date = document.getElementById('mini_s_main1').value.substring(2,4) + "-0" + (parseInt(document.getElementById('mini_s_main2').value)+1) + "-" + $(e).children('.date').text();
      }
   } else {
      if(parseInt($(e).children('.date').text()) < 10) {
         s_date = document.getElementById('mini_s_main1').value.substring(2,4) + "-" + (parseInt(document.getElementById('mini_s_main2').value)+1) + "-0" + $(e).children('.date').text();
      } else {
         s_date = document.getElementById('mini_s_main1').value.substring(2,4) + "-" + (parseInt(document.getElementById('mini_s_main2').value)+1) + "-" + $(e).children('.date').text();
      }
   }      
   console.log(s_date);
   const xhr = new XMLHttpRequest();
   xhr.open("GET", "../maincal/schedule_ok.jsp?s_date="+s_date, true);
   xhr.send();

   xhr.onreadystatechange = function() {
      if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
         const json = xhr.responseText;            
         console.log(json)
         
         let scheduleList = [];
         scheduleList = json.split("%");
         document.getElementById("schedule_week").innerHTML = scheduleList[0];
         document.getElementById("schedule_day").innerHTML = $(e).children('.date').text();
         for(let i=1; i<scheduleList.length-1; i++){
            let scheduleContent = []
            scheduleContent = scheduleList[i].split(",");
            console.log(scheduleContent[0]);
console.log(scheduleContent[1]);
console.log(scheduleContent[2]);
            document.getElementById("scheduleTime"+(i)).innerHTML = scheduleContent[0].substring(0,2) + " : " + scheduleContent[0].substring(3,5);
            document.getElementById("scheduleText"+(i)).innerHTML = scheduleContent[1];
            document.getElementById("scheduleAlarm"+(i)).innerHTML = " / 알림설정 : " + alarmSetting(scheduleContent[2]);
		document.getElementById("show_page_delete").addEventListener('click', function() {
			location.href="./schedule_delete_ok.jsp?s_idx="+scheduleContent[3];
		});
         }
         for(let i=scheduleList.length-1; i<10; i++){
            document.getElementById("scheduleTime"+(i)).innerHTML = null;
            document.getElementById("scheduleText"+(i)).innerHTML = null;
            document.getElementById("scheduleAlarm"+(i)).innerHTML = null;
         }

      }
   }
   
   $('#show_page').removeClass('turnoff');
   $('#show_page').addClass('turnon');
}

function alarmSetting(i) {
   if(i == "1" || i == 1){
      return "켜짐";
   } else {
      return "꺼짐";
   }
}