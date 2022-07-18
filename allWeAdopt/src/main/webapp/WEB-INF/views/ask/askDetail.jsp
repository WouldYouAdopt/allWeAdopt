<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.util.Calendar" %>
<%-- <%
  String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
  String Today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%> --%>

<%-- <!-- 오늘 날짜 변수에 저장 -->
<c:set value="<%=Date%>" var="today" />

<!-- map에 저장된 값을 각각 변수에 저장 -->
<c:set var="pagination" value="${map.pagination}" />
<c:set var="nList" value="${map.nList}" /> --%>

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
                            <div class="text-left my-4">
                                <h2 class="fw-bolder mb-3">문의한 글 제목</h2>
                                <div class="text-muted  mb-2">2022.07.04</div>
                                
                                <div class="col-md-5 col-sm-6 mt-3">
                                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="김주에" readonly >
                                </div>
                                
                                <div class="md-10"></div>
                                
                                <div class="col-md-5 col-sm-6 mt-3">
                                    <label for="exampleFormControlInput2" class="form-label">이메일</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="김주에@naver.com(시간나면하도록)"  readonly>
                                </div>
                               
                            </div>
                        </div>
                </div>
            </header>
            

            <!-- About section two-->
            <section class="py-0 mb-5" >
                <div class="container px-2 my-1">
                    <div class="row gx-5 align-items-center">

                        <div class="ms-3">
                            
                            <div class="card bg-white">
                                <div class="card-body">

                                    <!-- Post content-->
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
            </section>
           
            <!-- 댓글 -->
            <section class="py-0 " >
                <div class="container px-2 my-1 mt-3">
                    <div class="row gx-5 align-items-center">

                        <div class="ms-3">
                            
                            <div class="card bg-light">
                                <div class="card-body">

                                     <c:if test="${loginMember.memberType =='A' }">
                                        <!-- Comment form-->
                                        <div class="row g-2 mb-4 align-items-center">
                                            <div class="col-md-11 ">
                                                <textarea class="form-control" placeholder="관리자 로그인 일때만 보임." id="floatingTextarea" style="resize: none;"></textarea>
                                            </div>
                                            <div class="col-auto">
                                            <button type="submit" class="btn button-pink col-mb-1 btn-lg" style="color: white;">등록</button>
                                            </div>
                                        </div>
                                    </c:if>

                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3 ">
                                            <div class="col-lg-8  fw-bold">관리자</div>
                                                    <div class="col-sm-8 mb-1">
                                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                                    </div>
                                                     <c:if test="${loginMember.memberType =='A' }">
                                                        <div class="col-sm-6">
                                                            <button type="submit" class="btn btn-outline-secondary mb-2  btn-sm">수정</button>
                                                            <button type="submit" class="btn btn-outline-secondary mb-2 btn-sm">삭제</button>
                                                        </div>
                                                     </c:if> 
                                            </div>
                                    </div>
                                </div>

                                <c:if test="${loginMember.memberType =='A' }">
                                  <button type="submit" class="btn bg-pink mt-3" style="color : white; height : 50px" >해당 문의글 삭제(관리자)</button> 
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
           


        </main>

            <div class="mb-5"></div>
            <div class="mb-5"></div>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
    </body>
</html>