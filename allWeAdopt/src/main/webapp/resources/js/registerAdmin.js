console.log("연결됨");

// 회원가입 유효성 검사

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberEmail"     : false,
    "memberName"  : false
};

// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const emailMsg = document.getElementById("emailMsg");

memberEmail.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if( memberEmail.value.length == 0 ){

        emailMsg.innerText = "이메일을 입력해주세요.";
        emailMsg.classList.remove("confirm");
        emailMsg.classList.add("error");

        checkObj.memberEmail = false; // 유효 X 기록
        return;
    }

    // 입력된 경우 유효성 검사 진행
    const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

    if( regExp.test(memberEmail.value) ){ // 유효한 경우

        $.ajax({
            url : "emailDupCheck",   
            data : { "memberEmail" : memberEmail.value },
            type : "GET", // 데이터 전달 방식 type
            success : function(result){

                if(result == 0){
                    emailMsg.innerText = "사용 가능한 이메일입니다.";
                    emailMsg.classList.remove("error");
                    emailMsg.classList.add("confirm");
                    checkObj.memberEmail = true; // 유효 O 기록
                }

                if(result == 1){ // 사이트 가입 회원 이메일
                    emailMsg.innerText = "이미 사용중인 이메일입니다.";
                    emailMsg.classList.remove("confirm");
                    emailMsg.classList.add("error");

                    checkObj.memberEmail = false; // 유효 X 기록
                } 

                if(result==2){ // 카카오 가입 회원 이메일
                    emailMsg.innerText = "사용중인 이메일입니다. 카카오 로그인 시도 혹은 다른 이메일을 입력해주세요.";
                    emailMsg.classList.remove("confirm");
                    emailMsg.classList.add("error");

                    checkObj.memberEmail = false; // 유효 X 기록
                }             
            },
            error : function(){
                // 비동기 통신(ajax) 중 오류가 발생한 경우
                console.log("에러 발생");
            }
        });

    }else{
        emailMsg.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMsg.classList.remove("confirm");
        emailMsg.classList.add("error");

        checkObj.memberEmail = false; // 유효 X 기록
    }

});



// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameMsg = document.getElementById("nameMsg");

memberName.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(memberName.value.length == 0){

        nameMsg.innerText = "영어/숫자/한글 2~10글자 사이로 작성해주세요.";
        nameMsg.classList.remove("confirm");
        nameMsg.classList.add("error");

        checkObj.memberName = false; // 유효 X 기록
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

    if( regExp.test(memberName.value) ){ // 유효한 경우

        nameMsg.innerText = "정상 입력";
        nameMsg.classList.remove("error");
        nameMsg.classList.add("confirm");
        checkObj.memberName = true; // 유효 O 기록

    }else{

        nameMsg.innerText = "이름 형식이 유효하지 않습니다.";
        nameMsg.classList.remove("confirm");
        nameMsg.classList.add("error");

        checkObj.memberName = false; // 유효 X 기록

    }

});



// 회원가입 버튼 클릭시 유효성 검사여부 확인
function signUpValidate(){

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberEmail"    : str="이메일 입력란을"; break;
            case "memberName"     : str="닉네임 입력란을"; break;
            }

            str += " 확인해주세요.";

            Swal.fire({
                title: str,
                width: 350,
                padding: '3em',
                color: 'black',
                confirmButtonColor: 'rgb(251, 131, 107)',
                confirmButtonText: '확인'
                });

            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}
