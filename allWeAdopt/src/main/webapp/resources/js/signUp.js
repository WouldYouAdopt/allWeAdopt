// 회원가입 유효성 검사

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberEmail"     : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberNickname"  : false,
    "memberTel"       : false
    //"sendEmail"       : false   // 인증번호 발송 체크
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

        emailMsg.innerText = "사용 가능한 이메일입니다.";
        emailMsg.classList.remove("error");
        emailMsg.classList.add("confirm");

        // $.ajax({
        //     url : "emailDupCheck",   
        //     data : { "memberEmail" : memberEmail.value },
        //     type : "GET", // 데이터 전달 방식 type
        //     success : function(result){
        //         if(result == 1){ // 중복 O
        //             alert("사용중인 이메일입니다. 다른 이메일을 입력해주세요.");
        //             memberEmail.focus();
        //             checkObj.memberEmail = false; // 유효 X 기록
        //         } else { // 중복 X
        //             alert("사용 가능한 이메일입니다. ");
        //             checkObj.memberEmail = true; // 유효 O 기록
        //         }
        //     },
        //     error : function(){
        //         // 비동기 통신(ajax) 중 오류가 발생한 경우
        //         console.log("에러 발생");
        //     }
        // });

    }else{
        emailMsg.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMsg.classList.remove("confirm");
        emailMsg.classList.add("error");

        checkObj.memberEmail = false; // 유효 X 기록
    }

});



// 비밀번호 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMsg = document.getElementById("pwMsg");

memberPw.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(memberPw.value.length == 0){

        pwMsg.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMsg.classList.remove("confirm");
        pwMsg.classList.add("error");

        checkObj.memberPw = false; // 유효 X 기록
        return;
    }

    // 입력된 경우 유효성 검사 (영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이)
    const regExp = /^[\w!@#_-]{6,30}$/; 
    if( regExp.test(memberPw.value) ){ // 비밀번호 유효

        checkObj.memberPw = true; // 유효 O 기록

        if(memberPwConfirm.value.length == 0){ // 비밀번호 유효, 확인 작성 X
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

        checkObj.memberPw = false; // 유효 X 기록
    }
});

// 비밀번호 확인 유효성 검사

// 함수명() : 함수 호출(수행)
// 함수명   : 함수에 작성된 코드 반환
memberPwConfirm.addEventListener("input", checkPw );
// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


function checkPw(){ // 비밀번호 일치 검사
    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(memberPw.value == memberPwConfirm.value){

        pwMsg.innerText = "비밀번호 일치";
        pwMsg.classList.remove("error");
        pwMsg.classList.add("confirm");
        checkObj.memberPwConfirm = true; // 유효 O 기록

    } else{
        pwMsg.innerText = "비밀번호 불일치 ";
        pwMsg.classList.remove("confirm");
        pwMsg.classList.add("error");
        checkObj.memberPwConfirm = false; // 유효 X 기록
    }
}


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


// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const telMsg = document.getElementById("telMsg");

memberTel.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if(memberTel.value.length == 0){
        telMsg.innerText = "휴대폰 번호를 입력해주세요.(- 제외)";
        telMsg.classList.remove("confirm");
        telMsg.classList.add("error");

        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록

        return;
    }

    // 전화번호 정규식
    const regExp = /^01[01679]\d{3,4}\d{4}$/;

    if(regExp.test(memberTel.value)){ // 유효한 경우
        telMsg.innerText = "유효한 전화번호 형식입니다.";
        telMsg.classList.add("confirm");
        telMsg.classList.remove("error");

        checkObj.memberTel = true; // 유효한 상태임을 기록
        
    } else{ // 유효하지 않은 경우
        telMsg.innerText = "전화번호 형식이 올바르지 않습니다.";
        telMsg.classList.add("error");
        telMsg.classList.remove("confirm");

        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록
    }
});


















// 다음 주소 api
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;

        }
    }).open();
}