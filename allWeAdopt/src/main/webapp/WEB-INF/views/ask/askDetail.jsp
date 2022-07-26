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

        <%-- jQuery CDN --%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                                <h2 class="fw-bolder mb-3">${detail.boardTitle}</h2>
                                <div class="text-muted  mb-2"> [${detail.category}] 게시판의 문의입니다. | ${detail.createDate}</div>
                               
                                <div class="col-md-5 col-sm-6 mt-3">
                                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder=" ${detail.memberName} " readonly >
                                </div>
                                
                                <div class="md-10"></div>
                                
                                <!-- <div class="col-md-5 col-sm-6 mt-3">
                                    <label for="exampleFormControlInput2" class="form-label">이메일</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="김주에@naver.com(시간나면하도록)"  readonly>
                                </div> -->
                               
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
                                        ${detail.boardContent}
                                    </div> 


                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </section>
           
        <!-- 댓글 인클루드 -->
        <jsp:include page="/WEB-INF/views/ask/askReply.jsp" />

        </main>

            <div class="mb-5"></div>
            <div class="mb-5"></div>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>

        <script>
            const contextPath = '${contextPath}';
            const boardNo = '${boardNo}';
            const memberType = '${loginMember.memberType}';
            const loginMemberNo = "${loginMember.memberNo}";
        </script>

        <script src="${contextPath}/resources/js/board/notice.js"></script>
        <script src="${contextPath}/resources/js/board/reply.js"></script>
    </body>
</html>
