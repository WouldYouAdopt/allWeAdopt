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
        <title>관리자 - 공지사항 작성</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- include libraries(jQuery, bootstrap) -->
        <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<%--    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />        
        <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> --%>
    
        <!-- include summernote css/js-->
        <link href="${contextPath}/resources/summernote/summernote-lite.min.css" rel="stylesheet">
        <script src="${contextPath}/resources/summernote/summernote-lite.min.js"></script>
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

            <!-- Header-->
            <header class="py-3">
                <div class="container px-3">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-left my-5">
                                <h2 class="fw-bolder mb-3">공지사항 글작성</h2>
                                <p class="lead fw-normal text-muted mb-2" style="font-size: 14px;">공지사항을 작성해주세요. </p>
                            </div>
                        </div>
                </div>
            </header>
           
            <!-- About section two-->
            <section class="py-0">
                <div class="container px-3 my-1">
                    <div class="row gx-5 align-items-center">

                        <div class="md-10"></div>

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput3" class="form-label">게시글 제목</label>
                            <input type="email" class="form-control" id="exampleFormControlInput3" placeholder="게시글의 제목을 입력하세요..."  >
                        </div>

                        <div class="md-10"></div>

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput1" class="form-label">작성자</label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="관리자" readonly >
                        </div>

                        <div class="md-10"></div>

                        <div class="mb-3 mt-3">
                            <label for="exampleFormControlTextarea1" class="form-label">문의내용 작성</label>
                            <textarea id="summernote" name="editordata"></textarea>    
                            <button class="btn btn-primary mt-3 button-pink" type="submit">등록</button>
                        </div>

                    </div>
                </div>
            </section>

        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
       
		<!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        
        <!-- 썸머노트 -->
        <script>
            $('#summernote').summernote({
              placeholder: '문의내용을 입력해주세요.',
              tabsize: 2,
              height: 350,
              toolbar: [
                    // [groupName, [list of button]]
                    // ['fontname', ['fontname']],
                    // ['fontsize', ['fontsize']],
                    // ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    // ['color', ['forecolor','color']],
                    // ['table', ['table']],
                    // ['para', ['ul', 'ol', 'paragraph']],
                    // ['height', ['height']],
                    ['insert',['picture','link','video']],
                    // ['view', ['fullscreen', 'help']]
                ],
                // fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                // fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
            });

          </script>

    </body>
</html>
