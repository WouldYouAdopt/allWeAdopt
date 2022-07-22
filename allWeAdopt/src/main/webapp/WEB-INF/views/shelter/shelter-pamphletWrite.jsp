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
    <title>전단지 만들기</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />

    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

    <!-- main css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

    <!-- include libraries(jQuery, bootstrap) -->
    <%-- <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script> --%>
    <%-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />        
    <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> --%>

    <!-- include summernote css/js-->
    <%-- <link href="${contextPath}/resources/summernote/summernote-lite.min.css" rel="stylesheet">
    <script src="${contextPath}/resources/summernote/summernote-lite.min.js"></script> --%>

    <!-- include libraries(jQuery, bootstrap) -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>      
    
    <!-- summer note -->

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

  </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />


            <%-- <section class="py-5">
                <div class="container px-5">
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <!-- 분양소 메인 로고 (클릭 시 최상위 주소) -->
                                <a href="${contextPath}"><div class="col-lg-6 col-xl-7"><div class="bg-featured-blog" style="background-image: url('https://dummyimage.com/700x350/343a40/6c757d')"><img src="${contextPath}/resources/images/adopt-mainLogo.png" alt="main"></div></div></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section> --%>

            <img src="${contextPath}/resources/images/Pet-Friendly.jpg" class="img-fluid" alt="...">

           
            <!-- About section two-->
            <section class="py-0">
              <form action="write" method="POST">
                  <div class="container px-3 my-1">
                      <div class="row gx-5 align-items-center">

                          <div class="md-10"></div>

                          <div class="col-md-5 col-sm-6 mt-3">
                              <label for="exampleFormControlInput3" class="form-label">제목</label>
                              <input type="text" name="boardTitle" class="form-control" id="exampleFormControlInput3" placeholder="전단지 제목" value="${detail.boardTitle}" >
                          </div>

                          <div class="md-10"></div>

                          <div class="mb-3 mt-3">
                              <label for="exampleFormControlTextarea1" class="form-label">전단지 만들기</label>
                              <textarea id="summernote" name="boardContent" >${detail.boardContent}</textarea>    


                              <button class="btn btn-primary mt-3 button-pink" type="submit">등록</button>

                                <!-- insert 모드 -->
                                <c:if test="${param.mode == 'insert'}">
                                  <button class="btn btn-primary mt-3 button-pink" id="goToListBtn">목록으로</button>
                                </c:if>

                                <!-- update 모드 -->
                                <c:if test="${param.mode == 'update'}">
                                    <button class="btn btn-primary mt-3 button-pink" type="button" onclick="location.href='${header.referer}'">이전으로</button>                           
                                </c:if>

                                <input type="hidden" name="mode" value="${param.mode}">

                                <!-- 게시글 번호 (커맨드 객체 BoardDetail.boardNo 세팅) -->
                                <input type="hidden" name="boardNo" value="${empty param.no ? 0 : param.no}">
                                
                                <!-- 현재 페이지 -->
                                <input type="hidden" name="cp" value="${param.cp}">
                          </div>

                      </div>
                  </div>
              
              </form>
            </section>

        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <script>
            const contextPath = "${contextPath}";
        </script>
        
        <!-- 썸머노트 -->
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({
                    placeholder: '반려동물 이름, 나이, 잃어버린 날짜, 특징, 잃어버린 장소, 반려동물 사진 순으로 작성해주세요',
                    tabsize: 2,
                    height: 350,
                    toolbar: [
                        // [groupName, [list of button]]
                        ['fontname', ['fontname']],
                        ['fontsize', ['fontsize']],
                        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                        ['color', ['forecolor','color']],
                        // ['table', ['table']],
                        // ['para', ['ul', 'ol', 'paragraph']],
                        // ['height', ['height']],
                        ['insert',['picture','link']],
                        // ['view', ['fullscreen', 'help']]
                    ],
                    callbacks:{
                        onImageUpload: function(files, editor) {
                            // 업로드된 이미지를 ajax를 이용하여 서버에 저장
                            console.log("이미지 업로드됨");
                            console.log(files);
                            sendFile(files[0], this);
                        }
                    }
                });
            });
        </script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
       
		    <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        
        <script src="${contextPath}/resources/js/shelter.js"></script>

        <script src="${contextPath}/resources/js/board/summerNote.js"></script>

    </body>
</html>
