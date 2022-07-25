// 유효성 검사 여부를 기록할 객체 생성
const checkObj2 = { 
    "inputPw"      : false
};

if(document.getElementById("inputPw")!=null){

    // 비밀번호 유효성 검사
    const inputPw = document.getElementById("inputPw");

    // 현재비밀번호
    inputPw.addEventListener("input", function(){

        // 입력되지 않은 경우
        if(inputPw.value.length == 0){

            checkObj2.inputPw = false; // 유효 X 기록
            return;
        }

        // 입력된 경우 유효성 검사 (영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이)
        const regExp = /^[\w!@#_-]{6,30}$/; 
        if( regExp.test(inputPw.value) ){ // 비밀번호 유효

            checkObj2.inputPw = true; // 유효 O 기록

        }else{

            checkObj2.inputPw = false; // 유효 X 기록
        }
    });

}

// 수정하기 버튼 클릭시 유효성 검사여부 확인
function updateInfoValidate2(){

    console.log("클릭됨");

    let str;

    for( let key  in checkObj2 ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj2[key] ){ 

            switch(key){
            case "inputPw":  str="비밀번호 입력란을"; break;
            }

            str += " 다시 확인해주세요. ";

            Swal.fire({
                title: str,
                width: 350,
                padding: '3em',
                color: 'black',
                confirmButtonColor: 'rgb(251, 131, 107)',
                confirmButtonText: '확인'
                });

            document.getElementById(key).focus();
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}