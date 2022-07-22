<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>

    <!-- Navigation mypage-->
     <nav class="navbar navbar-expand-lg navbar-dark bg-pink " >
        <div class="container px-2">
            <ul class="navbar-nav ms-left mb-2 mb-lg-0">
                <c:if test="${loginMember.memberType == 'M'}">
                    <li class="nav-item" ><a class="nav-link" href="${contextPath}/member/myPage/pwConfirm">회원 정보 수정</a></li>
                </c:if>
                <c:if test="${loginMember.memberType == 'K'}">
                    <li class="nav-item" ><a class="nav-link" href="${contextPath}/member/myPage/updateInfo">회원 정보 수정</a></li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/myPage/likeList">관심목록</a></li>
                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/myPage/boardList">작성글 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="${contextPath}/funding/my/list">펀딩내역</a></li>
                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/myPage/ask/list">문의하기</a></li>
                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/myPage/notice/list">공지사항</a></li>
            </ul>
            <ul class="navbar-nav ms-right mb-2 mb-lg-0 secession-button ">
                <li class="nav-item"><a class="nav-link " href="${contextPath}/member/myPage/secession">탈퇴하기</a></li>
            </ul>    
        </div>
    </nav> 

</header>
