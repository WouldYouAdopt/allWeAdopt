<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>

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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!-- main css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/board/userBoardList.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- 헤더 -->
            <c:if test="${empty adminMember}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <c:set var="url" value="../board/detail/2/"/>
            </c:if>
            <c:if test="${!empty adminMember}">
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
                <c:set var="url" value="${contextPath}/admin/board/detail/2/"/>
            </c:if>
          
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="${contextPath}/resources/images/userMain3.jpg" class="d-block w-100" alt="...">
                          </div>
                          <div class="carousel-item">
                            <img src="${contextPath}/resources/images/userMain2.jpg" class="d-block w-100" alt="...">
                          </div>
                          <div class="carousel-item">
                            <img src="${contextPath}/resources/images/userMain1.jpg" class="d-block w-100" alt="...">
                          </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      </div>
        
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                        <h2 class="titleText">사용자 게시판</h2>
                        <p class="subTitle">추억을 공유하거나 가족을 만드는 공간입니다</p>
                  
                    <!-- 검색 필터 영역 -->
                        <!-- 검색을 수행했을 시 검색창 유지-->
                        <c:if test="${displayValue==0}">
                            <c:set var="displayValues" value="0"/>
                        </c:if>
                        <c:if test="${displayValue==1}">
                            <c:set var="displayValues" value="1"/>
                        </c:if>
                    <form action="user" method="GET" onsubmit="return search()">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" style="margin-bottom:10px;" type="button" id="dropdownMenuButton2" onclick="searchDisplay()">
                        검색조건
                        </button>
                        <div class="search-area" id="search-area">
                            <div class="filter-area">상태 여부
                                <div class="btn-group dropend">
                                    <button type="button" name="categoryValue" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                      <c:if test="${empty searchList.category}">
                                        상태여부
                                      </c:if>
                                      <c:if test="${!empty searchList.category}">
                                        ${searchList.category}
                                      </c:if>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-item selectMenu">실종</li>
                                        <li class="dropdown-item selectMenu">보호</li>
                                        <li class="dropdown-item selectMenu">목격</li>
                                        <li class="dropdown-item selectMenu">완료</li>
                                    </ul>
                                    <input type="hidden" name="category">
                                </div>
                            </div>
                            <hr>
                            <div class="filter-area">공유 기간
                                <span class="dateFilter">
                                    <c:if test="${!empty searchList.boardPeriod}">
                                       <c:set var="periodValue" value="${searchList.boardPeriod}"/> 
                                    </c:if>
                                    <c:if test="${!empty searchList.boardPeriod2}">
                                       <c:set var="periodValue2" value="${searchList.boardPeriod2}"/> 
                                    </c:if>
                                    <input class="dateValue" name="boardPeriod" type="date" value="${periodValue}"> ~ 
                                    <input class="dateValue" name="boardPeriod2" type="date" value="${periodValue2}">
                                </span>
                            </div>
                            <hr>
                            <div class="filter-area">지역
                                <div class="btn-group dropend">
                                    <button type="button" name="areaValue" class="btn aa btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                      <c:if test="${empty searchList.area}">
                                        지역선택
                                      </c:if>
                                      <c:if test="${!empty searchList.area}">
                                        ${searchList.area}
                                      </c:if>
                                    </button>
                                    <ul class="dropdown-menu">
                                       <c:forEach var="areaList" items="${areaList}">
                                            <li class="dropdown-item selectMenu areaList">${areaList.area}</li>
                                        </c:forEach>
                                    </ul>
                                    <input type="hidden" name="area">
                                    <button type="button" name="areaDetailValue" onclick="areaDetailFunc()" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                      <c:if test="${empty searchList.areaDetail}">
                                        상세지역 선택
                                      </c:if>
                                      <c:if test="${!empty searchList.areaDetail}">
                                        ${searchList.areaDetail}
                                      </c:if>
                                    </button>
                                      <ul class="dropdown-menu">
                                         
                                      </ul>
                                    <input type="hidden" name="areaDetail">
                                </div>
                            </div>
                            <hr>
                            <div class="filter-area">종류
                                <div class="btn-group dropend">
                                    <button type="button" name="animalTypeValue" class="btn aa btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                      <c:if test="${empty searchList.animalType}">
                                        축종
                                      </c:if>
                                      <c:if test="${!empty searchList.animalType}">
                                        ${searchList.animalType}
                                      </c:if>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-item selectMenu animalList">개</li>
                                        <li class="dropdown-item selectMenu animalList">고양이</li>
                                        <li class="dropdown-item selectMenu animalList">기타</li>
                                    </ul>
                                    <input type="hidden" name="animalType">
                                    <button type="button" name="animalDetailValue" onclick="animalDetailFunc()" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                      <c:if test="${empty searchList.animalDetail}">
                                        품종
                                      </c:if>
                                      <c:if test="${!empty searchList.animalDetail}">
                                        ${searchList.animalDetail}
                                      </c:if>
                                    </button>
                                      <ul class="dropdown-menu">
                                          
                                      </ul>
                                    <input type="hidden" name="animalDetail">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="searchBtn" id="searchBtn">검색하기</button>
                    </form>

                    <!-- 게시글 작성 -->
                    <c:if test="${!empty loginMember && loginMember.memberType!='A'}">
                        <a href="user/boardRegist"><p class="addBoard">게시글 작성하기</p></a>
                    </c:if>

                    <c:if test="${empty boardList}">
                        <p class="noneText">일치하는 게시글이 없습니다</p>
                    </c:if>
                    <%-- 게시글 리스트 --%>
                    <c:set var="test" value="0"/>
                    <c:forEach begin="0" end="${fn:length(boardList)}" step="3">
                        <div class="row gx-5" id="row">
                            <c:forEach var="boardList" items="${boardList}" begin="${test}" end="${test+2}">
                                <div class="col-lg-4 mb-5">
                                    <div class="card h-100 shadow border-0">
                                        <img class="card-img-top" src="${boardList.thumbnail}" alt="..." />
                                        <div class="card-body p-4">
                                            <div class="badge bg-primary bg-gradient rounded-pill mb-2 animal">${boardList.animalType}</div>
                                            <c:if test="${!empty boardList.animalDetail}">
                                                <div class="badge bg-primary bg-gradient rounded-pill mb-2 animal-detail">${boardList.animalDetail}</div>
                                            </c:if>
                                            <div class="badge bg-primary bg-gradient rounded-pill mb-2 gender">
                                                <c:choose>
                                                    <c:when test="${boardList.gender eq 'M'}">
                                                        수컷
                                                    </c:when>
                                                    <c:otherwise>
                                                        암컷
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <c:if test="${boardList.neutering eq 'Y'}">
                                                <div class="badge bg-primary bg-gradient rounded-pill mb-2 neutering">
                                                        중성화
                                                </div>
                                            </c:if>
                                            
                                            <a class="text-decoration-none link-dark stretched-link" href="${url}${boardList.boardNo}">
                                                <h5 class="card-title mb-3"><span class="category">${boardList.category}</span>${boardList.boardTitle}</h5>
                                            </a>
                                        </div>
                                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                            <div class="d-flex align-items-end justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="rounded-circle me-3" src="/allWeAdopt${boardList.profileImage}" alt="..." />
                                                    <div class="small">
                                                        <div class="fw-bold">${boardList.memberName}</div>
                                                        <div class="text-muted">
                                                            <c:if test="${empty boardList.updateDate}">
                                                                ${boardList.createDate} &middot; <span class='diffTime'>${boardList.diff}</span>
                                                            </c:if>
                                                             <c:if test="${!empty boardList.updateDate}">
                                                                ${boardList.updateDate} &middot; <span class='diffTime'>${boardList.diff2}</span>
                                                            </c:if>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:set var="test" value="${test+3}"/>
                        </div>
                    </c:forEach>

                    <!-- 로딩 아이콘 -->
                    <div class="spinner-area">
                         <div class="spinner-border text-danger" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                   
                </div>
            </section>
        </main>
        <div class="footer-area">
            <!-- 푸터 -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        </div>
        <script>
            // 검색 후 검색창이 열려있게 변수 설정
            const displayValue = ${displayValues};
        </script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="${contextPath}/resources/js/board/userBoardList.js"></script>
    </body>
</html>
