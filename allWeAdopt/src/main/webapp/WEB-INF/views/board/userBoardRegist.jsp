<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardRegist</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
    <!-- 폰트어썸 (폰트)-->
    <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

    <!-- 썸머노트 -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <!-- main css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/userBoardRegist.css">
</head>
<body>
    <main>
      <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div class="container">
            <h4>게시글 작성</h4>
            
            <!-- 카테고리 선택 메뉴 -->
            <div class="dropdown category-area">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                  카테고리를 선택해주세요
                </button>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                  <li class="dropdown-item">실종</li>
                  <li class="dropdown-item">보호</li>
                  <li class="dropdown-item">목격</li>
                  <li class="dropdown-item">완료</li>
                </ul>
            </div>
            
            <!-- 제목 -->
            <div class="titleArea">
                <p class="menu">제목</p>
                <hr>
                <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요">
            </div>

            <!-- 내용 -->
            <div class="contentArea">
                <p class="menu">내용</p>
                <hr>
                <div id="summernote"></div>
            </div>

            <!-- 추가선택 사항 -->
            <div class="plusArea">
                <p class="menu">추가 선택사항</p>
                <hr>

                <!-- 날짜 -->
                <div class="dateArea">
                    <span class="select">날짜</span>
                    <input type="date" class="dateBtn" name="startDate">
                     ~
                    <input type="date" class="dateBtn" name="endDate">
                    <p class="etc">(선택하지 않을 시 동물보호법에 의거하여 게시글 작성일로부터 7일 후까지의 기간이 등록됩니다)</p>
                </div>

                <!-- 지역 -->
                <div class="area">
                    <span class="select">지역</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          지역 선택
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">서울</li>
                          <li class="dropdown-item">부산</li>
                          <li class="dropdown-item">제주도</li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          상세 지역 선택
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">은평구</li>
                          <li class="dropdown-item">동대문구</li>
                          <li class="dropdown-item">종로구</li>
                        </ul>
                    </div>
                </div>
               
                <!-- 연락처 -->
                <div class="tel-area">
                    <span class="select">연락처</span>
                    <input type="tel" class="tel">
                </div>
                <p class="etc">(-을 제외한 전화번호를 입력해주세요)</p>

                <!-- 종류, 품종 -->
                <div class="type-area">
                    <span class="select">품종</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          축종
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">개</li>
                          <li class="dropdown-item">고양이</li>
                          <li class="dropdown-item">기타</li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          품종
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">요크셔테리어</li>
                          <li class="dropdown-item">러시안블루</li>
                          <li class="dropdown-item">기타</li>
                        </ul>
                    </div>
                </div>

                <!-- 성별 -->
                <div class="gender-area">
                    <span class="select">성별</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          남 / 여
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">남</li>
                          <li class="dropdown-item">여</li>
                        </ul>
                    </div>
                </div>
                <!-- 중성화 -->
                <div class="neutering-area">
                    <span class="select">중성화</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                          완료 / 미완료
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item">완료</li>
                          <li class="dropdown-item">미완료</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
            <!-- 등록 버튼 -->
            <div class="btn-area">
                <button class="btnRegist">등록</button>
            </div>
        </div>
      <!-- 푸터 -->
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>
    
    <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 500,
        lang : 'ko-KR'
      });
    </script>

     <!-- Core theme JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/js/scripts.js"></script>

</body>

</html>