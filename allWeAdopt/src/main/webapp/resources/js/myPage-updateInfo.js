// 회원정보 수정 유효성 검사

// 1. 나의 정보 관리

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberName"  : true,
    "memberTel"       : true
    //"인증번호"       : false   // 인증번호 발송 체크
};

// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameMsg = document.getElementById("nameMsg");

memberName.addEventListener("change", function(){

    checkObj.memberName = false;

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

memberTel.addEventListener("change", function(){

    checkObj.memberTel = false; 
    
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
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
        }
    }).open();
}




// 회원 프로필 이미지 (미리보기)
const profileImage = document.getElementById("profileImage");
const deleteImage = document.getElementById("deleteImage"); // 삭제여부 버튼
const profileImg = document.getElementById("profileImg");

if(profileImage != null){ // inputImage 요소가 화면에 존재 할 때
 
    // input type="file" 요소는 파일이 선택 될 때 change 이벤트가 발생한다.
    profileImage.addEventListener("change", function(){

        if(this.files[0] != undefined){ // 파일이 선택되었을 때

            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);

            reader.onload = function(e){
                profileImg.setAttribute("src", e.target.result);
            }

        }else{
            // 업로드 중 취소 버튼 누른경우 => 기존 프로필 사진으로 되돌리기
            profileImg.setAttribute("src", memberProfile);
        }
        deleteImage.value = 0; // 업로드 버튼 클릭됐음을 알림
    });
}


// 프로필 이미지 옆 삭제버튼 클릭 시
if(document.getElementById("del")!=null){
	
	del.addEventListener("click", function(){
	    // 0 : 삭제버튼 안눌림 / 1 : 삭제버튼 눌림	
	    if(deleteImage.value == 0 || deleteImage.value == 1){
	
	        profileImg.setAttribute("src", contextPath + "/resources/images/user.png");
	        profileImage.value = "";
	        deleteImage.value = 1;

	    }
	
	});
	
}


// 수정하기 버튼 클릭시 유효성 검사여부 확인
function updateInfoValidate(){

    console.log("클릭됨");

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberName":  str="닉네임 입력란을"; break;
            case "memberTel":       str="전화번호 입력란을"; break;
            }

            str += " 다시 확인해주세요. ";

            alert(str);
            document.getElementById(key).focus();
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}

// 2. 비밀번호 변경

// 유효성 검사 여부를 기록할 객체 생성
const checkObj2 = { 
    "inputPw"      : false,
    "newPw"        : false,
    "newPwConfirm" : false,
};

// 비밀번호 유효성 검사
const inputPw = document.getElementById("inputPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");
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

            alert(str);
            document.getElementById(key).focus();
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}






















