<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardRegist</title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />

    <!-- 폰트어썸 (폰트)-->
    <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- 부트 스트랩 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/myPageLike.css">

    <!-- sweetalert-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</head>
<body>
    <main>
        <!-- 헤더 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

         <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />

        <div class="container">
        <h3 style="font-weight: bolder; margin-top: 70px;">관심목록</h3>
        <p style="color: darkgrey; margin-bottom: 70px;">관심동물로 등록한 게시글 목록을 조회합니다</p>
        <c:set var="boardList" value="${map.boardList}" />
            <%-- 게시글 리스트 --%>
                <div class="row gx-5 add" id="row">
                <c:if test="${empty boardList}">
                    <p class="noneList">등록하신 관심동물 목록이 없습니다</p>
                </c:if>
                    <c:forEach var="boardList" items="${boardList}">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="${boardList.thumbnail}" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2 animal">${boardList.animalType}</div>
                                    <c:if test="${!empty boardList.animalDetail && boardList.animalDetail!='기타'}}">
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
                                    <a class="text-decoration-none link-dark stretched-link" href="${contextPath}/board/detail/2/${boardList.boardNo}">
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
                </div>

          <c:set var="pagination" value="${map.pagination}"/>
          <c:if test="${!empty map.boardList}">
            <div class="contentArea">
                <c:set var="url" value="likeList?cp="/>
                    <section class="listArea">
                            <span><a href="${url}${pagination.prevPage}">&lt;</a></span>
                            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${i==pagination.currentPage}">
                                        <a href="${url}${i}" style="background-color: #FB836B; color: white;" class="listNumber"><span>${i}</span></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="listNumber" href="${url}${i}"><span>${i}</span></a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <span><a href="${url}${pagination.nextPage}">&gt;</a></span>
                    </section> 
            </div>
          </c:if>
          </div>

          
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
          
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <script src="${contextPath}/resources/js/board/myPageLike.js"></script>
</body>

</html>