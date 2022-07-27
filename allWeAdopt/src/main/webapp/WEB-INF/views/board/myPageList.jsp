<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/myPageList.css">
</head>
<body>
    <main>
        <!-- 헤더 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

         <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />

        <div class="container">
        <h3 style="font-weight: bolder; margin-top: 70px;">작성글 목록</h3>
        <p style="color: darkgrey; margin-bottom: 70px;">지금까지 작성한 글 목록을 조회합니다</p>
        <table class="table table-hover">
            <thead>
            <!-- 테이블 열 설정 -->
            <colgroup>
                <col width="20%" />
                <col width="60%" />
                <col width="20%" />
            </colgroup>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              <c:forEach var="boardList" items="${map.boardList}">
                <th scope="row">${boardList.boardNo}</th>

                <c:if test="${boardList.boardCode == '1'}">
                  <td>
                      <a class="aa" href="/allWeAdopt/shelter/pamphlet/detail/${boardList.boardNo}">${boardList.boardTitle}</a>
                  </td>               
                </c:if>

                <c:if test="${boardList.boardCode == '2'}">
                  <td>
                      <a class="aa" href="/allWeAdopt/board/detail/2/${boardList.boardNo}">${boardList.boardTitle}</a>
                  </td>        
                </c:if>
                
                
                <c:if test="${!empty boardList.updateDate}">
                <td>${boardList.updateDate}</td>
                </c:if>
                <c:if test="${empty boardList.updateDate}">
                <td>${boardList.createDate}</td>
                </c:if>
              </tr>
              </c:forEach>
            </tbody>
          </table> 
          <c:set var="pagination" value="${map.pagination}"/>
          <c:if test="${!empty map.boardList}">
            <div class="contentArea">
                <c:set var="url" value="boardList?cp="/>
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
</body>

</html>