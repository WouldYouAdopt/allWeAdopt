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
    
        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- 헤더 -->
            <c:if test="${empty adminMember}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <c:set var="url" value="../board/detail/2/"/>
            </c:if>
            <c:if test="${!empty adminMember}">
                <header>
                    <nav class="navbar navbar-expand-lg navbar-light bg-white" style="border-bottom: 1px solid;">
                        <div class="container px-5">
                            <a class="navbar-brand pt-1" href="${contextPath}/admin/main">
                                <img src="${contextPath}/resources/images/올위어답터 로고_관리자.png" id="adminLogo">
                            </a>
                            
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ms-auto  my-2 mb-2 mb-lg-0">
                                    <li class="nav-item"><a class="nav-link" href="${contextPath}/admin/board/user">게시판 관리</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${contextPath}/admin/funding/management">펀딩 관리</a></li>
                                    
                                    <li class="nav-item"><a class="nav-link" href="${contextPath}/admin/funding/delivery/${nowFundingNo}/1">주문 관리</a></li>
                                    
                                    <li class="nav-item"><a class="nav-link" href="${contextPath}/admin/ask/list">문의 관리</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${contextPath}/admin/notice/list">공지 관리</a></li>
                                                 
                                    <!-- 로그인 했을 때 -->
                                    <li class="nav-item dropdown" style="position:initial">
                
                                        <a class="nav-link dropdown-toggle py-1" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="${contextPath}/resources/images/흑백로고.png" id="member-profile" style="width : 35px; height : 35px;">	
                                        </a>
                
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio" style="right: 11%; height: 265px;">
                                            <li><a class="dropdown-item" href="${contextPath}/admin/board/user">게시판 관리</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/admin/funding/management">펀딩 관리</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/admin/funding/delivery//${nowFundingNo}/1">주문 관리</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/admin/ask/list">문의 관리</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/admin/notice/list">공지 관리</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/member/myPage/updateAdminPw">비밀번호 변경</a></li>
                                            <li><a class="dropdown-item" href="${contextPath}/member/logout">로그아웃</a></li>
                                        </ul>
                                        
                                    </li>
                
                                </ul>
                            </div>
                        </div>
                    </nav>
                
                </header>
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
                    <span id="initialization">초기화</span>
                    </form>

                    <!-- 게시글 작성 -->
                        <!-- 정상 조건 만족 시 -->
                        <c:if test="${!empty loginMember && loginMember.memberType!='A'}">
                            <p class="addBoard">게시글 작성하기</p>
                            <input type="hidden" name="registValue" value="0">
                        </c:if>
                        <!-- 로그인 하지 않았을 때 -->
                        <c:if test="${empty loginMember}">
                            <p class="addBoard">게시글 작성하기</p>
                            <input type="hidden" name="registValue" value="1">
                        </c:if>
                        <!-- 관리자 계정으로 로그인 했을 때 -->
                        <c:if test="${loginMember.memberType=='A'}">
                            <p class="addBoard">게시글 작성하기</p>
                            <input type="hidden" name="registValue" value="2">
                        </c:if>

                    <%-- 게시글 리스트 --%>
                    <c:if test="${empty boardList}">
                        <p class="noneText">일치하는 게시글이 없습니다</p>
                    </c:if>
                    <c:set var="test" value="0"/>
                    <c:forEach begin="0" end="${fn:length(boardList)}" step="3">
                        <div class="row gx-5" id="row">
                            <c:forEach var="boardList" items="${boardList}" begin="${test}" end="${test+2}">
                                <div class="col-lg-4 mb-5">
                                    <div class="card h-100 shadow border-0">
                                        <img class="card-img-top" src="${boardList.thumbnail}" alt="..." />
                                        <div class="card-body p-4">
                                            <div class="badge bg-primary bg-gradient rounded-pill mb-2 animal">${boardList.animalType}</div>
                                            <c:if test="${!empty boardList.animalDetail && boardList.animalDetail!='기타'}">
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
                                                   <c:if test="${boardList.memberTypes eq 'K'}">
                                                        <img class="rounded-circle me-3" src="${contextPath}/resources/images/user.png" alt="..." /> 
                                                    </c:if>
                                                    <c:if test="${boardList.memberTypes ne 'K'}">
                                                        <img class="rounded-circle me-3" src="${contextPath}${boardList.profileImage}" alt="..." /> 
                                                    </c:if>                                                
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
            const contextPath = "${contextPath}";
        </script>
        <!-- Core theme JS-->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="${contextPath}/resources/js/board/userBoardList.js"></script>
    </body>
</html>
