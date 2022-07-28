<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio" style="right: 11%; height: 240px;">
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



    <%-- <!-- Navigation mypage-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-pink " >
        <div class="container px-2">
                <ul class="navbar-nav ms-left mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.html">회원정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">관심목록</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">작성글 목록</a></li>
                    <li class="nav-item"><a class="nav-link" href="pricing.html">펀딩내역</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq.html">채팅목록</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq.html">문의하기</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq.html">공지사항</a></li>
                </ul>
                <ul class="navbar-nav ms-right mb-2 mb-lg-0 secession-button ">
                    <li class="nav-item"><a class="nav-link " href="faq.html">탈퇴하기</a></li>
                </ul>    
        </div>
    </nav> --%>

</header>