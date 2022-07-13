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
    <%-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />        
    <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> --%>

    <!-- include summernote css/js-->
    <link href="${contextPath}/resources/summernote/summernote-lite.min.css" rel="stylesheet">
    <script src="${contextPath}/resources/summernote/summernote-lite.min.js"></script>

  </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />


            <section class="py-5">
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
            </section>

           
            <!-- About section two-->
            <section class="py-0">
                <div class="container px-3 my-1">
                    <div class="row gx-5 align-items-center">

                        <div class="md-10"></div>

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput3" class="form-label">제목</label>
                            <input type="email" class="form-control" id="exampleFormControlInput3" placeholder="전단지 제목"  >
                        </div>

                        <div class="md-10"></div>

                        <div class="mb-3 mt-3">
                            <label for="exampleFormControlTextarea1" class="form-label">전단지 만들기</label>
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
        
        <script src="${contextPath}/resources/js/shelter.js"></script>

    </body>
</html>
