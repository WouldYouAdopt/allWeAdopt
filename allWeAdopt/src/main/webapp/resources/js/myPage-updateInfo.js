// 회원정보 수정 유효성 검사

// 1. 나의 정보 관리

// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberName"  : true,
    "memberTel"       : true,
    "number"       : true,
    "timer" : true 
};

// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameMsg = document.getElementById("nameMsg");

if(document.getElementById("memberName")!=null){
    
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
}

const telMsg = document.getElementById("telMsg");

if(document.getElementById("changeBtn")){

    const changeBtn = document.getElementById("changeBtn");
    const telBox = document.getElementById("telBox");
    const numBox = document.getElementById("numBox");

    changeBtn.addEventListener("click", function(){

        memberTel.value="";
        number.value="";
        cMessage.innerText = "5:00";
        number.readOnly = false;
        memberTel.readOnly = false;
        confirmBtn.innerText = "인증";
        newTel.innerHTML = "<span>* </span>휴대폰 번호<span>(인증 대기)</span>";
        telMsg.innerText = "";

        Swal.fire({
            title: '휴대폰 번호 입력 후 인증을 완료해주세요.',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
            });

        // 전화번호, 인증번호 입력란 화면에 노출시켜주고
        telBox.classList.remove("none");
        numBox.classList.remove("none");

        // 번호, 문자 유효성검사 여부 false로 변경
        checkObj.memberTel = false;
        checkObj.number = false;
        checkObj.timer = false;
    });

}


// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");

