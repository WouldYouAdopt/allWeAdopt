// 비밀번호 변경

// 유효성 검사 여부를 기록할 객체 생성
const checkObj2 = { 
    "inputPw"      : false,
    "newPw"        : false,
    "newPwConfirm" : false
};

if(document.getElementById("inputPw")!=null){

    // 비밀번호 유효성 검사
    const inputPw = document.getElementById("inputPw");
    const newPw = document.getElementById("newPw");
    const pwMsg = document.getElementById("pwMsg");

    // 현재비밀번호
    inputPw.addEventListener("input", function(){

        // 입력되지 않은 경우
        if(inputPw.value.length == 0){

            pwMsg.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
            pwMsg.classList.remove("confirm");
            pwMsg.classList.add("error");

            checkObj2.inputPw = false; // 유효 X 기록
            return;
        }

        // 입력된 경우 유효성 검사 (영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이)
        const regExp = /^[\w!@#_-]{6,30}$/; 
        if( regExp.test(inputPw.value) ){ // 비밀번호 유효

            if(newPw.value.length == 0){ // 비밀번호 유효, 확인 작성 X
                pwMsg.innerText = "새 비밀번호를 입력해주세요.";
                pwMsg.classList.remove("error");
                pwMsg.classList.add("confirm");
            } 

            checkObj2.inputPw = true; // 유효 O 기록

        }else{

            pwMsg.innerText = "비밀번호 형식이 유효하지 않습니다. ";
            pwMsg.classList.remove("confirm");
            pwMsg.classList.add("error");

            checkObj2.inputPw = false; // 유효 X 기록
        }
    });

}

// 새 비밀번호
newPw.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(newPw.value.length == 0){

        pwMsg.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMsg.classList.remove("confirm");
        pwMsg.classList.add("error");

        checkObj2.newPw = false; // 유효 X 기록
        return;
    }

    // 입력된 경우 유효성 검사 (영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이)
    const regExp = /^[\w!@#_-]{6,30}$/; 
    if( regExp.test(newPw.value) ){ // 비밀번호 유효

        checkObj2.newPw = true; // 유효 O 기록

        if(newPwConfirm.value.length == 0){ // 비밀번호 유효, 확인 작성 X
            pwMsg.innerText = "유효한 비밀번호 형식입니다.";
            pwMsg.classList.remove("error");
            pwMsg.classList.add("confirm");
        } else { // 비밀번호 유효, 확인 작성 O
            checkPw(); // 비밀번호 일치 검사 함수 호출()
        }

    }else{

        pwMsg.innerText = "비밀번호 형식이 유효하지 않습니다. ";
        pwMsg.classList.remove("confirm");
        pwMsg.classList.add("error");

        checkObj2.newPw = false; // 유효 X 기록
    }
});

// 비밀번호 확인 유효성 검사

const newPwConfirm = document.getElementById("newPwConfirm");

// 함수명() : 함수 호출(수행)
// 함수명   : 함수에 작성된 코드 반환
newPwConfirm.addEventListener("input", checkPw );
// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


function checkPw(){ // 비밀번호 일치 검사
    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(newPw.value == newPwConfirm.value){

        pwMsg.innerText = "비밀번호 일치";
        pwMsg.classList.remove("error");
        pwMsg.classList.add("confirm");
        checkObj2.newPwConfirm = true; // 유효 O 기록

    } else{
        pwMsg.innerText = "비밀번호 불일치 ";
        pwMsg.classList.remove("confirm");
        pwMsg.classList.add("error");
        checkObj2.newPwConfirm = false; // 유효 X 기록
    }
}


// 수정하기 버튼 클릭시 유효성 검사여부 확인
function updateInfoValidate2(){

    console.log("클릭됨");

    let str;

    for( let key  in checkObj2 ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj2[key] ){ 

            switch(key){
            case "inputPw":  str="현재 비밀번호 입력란을"; break;
            case "newPw":       str="새 비밀번호 입력란을"; break;
            case "newPwConfirm":       str="새 비밀번호 확인 입력란을"; break;
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
