<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.util.Calendar" %>

<%
  String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
  String Today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>

<!-- 오늘 날짜 변수에 저장 -->
<c:set value="<%=Date%>" var="today" />

<!-- map에 저장된 값을 각각 변수에 저장 -->
<c:set var="pagination" value="${map.pagination}" />
<c:set var="aList" value="${map.aList}" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>공지사항</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <style>
        .new{
            background-color: rgb(251, 131, 107);
            color : white;
            font-size : 8px;
            font-weight : bold;
            border-radius : 5px;
            padding : 0px 3px;
            margin: auto 4px;
            text-align : center;
        }

        .newa{
            display: flex;
        }
        </style>
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <c:if test="${loginMember.memberType =='M' || loginMember.memberType == 'K'}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />
            </c:if>
            <c:if test="${loginMember.memberType =='A'}">
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
            </c:if>

            <!-- Header-->
            <header class="py-3">
                <div class="container px-3">
                    <div class="col-lg-8 col-xxl-6">
                        <div class="text-left mt-5">
                            <h2 class="fw-bolder mb-3">문의사항</h2>
                            <p class="lead fw-normal text-muted mb-2" style="font-size: 14px;">All We Adopt의 문의사항을 확인해주세요!</p>
                        </div>
                    </div>
                </div>
            </header>
           
            <!-- About section two-->
            <section class="py-0">
                <div class="container px-5 my-1">
                    <div class="row gx-5 align-items-start" >

                        <c:if test="${empty aList}">
                            <div>게시글이 없습니당. </div>
                        </c:if>
                        <c:if test="${!empty aList}">

                        <table class="table boardList">
                            <thead >
                            <tr>
                                <th scope="col" class="col-sm-1 text-center" >번호</th>
                                <th scope="col">문의유형</th>
                                <th scope="col" class="col-sm-6">제목</th>
                                <th scope="col" >작성일</th>
                                <th scope="col" class="col-sm-1 ">처리상태</th>
                            </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="a" items="${aList}">
                                <c:if test="${loginMember.memberType =='M' || loginMember.memberType == 'K'}">
                                    <c:set var="url" value="${contextPath}/member/myPage/notice/detail/${n.boardNo}?cp=${pagination.currentPage}" />
                                </c:if>
                                <c:if test="${loginMember.memberType =='A'}">
                                    <c:set var="url" value="${contextPath}/admin/notice/detail/${a.boardNo}?cp=${pagination.currentPage}"/>
                                </c:if>


                                 <c:choose>
                                    <c:when test="${ a.boardPeriod == today }"> 
                                        <tr>
                                            <th scope="row" class="col-sm-1 text-center" >${a.boardNo}</th>
                                            <td><a href="${url}" class="newa">${a.boardTitle} <div class="new">N</div></a></td>
                                            <td>${a.createDate}</td>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <th scope="row" class="col-sm-1 text-center" >${a.boardNo}</th>
                                            <td><a href="${url}">${a.category}</a></td>
                                            <td><a href="${url}">${a.boardTitle}</a></td>
                                            <td>${a.createDate}</td>
                                            <td>답변중</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                                <tr>
                                    <th scope="row" class="col-sm-1 text-center" >${a.boardNo}</th>
                                    <td>회원정보 문의</td>
                                    <td><a href="${contextPath}/member/myPage/ask/detail">입양관련 문의사항 입니다.</a></td>
                                    <td>yyyy.mm.dd</td>
                                    <td>답변중</td>
                                </tr>


                              </c:forEach>
                            </tbody>
                        </table>

                        </c:if>
                    </div>
                </div>
            </section>
           
            <section class="py-0">
                <div class="container px-4 my-1 mb-5">

                    <div class="row gx-5 d-flex">

                        <nav aria-label="Page navigation example">
                            <ul class=" pagination">

                                <c:set var="url" value="${contextPath}/member/myPage/ask/list?cp="/>

                                <li class="page-item"><a class="page-link nav-text-color" href="${url}${pagination.prevPage}">Previous</a></li>

                                <!-- 범위가 정해진 일반 for문 사용 -->
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                    <c:choose>
                                        <c:when test="${i == pagination.currentPage}">
                                            <li class="page-item current"><a class="page-link nav-text-color">${i}</a></li>
                                        </c:when>

                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link nav-text-color" href="${url}${i}">${i}</a></li>     
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                                <li class="page-item"><a class="page-link nav-text-color" href="${url}${pagination.nextPage}">Next</a></li>


                                <c:if test="${loginMember.memberType =='K' || loginMember.memberType =='M' }">
                                    <div class="mx-auto"></div>
                                    <li><a class="btn btn-primary button-pink mx-auto" href="${contextPath}/member/myPage/ask/write">문의글 작성</a></li>
                                </c:if>
                            </ul>
                        </nav>

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
    </body>
</html>
