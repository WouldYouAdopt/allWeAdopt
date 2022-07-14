

            const checkObj = { 
                "memberEmail"     : false,
                "sendEmail" :false // 인증번호 발송채크 
            };

            const memberEmail = document.getElementById("name");
            const emailMsg = document.getElementById("checkEmail");
            const sendBtn = document.getElementById("sendBtn");
            const cMessage = document.getElementById("cMessage");
            const cNum = document.getElementById("cNum");
            const cNumCheck = document.getElementById("cNumCheck");
            const changePw = document.getElementById("changePw");

        

            emailMsg.style.display="none";
            cNum.style.display="none";
            sendBtn.style.display="none";
            cNumCheck.style.display="none";

            memberEmail.addEventListener("input", function(){
                
                
                emailMsg.style.display="block";
                
                // 입력이 되지 않은 경우
                if( memberEmail.value.length == 0 ){
                    
                    emailMsg.innerText = "이메일을 입력해주세요.";
                    emailMsg.classList.remove("confirm");
                    emailMsg.classList.add("error");

                    emailMsg.style.display="none";
                    cNum.style.display="none";
                    sendBtn.style.display="none";
                    cNumCheck.style.display="none";

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
                            emailMsg.innerText = "존재하지 않는 회원입니다.";
                            emailMsg.classList.remove("confirm");
                            emailMsg.classList.add("error");

                            cNum.style.display="none";
                            sendBtn.style.display="none";
                            cNumCheck.style.display="none";

                            checkObj.memberEmail = false; // 유효 X 기록
                        }

                        if(result == 1){ // 사이트 가입 회원 이메일
                            emailMsg.innerText = "이메일 확인 완료";
                            emailMsg.classList.remove("confirm");
                            emailMsg.classList.add("error");

                            cMessage.style.display="block";
                            cNum.style.display="block";
                            sendBtn.style.display="block";
                            cNumCheck.style.display="block";
                            document.getElementById("inputEmail").value = memberEmail.value ;
                            checkObj.memberEmail = true; // 유효 O 기록
                        } 

                        if(result==2){ // 카카오 가입 회원 이메일
                            emailMsg.innerText = "카카오 로그인 회원은 비밀번호 재설정 할 수 없습니다.";
                            emailMsg.classList.remove("confirm");
                            emailMsg.classList.add("error");

                            cNum.style.display="none";
                            sendBtn.style.display="none";
                            cNumCheck.style.display="none";

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

            // 타이머에 사용될 변수
            let checkInterval; // setInterval을 저장할 변수
            let min = 4;
            let sec = 59;


            sendBtn.addEventListener("click",function(){

               $.ajax({
                    url : "SendEmail",
                    data : {"memberEmail" : memberEmail.value},
                    type : "GET",
                    success : function(result){

                         console.log("이메일 발송 성공");

                        // 인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkObj에 기록
                        checkObj.sendEmail = true;


                   },
                    error : function(){
                        console.log("이메일 발송 실패")
                    }
                });

                // Mail 발송 Ajax 코드는 동작이 느림....
                // -> 메일은 메일대로 보내고, 타이머는 버튼이 클릭 되자 마자 바로 실행
                // --> ajax 코드가 비동기이기 때문에 메일이 보내지는 것을 기다리지 않고
                //      바로 다음 코드가 수행된다!!

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
                        cMessage.classList.add("error");
                        cMessage.innerText = "인증번호가 만료되었습니다.";

                        clearInterval(checkInterval); // checkInterval 반복을 지움
                    }

                }, 1000); // 1초 지연 후 수행
                alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
            });


            cNumCheck.addEventListener("click", function(){

                // 1. 인증번호 받기 버튼이 클릭되어 이메일 발송되었는지 확인
                if(checkObj.sendEmail){

                    // 2. 입력된 인증번호가 6자리가 맞는지 확인
                    if( cNum.value.length == 6 ){ // 6자리 맞음

                        $.ajax({
                            url : "checkNumber",
                            data : { "cNum" : cNum.value,
                                    "memberEmail" : memberEmail.value },
                            type : "GET",
                            success : function(result){
                                console.log(result);  
                                // 1 : 인증번호 일치 O, 시간 만족O
                                // 2 : 인증번호 일치 O, 시간 만족X
                                // 3 : 인증번호 일치 X

                                if(result == 1){

                                    clearInterval(checkInterval); // 타이머 멈춤     

                                    cMessage.innerText = "인증되었습니다.";
                                    cMessage.classList.add("confirm");
                                    cMessage.classList.remove("error");


                                    changePw.style.display="block";
                                    cNum.style.display="block";
                                    sendBtn.style.display="block";
                                    cNumCheck.style.display="block";


                                } else if(result == 2){
                                    // cMessage.innerText = "만료된 인증 번호 입니다..";
                                    alert("만료된 인증 번호 입니다.");

                                } else{ // 3
                                    // cMessage.innerText = "인증 번호가 일치하기 않습니다.";
                                    alert("인증 번호가 일치하기 않습니다.");
                                }


                            },

                            error : function(){
                                console.log("이메일 인증 실패")
                            }
                        });



                    } else { // 6자리 아님
                        alert("인증번호를 정확하게 입력해주세요.");
                    }

                }else{ // 인증번호를 안받은 경우
                    alert("인증번호 받기 버튼을 먼저 클릭해주세요.");
                }

            });







const pwCheckObj = { 
    "changePwBtn" :false // 인증번호 발송채크 

};

// 비밀번호 유효성 검사
const memberPw = document.getElementById("newPw");
const memberPwConfirm = document.getElementById("newPwConfirm");
const pwMessage = document.getElementById("pwMessage");
const pwMessageConfirm = document.getElementById("pwMessageConfirm");

memberPw.addEventListener("input", function(){

     pwMessage.style.display="block";

    if(memberPw.value.length == 0){
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error");

        pwCheckObj.changePwBtn = false; // 유효 X 기록
        return;
    }

    const regExp = /^[\w!@#_-]{6,30}$/;

    if( regExp.test(memberPw.value) ){ // 비밀번호 유효

         pwCheckObj.changePwBtn = true; // 유효 O 기록

        if(memberPwConfirm.value.length == 0){ // 비밀번호 유효, 확인 작성 X
            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        
        } else { // 비밀번호 유효, 확인 작성 O
            checkPw(); // 비밀번호 일치 검사 함수 호출()
        }

    }else{
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

         pwCheckObj.changePwBtn = false; // 유효 X 기록
    }
});


// 비밀번호 확인 유효성 검사

// 함수명() : 함수 호출(수행)
// 함수명   : 함수에 작성된 코드 반환
memberPwConfirm.addEventListener("input", checkPw );
// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


function checkPw(){ // 비밀번호 일치 검사

    pwMessageConfirm.style.display="block";

    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(memberPw.value == memberPwConfirm.value){
        pwMessageConfirm.innerText = "비밀번호가 일치합니다.";
        pwMessageConfirm.classList.add("confirm");
        pwMessageConfirm.classList.remove("error");

        changePwBtn.memberPwConfirm = true; // 유효 O 기록

    } else{
        pwMessageConfirm.innerText = "비밀번호가 일치하지 않습니다.";
        pwMessageConfirm.classList.add("error");
        pwMessageConfirm.classList.remove("confirm");

        changePwBtn.memberPwConfirm = false; // 유효 X 기록
    }
}
            

// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function changeValidate(){

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    let str;

    for( let key  in pwCheckObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !pwCheckObj[key] ){ 

            switch(key){
            case "changePwBtn":        str="비밀번호가"; break;    
            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }

    return true; // form태그 기본 이벤트 수행

}

