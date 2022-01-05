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
    
}

// 미니달력
// 이전 미니달력
function prevMiniCalendar() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()-1, miniToday.getDate());
    printMiniCalendar();
   
}
// 다음 미니달력
function nextMiniCalendar() {
    for(let i=1; i<=42; i++) {
        document.getElementById("miniDate" + i).innerHTML = null;
    }
    
    miniToday = new Date(miniToday.getFullYear(), miniToday.getMonth()+1, miniToday.getDate());
    printMiniCalendar();
   
}
// 미니달력 생성기
function printMiniCalendar() {
    // 연월표시
    let miniCalendarTitle = document.getElementsByClassName("mini_title");
    miniCalendarTitle[0].innerHTML = miniToday.getFullYear() + "." + (miniToday.getMonth()+1);

    // 이번달의 첫날
    let firstDate = new Date(miniToday.getFullYear(),miniToday.getMonth(),1); 
    // 이번달의 마지막날
    let lastDate = new Date(miniToday.getFullYear(),miniToday.getMonth()+1,0); 
    // 이번달 첫날의 요일
    let firstDay = firstDate.getDay();
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
function moveMainCalendar() {
	for(let i=1; i<=42; i++) {
        document.getElementById("date" + i).innerHTML = null;
    }
    
    today = new Date(miniToday.getFullYear(), miniToday.getMonth(), miniToday.getDate());
    printCalendar();
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




