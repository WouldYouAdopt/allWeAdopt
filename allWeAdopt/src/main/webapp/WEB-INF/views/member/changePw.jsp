<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>비밀번호 재설정</title>


        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- 폰트어썸 (폰트)-->
        <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- signUp & login css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/signUp-style.css">



    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
           
             <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">비밀번호 재설정</h1>
                            <p class="lead fw-normal text-muted mb-0 fs-5">All We Adopt에 가입된 이메일 주소를 입력해주세요.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">

                                <form id="changePw" >
                                        <!-- Name input-->
                                        <div class=" form-floating mb-3">
                                            <input class="form-control" id="name" name="memberEmail" type="text" placeholder="Enter your id..." />
                                              <label for="name"><span style="color : #ccc; "> *가입한 이메일 </span></label>
                                            <div id="checkEmail" class="form-floating validate-area mt-2" style="display:none;"></div>
                                        </div>
                                        <div class=" form-floating input-group">
                                            <input class="form-control" id="cNum" type="text" style="display:none;" />
                                            <label for="cNum" id="cMessage"></label>
                                            <button class="btn bg-pink" id="sendBtn" type="button" style="border-top-right-radius: 4px; 
                                                border-bottom-right-radius: 4px; color : white; display:none;">인증번호 발송
                                            </button>
                                            <div class="invalid-feedback" >인증번호 입력해주세요.</div>
                                        </div>
    
                                        <div class="mt-3"></div>

                                    <button id="cNumCheck" class="btn button-pink col-xl-12" style="height: 50px; color: white;"> 인증번호 확인 </button>
                                    
                                    
                                </form>
                                
                                
                                <div class="mt-4"></div> 
                                <div class="mt-4"></div> 
                                <div class="mt-4"></div> 
                                
                                <!-- 비밀번호 재설정 -->
                                <!-- <div class="text-center mb-3">
                                    <p class="lead fw-normal text-muted mb-0">변경할 비밀번호를 입력해주세요.</p>
                                </div> -->
                                
                                <div class=" form-floating mb-3">
                                    <input class="form-control" id="name" type="text" data-sb-validations="required" />
                                    <label for="name">새 비밀번호</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">비밀번호를 입력해주세요.</div>
                                </div>
                                <div class=" form-floating mb-3">
                                    <input class="form-control" id="name" type="text" data-sb-validations="required" />
                                    <label for="name">새 비밀번호 확인</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">비밀번호를 확인해주세요.</div>
                                </div>
                                <button class="btn button-pink col-xl-12" style="height: 50px; color: white;"> 비밀번호 변경 </button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


        <!-- jQuery 라이브러리 추가(CDN) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
          <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

        <script>

            const checkObj = { 
                "memberEmail"     : false,
            };

            const memberEmail = document.getElementById("name");
            const emailMsg = document.getElementById("checkEmail");
            const sendBtn = document.getElementById("sendBtn");
            const cMessage = document.getElementById("cMessage");
            const cNum = document.getElementById("cNum");
            const cNumCheck = document.getElementById("cNumCheck");

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

                            cNum.style.display="block";
                            sendBtn.style.display="block";
                            cNumCheck.style.display="block";

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



            sendBtn.addEventListener("click",function(){
                
               $.ajax({
                    url : "myPage/SendEmail",
                    data : {"memberEmail" : memberEmail.value},
                    type : "GET",
                    success : function(result){

                         console.log("이메일 발송 성공");
                        console.log(result);

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



        </script>
    </body>
</html>
