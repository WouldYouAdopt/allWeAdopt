<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pamphletList" value="${map.pamphletList}"/>
<c:set var="pagination" value="${map.pagination}" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>스토리 목록</title>
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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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


            <img src="${contextPath}/resources/images/Pet-Friendly.jpg" class="img-fluid" alt="...">


            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">스토리</h2>
                                <p class="lead fw-normal text-muted mb-5">헹복한 아이들의 일상을 공유해주세요</p>
                            </div>
                        </div>
                    </div>

                    
                    <div class="row gx-5">
                        <c:forEach var="pamphlet" items="${pamphletList}">

                        

                            <div class="col-lg-4 mb-5">
                                <div class="card h-100 shadow border-0">
                                  
                                    <c:if test="${!empty pamphlet.thumbnail}">
                                        <img class="card-img-top" src="${pamphlet.thumbnail}" alt="썸네일" id="thumbnail" style="height: 375px; width: 375px;" />
                                    </c:if>

                                    <%-- <c:if test="${empty pamphlet.thumbnail}">
                                         <img class="card-img-top" src="${contextPath}/resources/images/pamphlet-noImage.jpg" alt="썸네일" id="thumbnail" />
                                    </c:if> --%>

                                    <div class="card-body p-4"  id="content">
                                        <span class="badge" style="background-color: #FB836B; font-size: 13px; margin-bottom: 10px; margin-bottom: 10px;" >New</span>

                                        <a class="text-decoration-none link-dark stretched-link" href="../pamphlet/detail/${pamphlet.boardNo}?cp=${pagination.currentPage}"><h5 class="card-title mb-3">${pamphlet.boardTitle}</h5></a>
                                        <%-- <p class="card-text mb-0">${pamphlet.boardContent}</p> --%>
                                    </div>
                                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                        <div class="d-flex align-items-end justify-content-between">
                                            <div class="d-flex align-items-center">

                                                <%-- 프로필 이미지 --%>
                                                <c:if test="${empty loginMember.profileImage }">
                                                    <img src="${contextPath}/resources/images/user.png" id="member-profile" style="width : 35px; height : 35px; ">	
                                                </c:if>     

                                                <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'K'}">
                                                    <img src="${loginMember.profileImage}" id="member-profile" style="width : 35px; height : 35px; border:0.5px solid #ccc; border-radius:50%;">
                                                </c:if>

                                                <%-- 사용자 설정 프로필이미지 --%>
                                                <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'M'}">
                                                    <img src="${contextPath}/${loginMember.profileImage}" id="member-profile" style="width : 35px; height : 35px; ">
                                                </c:if>
                                                <%-- <img class="rounded-circle me-3" src="${pamphlet.profileImage}" alt="..." /> --%>

                                                <div class="md-10" style="margin:10px;"></div>

                                                <div class="small">
                                                    <div class="fw-bold">${pamphlet.memberName}</div>
                                                    <div class="fw-bold">${pamphlet.phone}</div>
                                                    <div class="text-muted">${pamphlet.createDate}</div>
                                                </div>

                                                <div class="md-10" style="margin:20px;"></div>
                            
                                                <button type="button" class="btn btn-primary" style="color: #FB836B; border: 2px solid #FB836B; background-color: white; border-radius:50%;" id="rArea">
                                                    <span class="badge text-bg-secondary" style="color: #FB836B; font-weight: bold;">${pamphlet.replyCount}</span>
                                                </button>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    
                    <%-- goTotop  --%>
                    <%-- <div class="position-relative">
                        <div class="position-absolute top-100 start-100 translate-middle">
                            <a href="#" id="toTop" style="display:scroll; position:fixed; left:30px; rigit: 50px; bottom: 10px; title=top"><h3><i class="bi bi-arrow-up-circle bt_top" style="color: #FB836B;"></i></h3></a>
                        </div>
                    </div> --%>

                    <%-- <a id="toTop" href="#">TOP</a> --%>

                    <button onclick="topFunction()" id="myBtn" title="Go to top"><h3><i class="bi bi-arrow-up-circle bt_top" style="color: #FB836B;"></i></h3></button>



                    <c:if test="${!empty loginMember}">       
                        <button type="button" class="btn btn-outline-warning" id="allButton" onclick="location.href='../pamphlet/write?mode=insert&cp=${pagination.currentPage}'">글쓰기</button>
                    </c:if>

                    <c:if test="${empty loginMember}">
                        <button type="button" class="btn btn-outline-warning" id="allButton" name="writeBtn" onclick="location.href='../../member/login'" >글쓰기</button>    
                    </c:if>

                    <%-- 페이지네이션 --%>
                    <c:set var="url" value="?cp="/>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <%-- 첫 페이지 --%>
                            <li class="page-item">
                                <a class="page-link" href="${url}1${sURL}" aria-label="Previous" style="color:gray;">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                <%-- <c:choose>
                                    <c:when test="${i == pagination.currentPage}">
                                        <li class="page-item"><a class="page-link">${i}</a></li>
                                    </c:when>

                                    <c:otherwise>
                                        <li class="page-item"><a href="${url}${i}${sURL}">${i}</a></li>        
                                    </c:otherwise>
                                </c:choose> --%>
                                <li class="page-item"><a class="page-link" style="color:gray;" href="${url}${i}">${i}</a></li>
                            </c:forEach>
                            
                            <%-- 끝 페이지 --%>
                            <li class="page-item">
                                <a class="page-link" href="${url}${pagination.maxPage}${sURL}" aria-label="Next" style="color:gray;">
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
        <%-- <script src="js/scripts.js"></script> --%>

        <script src="${contextPath}/resources/js/shelter.js"></script>

      
    </body>
</html>