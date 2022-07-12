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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

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
            <form action="boardRegist" method="post">
            <!-- 카테고리 선택 메뉴 -->
            <div class="dropdown category-area">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="categoryValue">
                  카테고리를 선택해주세요
                </button>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                  <li class="dropdown-item selectMenu">실종</li>
                  <li class="dropdown-item selectMenu">보호</li>
                  <li class="dropdown-item selectMenu">목격</li>
                  <li class="dropdown-item selectMenu">완료</li>
                </ul>
                <input type="hidden" class="value" name="category">
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
                <textarea id="summernote" name="boardContent"></textarea>
            </div>

            <!-- 추가선택 사항 -->
            <div class="plusArea">
                <p class="menu">추가 선택사항</p>
                <hr>

                <!-- 날짜 -->
                <div class="dateArea">
                    <span class="select">날짜</span>
                    <input type="date" class="dateBtn" name="boardPeriod">
                     ~
                    <input type="date" class="dateBtn" name="boardPeriod2">
                    <p class="etc">(선택하지 않을 시 동물보호법에 의거하여 게시글 작성일로부터 7일 후까지의 기간이 등록됩니다)</p>
                </div>

                <!-- 지역 -->
                <div class="area">
                    <span class="select">지역</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="areaValue">
                          지역 선택
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">서울</li>
                          <li class="dropdown-item selectMenu">부산</li>
                          <li class="dropdown-item selectMenu">제주도</li>
                        </ul>
                        <input type="hidden" class="value" name="area">
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="areaDetailValue">
                          상세 지역 선택
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">은평구</li>
                          <li class="dropdown-item selectMenu">동대문구</li>
                          <li class="dropdown-item selectMenu">종로구</li>
                        </ul>
                        <input type="hidden" class="value" name="areaDetail">
                    </div>
                </div>
               
                <!-- 연락처 -->
                <div class="tel-area">
                    <span class="select">연락처</span>
                    <input type="tel" class="tel" name="phone">
                </div>
                <p class="etc">(-을 제외한 전화번호를 입력해주세요)</p>

                <!-- 종류, 품종 -->
                <div class="type-area">
                    <span class="select">품종</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="animalTypeValue">
                          축종
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">개</li>
                          <li class="dropdown-item selectMenu">고양이</li>
                          <li class="dropdown-item selectMenu">기타</li>
                        </ul>
                        <input type="hidden" name="animalType">
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="animalDetailValue">
                          품종
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">요크셔테리어</li>
                          <li class="dropdown-item selectMenu">러시안블루</li>
                          <li class="dropdown-item selectMenu">기타</li>
                        </ul>
                        <input type="hidden" name="animalDetail">
                    </div>
                </div>

                <!-- 성별 -->
                <div class="gender-area">
                    <span class="select">성별</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" name="genderValue">
                          수컷 / 암컷
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">수컷</li>
                          <li class="dropdown-item selectMenu">암컷</li>
                        </ul>
                        <input type="hidden" name="genders">
                    </div>
                </div>
                <!-- 중성화 -->
                <div class="neutering-area">
                    <span class="select">중성화</span>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false"  name="neuteringValue">
                          완료 / 미완료
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                          <li class="dropdown-item selectMenu">완료</li>
                          <li class="dropdown-item selectMenu">미완료</li>
                        </ul>
                        <input type="hidden" name="neuterings">
                    </div>
                </div>
            </div>

        </div>
            <!-- 등록 버튼 -->
            <div class="btn-area">
                <button class="btnRegist">등록</button>
            </div>
        </form>
        </div>
      <!-- 푸터 -->
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>
     <!-- Core theme JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/js/scripts.js"></script>
    <script src="${contextPath}/resources/js/board/userBoardRegist.js"></script>
    <script>
  //    $(document).ready(function() {

	// var toolbar = [
	// 	    // 글꼴 설정
	// 	    ['fontname', ['fontname']],
	// 	    // 글자 크기 설정
	// 	    ['fontsize', ['fontsize']],
	// 	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	// 	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	// 	    // 글자색
	// 	    ['color', ['forecolor','color']],
	// 	    // 표만들기
	// 	    ['table', ['table']],
	// 	    // 글머리 기호, 번호매기기, 문단정렬
	// 	    ['para', ['ul', 'ol', 'paragraph']],
	// 	    // 줄간격
	// 	    ['height', ['height']],
	// 	    // 그림첨부, 링크만들기, 동영상첨부
	// 	    ['insert',['picture','link','video']],
	// 	    // 코드보기, 확대해서보기, 도움말
	// 	    ['view', ['codeview','fullscreen', 'help']]
	// 	  ];

	// var setting = {
  //           height : 300,
  //           minHeight : null,
  //           maxHeight : null,
  //           focus : true,
  //           lang : 'ko-KR',
  //           toolbar : toolbar,
  //           //콜백 함수
  //           callbacks : { 
  //           	onImageUpload : function(files, editor, welEditable) {
  //           // 파일 업로드(다중업로드를 위해 반복문 사용)
  //           for (var i = files.length - 1; i >= 0; i--) {
  //           uploadSummernoteImageFile(files[i],
  //           this);
  //           		}
  //           	}
  //           }
  //        };
  //       $('#summernote').summernote(setting);
  //       });
        
  //       function uploadSummernoteImageFile(file, el) {
	// 		data = new FormData();
	// 		data.append("file", file);
	// 		$.ajax({
	// 			data : data,
	// 			type : "POST",
	// 			url : "uploadSummernoteImageFile",
	// 			contentType : false,
	// 			enctype : 'multipart/form-data',
	// 			processData : false,
	// 			success : function(data) {
  //          var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	// 				$(el).summernote("editor.insertImage", contextPath + data.url);
	// 			},
  //       error:function(request,status,error){
  //         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  //         }
	// 		});
	// 	}
    </script>

</body>

</html>