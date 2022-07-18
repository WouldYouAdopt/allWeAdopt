<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


        <link href="${contextPath}/resources/css/shelter/shelter-main.css" rel="stylesheet" />

        

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

            <!-- header -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <%-- 검색을 진행한 경우 key, query를 쿼리스트링 형태로 저장한 변수 생성 --%>


            <!-- nav -->

            <!-- Page Content-->
            <!-- 메인 로고 부분(사진 끝에 흰거 나중에 여쭙기) -->
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

            <!-- 분앙소 불러오기 -->
            <c:set var="upkind" value="?pageNo=&upkind="/>
            <c:set var="upr_cd" value="?pageNo=&upr_cd="/>


            <section class="py-5">
                <div class="container px-5">
                    <h2 class="fw-bolder fs-5 mb-4">보호소</h2>
                    <div class="row gx-5">

                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="true" style="background-color: #FB836B; border: 0;">
                            <strong>시도</strong>
                        </button>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="${upr_cd}" role="option" aria-selected="true">전체</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6110000" role="option" aria-selected="true">서울특별시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6260000" role="option" aria-selected="true">부산광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6270000" role="option" aria-selected="true">대구광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6280000" role="option" aria-selected="true">인천광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6290000" role="option" aria-selected="true">광주광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}5690000" role="option" aria-selected="true">세종특별자치시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6300000" role="option" aria-selected="true">대전광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6310000" role="option" aria-selected="true">울산광역시</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6410000" role="option" aria-selected="true">경기도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6420000" role="option" aria-selected="true">강원도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6430000" role="option" aria-selected="true">충청북도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6440000" role="option" aria-selected="true">충청남도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6450000" role="option" aria-selected="true">전라북도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6470000" role="option" aria-selected="true">경상북도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6480000" role="option" aria-selected="true">경상남도</a></li>
                            <li><a class="dropdown-item" href="${upr_cd}6500000" role="option" aria-selected="true">제주특별자치도</a></li>
                        </ul>

                        <button class="btn btn-secondary dropdown-toggle btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #FB836B; border: 0;">
                            <strong>품종</strong>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="${upkind}" role="option" aria-selected="true">전체</a></li>
                            <li><a class="dropdown-item" href="${upkind}417000" role="option" aria-selected="true">개</a></li>
                            <li><a class="dropdown-item" href="${upkind}422400" role="option" aria-selected="true">고양이</a></li>
                        </ul>

                        <div class="md-10" style="margin:10px;"></div>

                    </div>

                        <c:forEach var="shelter" items="${list}">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="${shelter.popfile}" alt="썸네일" id="thumbnail" />
                                <div class="card-body p-4">
                                    <h5><span class="badge bg-secondary">New</span></h5>
                                    <%-- <h5 ><div class="badge bg-primary bg-gradient rounded-pill mb-2" >New</div></h5> --%>
                                        <a class="text-decoration-none link-dark stretched-link" href="../shelter/shelterDetail/${shelter.desertionNo}" >
                                            <li class="h5 card-title mb-3">종류 : ${shelter.kindCd}</li>
                                            <li class="h5 card-title mb-3">발견 날짜 : ${shelter.happenDt}</li>
                                            <li class="h5 card-title mb-3">발견 장소 : ${shelter.happenPlace}</li>

                                        </a>
                                    </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <%-- <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." /> --%>
                                            <img src="${contextPath}/resources/images/user.png" id="member-profile" style="width : 35px; height : 35px; ">	
                                            <div class="small">
                                                <div class="fw-bold">보호소 : ${shelter.careNm}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </c:forEach>
                    </div>                         



                    <%-- 페이지네이션 --%>
            <%-- <c:choose>
                <c:when test="${!empty upr_cd}">
                    <c:set var="url" value="?upr_cd=&pageNo="/>
                </c:when>

                <c:when test='${!empty upkind}'>
                    <c:set var="url" value="?upkind=&pageNo="/>
                </c:when>

                <c:otherwise>
                    <c:set var="url" value="?upr_cd=&upkind=&pageNo="/>
                </c:otherwise>
            </c:choose> --%>

                    
                    <%-- <c:set var="url" value="?upr_cd=&pageNo="/> --%>
                    <%-- <c:set var="upkind" value="&upkind="/> --%>
                    <%-- <c:set var="url" value="?upr_cd=&upkind=&pageNo="/> --%>




                    <%-- <c:choose>
                    
                        <c:when test="${empty upr_cd}">
                            <c:set var="url" value="?upkind=&pageNo="/>
                        </c:when>

                        <c:when test="${empty upkind}">
                            <c:set var="url" value="?upr_cd=&pageNo="/>
                        </c:when>

                        <c:when test="${empty upr_cd} && ${empty upkind}">
                            <c:set var="url" value="?pageNo="/>
                        </c:when>
                    
                    </c:choose> --%>

                    <%-- <c:set var="url" value="?pageNo="/> --%>

                    <c:set var="url" value="?pageNo="/>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="${url}1${sURL}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="10" step="1">
                                <li class="page-item"><a class="page-link" href="${url}${i}">${i}</a></li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${url}10${sURL}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>

                </div>
            </section>
        </main>
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


        <!-- jQuery 라이브러리 추가 -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

      
    </body>
    
</html>