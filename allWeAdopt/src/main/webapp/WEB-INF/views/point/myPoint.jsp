<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>내 포인트 조회</title>

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
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            .mb-5{
                margin-top: 20px;
            }
            .fa-paw{
                margin-bottom: 20px;
            }
            .pointWrapper{
                width: 800px;
                margin: auto;
            }
            .table-striped td h3{
                text-align: center;
                color: rgb(251, 131, 107);
            }
            tr th,td{
                text-align: center;
            }
            tr:nth-child(1){
                background-color: rgb(251, 131, 107);
            }
            tr:nth-child(1) th{
                color: white !important;
            }
            tr:nth-child(1) th:nth-child(1){width: 20%;}
            tr:nth-child(1) th:nth-child(2){width: 20%}
            tr:nth-child(1) th:nth-child(3){width: 20%}
        </style>

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5">


<%-- --------------------------------------------------------------------------------- --%>

                        <jsp:include page="/WEB-INF/views/common/point-header.jsp" />

                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">내 포인트 확인</h1>                            
                        </div>

                        <div class="pointWrapper">
                            <div class="row gx-5 justify-content-center">
                                <h3><i class="fa-solid fa-paw"></i>포인트 :  ${loginMember.memberPoint}</h3>
                                <p>지금까지 누적된 포인트와 사용 내역을 조회할 수 있습니다..</p>
                            </div>

                        <div class="row gx-5 justify-content-center">
                            <table class="table table-striped">
                                <tr>
                                    <th>결제번호</th>
                                    <th>사용한 포인트</th>
                                    <th>사용일</th>
                                </tr>
                        
                                <c:if test="${!empty dList}">
                                    <c:forEach  var="d" items="${dList}">
                                            <tr>
                                                <td>${d.paymentNo}</td>
                                                <td>${d.point}</td>
                                                <td>${d.payDate}</td>
                                            </tr>
                                    </c:forEach>
                            </c:if>
                        
                                <c:if test="${empty dList}">
                                    <tr><td colspan="3"><h3>사용 내역이 없습니다.</h3></td></tr>
                                </c:if>

                            </table>
                        </div>
                    </div><!-- wrapper 끝 -->
<%-- --------------------------------------------------------------------------------- --%>

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