if(document.getElementById("memberTel")!=null){


    memberTel.addEventListener("change", function(){

        document.getElementById("memberTel").setAttribute("name", "newTel");
        newTel.innerHTML = "<span>* </span>휴대폰 번호<span>(인증 대기)</span>";
        checkObj.memberTel = false; 
        checkObj.timer = false;
        number.readOnly = false;
        memberTel.readOnly = false;
        confirmBtn.innerText = "인증";
        number.value = "";
        cMessage.innerText = "5:00";
        
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
            telMsg.innerText = "유효한 전화번호 형식입니다. 문자 인증을 진행해주세요.";
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


// 문자 인증
const confirmBtn = document.getElementById("confirmBtn");

// 타이머에 사용될 변수
const cMessage = document.getElementById("cMessage");
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;


confirmBtn.addEventListener("click", function(){

    number.value="";
    telMsg.innerText = "";
    cMessage.innerText = "";
    checkObj.timer = false;
    number.readOnly = false;

    if(!checkObj.memberTel){

        Swal.fire({
            title: '휴대폰 번호를 확인해주세요.',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
            });

    }else{

        Swal.fire({
            title: '인증번호 전송 완료! 30초~ 1분정도 소요됩니다 :^)',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
            });
        

        $.ajax({
            url : contextPath + "/member/sms",
            data : { "memberTel" : memberTel.value },
            type : "GET", // 데이터 전달 방식 type
            success : function( randomNumber ){

                console.log(randomNumber);
                
                // 성공시 인증번호 반환, 실패시 0 반환
                if(randomNumber==0){
                    console.log("문자 발송 실패");
                    telMsg.innerText = "휴대폰번호 재확인 후 다시 인증버튼을 눌러주세요. ";
                    memberTel.focus();
                    checkObj.number = false; // 유효하지 않은 상태임을 기록
                }else{
                    
                    console.log("문자 발송 성공 : " + randomNumber);
                    checkObj.timer = true;

                    // 5분 타이머
                    // setInerval(함수, 지연시간) : 지연시간이 지난 후 함수를 수행 (반복)
                    cMessage.innerText = "5:00"; // 초기값 5분
                    min = 4;
                    sec = 59; // 분, 초 초기화

                    cMessage.classList.remove("confirm");
                    cMessage.classList.remove("error");

                    // 변수에 저장해야지 멈출 수 있음
                    checkInterval = setInterval(function(){
                        if(sec < 10) sec = "0" + sec;
                            cMessage.innerText = min + ":" + sec;

                        if(Number(sec) === 0){
                        min--;
                        sec = 59;
                        }else{
                            sec--;
                        }

                        if(min === -1){ // 만료
                        cMessage.innerText = "";
                        telMsg.classList.add("error");
                        telMsg.classList.remove("confirm");
                        telMsg.innerText = "인증시간 만료";
                        checkObj.timer = false;
                        clearInterval(checkInterval); // checkInterval 반복을 지움

                        }else{

                            
                            const number = document.getElementById("number");
                            number.addEventListener("keyup",function(){

                                if(number.value.trim().length == 0){

                                    telMsg.innerText = "인증번호를 입력해주세요.";
                                    telMsg.classList.add("error");
                                    telMsg.classList.remove("confirm");
                                    checkObj.number = false; // 유효하지 않은 상태임을 기록

                                }

                                if(number.value.trim().length != 0){

                                    if(number.value == randomNumber&&checkObj.timer){

                                        telMsg.classList.add("confirm");
                                        telMsg.classList.remove("error");
                                        telMsg.innerText = "인증 완료(다른 번호로 재입력을 원하시면 변경버튼을 눌러주세요.)";
                                        
                                        Swal.fire({
                                            title: '인증 완료 (하단의 수정버튼을 눌러주셔야 회원정보에 반영됩니다.)',
                                            width: 350,
                                            padding: '3em',
                                            color: 'black',
                                            confirmButtonColor: 'rgb(251, 131, 107)',
                                            confirmButtonText: '확인'
                                            });
        
                                        const newTel = document.getElementById("newTel");
                                        newTel.innerHTML = "<span>* </span>휴대폰 번호<span>(인증 완료)</span>";
   
                                        clearInterval(checkInterval);
                                        confirmBtn.innerText = "완료";
                                        memberTel.readOnly = true;
                                        checkObj.number = true; // 유효 O 기록
                                        number.readOnly = true;


                                    }else if(!checkObj.timer){
                                        telMsg.innerText = "인증시간 만료";
                                        telMsg.classList.add("error");
                                        telMsg.classList.remove("confirm");
                                        checkObj.number = false; // 유효하지 않은 상태임을 기록
                                    }else{
                                        telMsg.innerText = "인증번호 불일치";
                                        telMsg.classList.add("error");
                                        telMsg.classList.remove("confirm");
                                        checkObj.number = false; // 유효하지 않은 상태임을 기록

                                    }

                                }

                            })

                        }

                        // 인증 완료 후 번호를 변경하는 경우
                        if(checkObj.number&&checkObj.timer){
                            memberTel.addEventListener("click", function(){

                                Swal.fire({
                                    title: '휴대폰 번호를 수정하시겠습니까?',
                                    text: "번호 수정시 인증을 다시 진행해주셔야합니다.",
                                    width: 340,
                                    icon: 'warning',
                                    iconColor: 'rgb(251, 131, 107)',
                                    showCancelButton: true,
                                    confirmButtonColor: 'rgb(251, 131, 107)',
                                    cancelButtonColor: '#999',
                                    confirmButtonText: '확인',
                                    cancelButtonText: '취소'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            checkObj.number = false;
                                            number.value = ""
                                            number.readOnly = false;
                                            memberTel.focus();
                                        }else{
                                           console.log("취소~");
                                        }
                                    })

                            });
                        }

                    }, 1000); // 1초 지연 후 수행

                }

            },
            error : function(){
                // 비동기 통신(ajax) 중 오류가 발생한 경우
                console.log("에러 발생");
            }

        });

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
	
	        profileImg.setAttribute("src", contextPath+"/resources/images/user.png");
	        profileImage.value = "";
	        deleteImage.value = 1;

	    }
	
	});
	
}


// 수정하기 버튼 클릭시 유효성 검사여부 확인
function updateInfoValidate(){

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberName":  str="닉네임 입력란을"; break;
            case "memberTel":       str="전화번호 입력란을"; break;
            case "number"            : str="휴대폰 인증을"; break;
            case "timer"            : str="휴대폰 인증을"; break;
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

            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}

// 2. 비밀번호 변경

if(document.getElementById("inputPw")!=null){
    // 유효성 검사 여부를 기록할 객체 생성
    const checkObj2 = { 
        "inputPw"      : false,
        "newPw"        : false,
        "newPwConfirm" : false,
    };

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
}