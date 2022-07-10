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
        <title>관리자 - 공지 상세</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
        
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
                                <h2 class="fw-bolder mb-3">입양관련 공지입니다.</h2>
                                <div class="text-muted  mb-2">2022.07.04</div>
                                
                                <!-- <div class="col-md-5 col-sm-6 mt-3">
                                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="관리자" readonly >
                                </div>
                                
                                <div class="md-10"></div> -->
                               
                            </div>
                        </div>
                </div>
            </header>
            

            <!-- About section two-->
            <section class="py-0 mb-5" >
                <div class="container px-3 my-1">
                    <div class="row gx-5 align-items-center mb-3">

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput1" class="form-label">작성자</label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="관리자" readonly >
                        </div>

                        <div class="mb-3 mt-3">
                            <div class="card bg-white">
                                <div class="card-body">
                                    <div class="fs-6  ">
                                        내용입니다.<br>
                                        내용입니다.<br>
                                        내용입니다.<br>
                                        내용입니다.<br>
                                        내용입니다.<br>
                                        내용입니다.<br>
                                        내용입니다.<br>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        
                    </div>

                </div>

                <!-- 버튼 영역 -->
                <div class="container px-2 my-1 d-flex justify-content-end">
                    <a class="btn btn-primary mt-3 mx-3 button-pink" href="${contextPath}/admin/notice/write">수정</a>
                    <a class="btn btn-primary mt-3 button-pink" href="${contextPath}/admin/notice/delete">삭제</a>
                </div>
            </section>

        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
    </body>
</html>
