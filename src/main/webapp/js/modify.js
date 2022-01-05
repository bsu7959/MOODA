'use strict';

const userpwCheck = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/
const emailCheck = /[A-Za-z0-9\.\-]+\@[A-Za-z0-9\-]+\.[A-Za-z]{3}/;
const hpCheck = /\d{3}-\d{3,4}-\d{4}/;
const nicknameCheck = /[가-힣a-zA-Z0-9]{4,10}/;
const bdayCheck = /[0-9]{8}/;

function sendit(){

    const userpw_cu = document.getElementById("userpw_cu");
    const newuserpw = document.getElementById("newuserpw");
    const newuserpwre = document.getElementById("newuserpwre");
    const email = document.getElementById("email");
    const hp = document.getElementById("hp");
    const nickname = document.getElementById("nickname");
    const birth = document.getElementById("birth");
    const like = document.getElementsByClassName("like");
    const userpw_check = document.getElementById('userpw_check');

	/* 이메일 체크 */
    if(email.value == ''){
        alert('이메일을 입력하세요.');
        email.focus();
        return false;
    }
    if(!emailCheck.test(email.value)){
        alert('이메일 형식을 확인해주세요.');
        email.focus();
        return false;
    }

	/* 폰번호 체크 */
    if(hp.value == ''){
        alert('휴대폰 번호를 입력하세요.');
        hp.focus();
        return false;
    }
    if(!hpCheck.test(hp.value)){
        alert("휴대폰 번호는 '-'을 포함하여 입력해주세요.");
        hp.focus();
        return false;
    }

    /* 현재 비밀번호 입력 확인 */
    if(userpw_cu.value == ''){
        alert('비밀번호를 입력하세요.');
        userpw_cu.focus();
        return false;
    }
    /* 새 비밀번호를 입력했을 때 */
    if(newuserpw.value != '') {
	    if(!userpwCheck.test(newuserpw.value)){
	        alert('비밀번호는 하나 이상의 영문,숫자,특수문자로 이루어진 6-20글자로 입력해주세요.');
	        newuserpw.focus();
	        return false;
	    }
	    if(newuserpw.value != newuserpwre.value){
	        alert('비밀번호를 확인해주세요.')
	        newuserpwre.focus();
	        return false;
	    }
    }

	/* 닉네임 체크 */
    if(nickname.value == ''){
        alert('닉네임을 입력하세요.');
        nickname.focus();
        return false;
    }
    if(!nicknameCheck.test(nickname.value)){
        alert('닉네임은 한글,영문,숫자를 포함한 4~10자리로 입력해주세요.');
        nickname.focus();
        return false;
    }


    /* 생년월일 체크 */
    if(birth.value == ''){
        alert('생년월일을 입력하세요.');
        birth.focus();
        return false;
    }
    if(!bdayCheck.test(birth.value)){
        alert('생년월일은 숫자 8자리로 입력해주세요.');
        birth.focus();
        return false;
    }

    /* 관심사 체크 */
    let isLikeChecked = false;
    for(let i=0; i<like.length; i++){
        if(like[i].checked){
            isLikeChecked = true;
            break;
        }
    }
    if(isLikeChecked == false){
        alert('관심사를 한개이상 선택해주세요.');
        return false;
    }
    /* 입력한 현재 비밀번호가 실제 비밀번호와 다르면 false */
    if(userpw_check.value != userpw_cu.value) {
    	alert('현재 비밀번호를 확인해주세요');
    	userpw_cu.focus();
    	return false;
    }
} 