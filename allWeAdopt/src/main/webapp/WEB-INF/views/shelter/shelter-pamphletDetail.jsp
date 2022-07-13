<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="shelter" items="${list}">
    <c:if test="${desertionNo == shelter.desertionNo}">
        <c:set var="careNm" value="${shelter.careNm}"/>
        <c:set var="careTel" value="${shelter.careTel}"/>
        <c:set var="noticeSdt" value="${shelter.noticeSdt}"/>
        <c:set var="noticeEdt" value="${shelter.noticeEdt}"/>
        <c:set var="popfile" value="${shelter.popfile}"/>
        <c:set var="happenDt" value="${shelter.happenDt}"/>
        <c:set var="happenPlace" value="${shelter.happenPlace}"/>
        <c:set var="colorCd" value="${shelter.colorCd}"/>
        <c:set var="age" value="${shelter.age}"/>
        <c:set var="weight" value="${shelter.weight}"/>
        <c:set var="processState" value="${shelter.processState}"/>
        <c:set var="specialMark" value="${shelter.specialMark}"/>
        <c:set var="careAddr" value="${shelter.careAddr}"/>
        <c:set var="kindCd" value="${shelter.kindCd}"/>
        <c:set var="sexCd" value="${shelter.sexCd}"/>
    </c:if>    
</c:forEach>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ALL WE ADOPT</title>
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
        <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />


        <%-- 지도 --%>
        <%-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69933a089a5ecd291058167064475d66"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69933a089a5ecd291058167064475d66&libraries=services"></script> --%>


        <style>
            .nav-text-color{
                /* color: rgb(251, 131, 107); */
                color: black;
            }
           
            .secession-button{
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 5px;
            }
            .nav-text-color:hover {
                color: rgb(251, 131, 107);
            }
            .bg-pink {
            —bs-bg-opacity: 1;
            background-color: rgb(251, 131, 107);
            }


            .st0{fill:#373737;}
            .st1{fill:#FB836B;}
            .st2{fill:none;stroke:#373737;stroke-width:7.3;stroke-miterlimit:10;}

        </style>
    </head>

    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <!-- Navigation-->

            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5">
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <!-- 분양소 메인 로고 (클릭 시 최상위 주소) -->
                                <a href="#"><div class="col-lg-6 col-xl-7"><div class="bg-featured-blog" style="background-image: url('https://dummyimage.com/700x350/343a40/6c757d')"><img src="${contextPath}/resources/images/adopt-mainLogo.png" alt="main"></div></div></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold"></div>
                                    <div class="text-muted">${detail.phone}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1"></h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"></div>
                                    <div class="text-muted fst-italic mb-2"></div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">관심동물</a>
                                </header>
                                <!-- 유기동물 사진 -->
                                <figure class="mb-4"><img class="img-fluid rounded" src="" alt="..." /></figure>
                                <!-- Post content-->
                                <!-- 나중에 폰트 적용 해보기! -->
                                <section class="mb-5">
                                    <%-- <ul class="list-group list-group-flush">
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">성별 : ${sexCd}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">색깔 : ${colorCd}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">나이 : ${age}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">무게 : ${weight}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">상태 : ${processState}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">특징 : ${specialMark}</li>
                                        <li class="fs-5 mb-4 list-group-item" style="list-style-type:none">보호소 주소 : ${careAddr}</li>                                   
                                    </ul> --%>

                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">${detail.boardTitle}</div>
                                            
                                          </div>                                       
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">${detail.boardContent}</div>
                                           
                                          </div>                                        
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">종류</div>
                                           
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">성별</div>
                                            
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">색깔</div>
                                            
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">나이</div>
                                           
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">무게</div>
                                            
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">상태</div>
                                            
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">특징</div>
                                           
                                          </div>                                         
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-start">
                                          <div class="ms-2 me-auto">
                                            <div class="fw-bold">보호소 주소</div>
                                           
                                          </div>                                         
                                        </li>
                                    </ol>
                                                                                                
                                </section>
                            </article>

                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <%-- <script src="js/scripts.js"></script> --%>



        <script src="${contextPath}/resources/js/shelter.js"></script>



        
    </body>
    
</html>