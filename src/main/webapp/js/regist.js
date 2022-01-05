'use strict';

const useridCheck = /(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/;
const userpwCheck = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/
const nameCheck = /[가-힣]+$/;
const emailCheck = /[A-Za-z0-9\.\-]+\@[A-Za-z0-9\-]+\.[A-Za-z]{3}/;
const hpCheck = /\d{3}-\d{3,4}-\d{4}$/;
const nicknameCheck = /^([가-힣a-zA-Z0-9])$/;
const bdayCheck = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

function sendit(){
    const userid = document.getElementById("userid");
    const userpw = document.getElementById("userpw");
    const signpw_re = document.getElementById("signpw_re");
    const name = document.getElementById("name");
    const email = document.getElementById("email");
    const hp = document.getElementById("hp");
    const nickname = document.getElementById("nickname");
    const birth = document.getElementById("birth");
    const like = document.getElementsByClassName("like");

    /* 아이디 검증 */
    if(userid.value == ''){
        alert('아이디를 입력하세요.');
        userid.focus();
        return false;
    }
    if(!useridCheck.test(userid.value)){
        alert('아이디는 하나 이상의 영문,숫자로 이루어진 6-20글자로 입력해주세요.');
        userid.focus();
        return false;
    }

    /* 비밀번호 검증 */
    if(userpw.value == ''){
        alert('비밀번호를 입력하세요.');
        userpw.focus();
        return false;
    }
    if(!userpwCheck.test(userpw.value)){
        alert('비밀번호는 하나 이상의 영문,숫자,특수문자로 이루어진 6-20글자로 입력해주세요.');
        userpw.focus();
        return false;
    }
    if(userpw.value != signpw_re.value){
        alert('비밀번호를 확인해주세요.')
        userpw.focus();
        return false;
    }

    /* 이름 검증 */
    if(name.value == ''){
        alert('이름을 입력하세요.');
        name.focus();
        return false;
    }
    if(!nameCheck.test(name.value)){
        alert('이름은 한글로 입력해주세요.');
        name.focus();
        return false;
    }

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
        alert("휴대폰 번호는 '-'을 포함하여 형식에 맞게 입력해주세요.");
        hp.focus();
        return false;
    }

    /* 닉네임 체크 */
    if(nickname.value == ''){
        alert('닉네임을 입력하세요.');
        nickname.focus();
        return false;
    }
    if(!nicknameCheck.test(nickname.value) && (nickname.value.length < 4 || nickname.value.length > 10)){
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
        alert('생년월일은 숫자 8자리로 형식에 맞게 입력해주세요.');
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
    
   	/* alert('가입 완료'); */
   	return true;
} 