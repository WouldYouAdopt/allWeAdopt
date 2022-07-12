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
        
        <!-- summer note -->
        <%-- <script src="${contextPath}/resources/summernote/summernote-lite.min.js"></script>
        <script src="${contextPath}/resources/summernote/lang/summernote-ko-KR.min.js"></script>
        <link rel="stylesheet" href="${contextPath}/resources/summernote/summernote-lite.min.css">

        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> --%>

        <%-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> --%>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

        
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
                        <form action="${contextPath}/admin/notice/write" method="post">
                            <div class="md-10"></div>

                            <div class="col-md-5 col-sm-6 mt-3">
                                <label for="exampleFormControlInput3" class="form-label">게시글 제목</label>
                                <input type="text" name="boardTitle" class="form-control" id="exampleFormControlInput3" placeholder="게시글의 제목을 입력하세요..."  >
                            </div>

                            <div class="md-10"></div>

                            <div class="col-md-5 col-sm-6 mt-3">
                                <label for="exampleFormControlInput1" class="form-label">작성자</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="관리자" readonly >
                            </div>

                            <div class="md-10"></div>

                            <div class="mb-3 mt-3">
                                
                                    <label for="exampleFormControlTextarea1" class="form-label">문의내용 작성</label>
                                    <textarea id="summernote" name="boardContent"></textarea>    
                                    <button class="btn btn-primary mt-3 button-pink">등록</button>
                                
                            </div>
                        </form>
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
        <script>
            const contextPath = "${contextPath}";
        </script>
        <!-- 썸머노트 -->
        <script>
            $(document).ready(function() {
                //여기 아래 부분
                $('#summernote').summernote({
                    placeholder: '내용.',
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

        <%-- <script src="${contextPath}/resources/summernote/summernote-lite.min.js.map"></script> --%>

        <script src="${contextPath}/resources/js/board/summerNote.js"></script>

    </body>
</html>
