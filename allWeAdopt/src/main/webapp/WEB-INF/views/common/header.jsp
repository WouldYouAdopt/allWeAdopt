<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-white" style="border-bottom: 1px solid;">
        <div class="container px-5">
            <a class="navbar-brand pt-1" href="${contextPath}">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 291.1 41.24" id="logo">
					<defs><style>.cls-1{fill:#fb836b;}.cls-2{fill:#373737;}#logo{width:240px}</style></defs>
					<path class="cls-2" d="M143.1,30.74c.1,1.4,.6,2.5,1.4,3.4,.8,.8,1.9,1.3,3.3,1.3,.8,0,1.5-.1,2.3-.4,.7-.3,1.2-.7,1.6-1.3h8.5c-.9,2.5-2.4,4.4-4.7,5.6s-4.8,1.9-7.6,1.9c-1.9,0-3.7-.3-5.3-.8-1.6-.6-3.1-1.4-4.3-2.4-1.2-1.1-2.1-2.4-2.8-3.9s-1-3.3-1-5.3c0-1.7,.3-3.3,.9-4.9,.6-1.5,1.5-2.9,2.6-4,1.1-1.2,2.5-2.1,4-2.7,1.6-.6,3.3-1,5.1-1,4.6,0,8,1.2,10.3,3.7,2.2,2.5,3.3,6.1,3.3,10.9h-17.6v-.1Zm8.7-4.7c0-1.1-.4-2.1-1.1-2.9-.8-.8-1.7-1.2-2.9-1.2-2.7,0-4.3,1.3-4.7,4h8.7v.1Z"/>
					<path class="cls-1" d="M110.6,3.84c-.3-5.1-6.5-4.6-8.9-1.5-2.4-3.1-8.6-3.5-8.9,1.5-.2,4.8,5.2,8.4,8.8,10.3v.1h.2v-.1c3.6-2,9.1-5.6,8.8-10.3Z"/>
					<g>
						<path class="cls-2" d="M176.1,16.44h7.3l8.8,24.2h-7.7l-1-3.5h-7.7l-1.1,3.5h-7.5l8.9-24.2Zm5.8,15.6l-2.2-7.5h-.1l-2.3,7.5h4.6Z"/>
						<path class="cls-2" d="M193.8,16.44h12.3c1.9,0,3.6,.3,5,1s2.5,1.6,3.4,2.7c.9,1.1,1.5,2.4,1.9,3.9,.4,1.4,.6,2.9,.6,4.5,0,3.8-1,6.8-3.1,8.9s-5.2,3.2-9.3,3.2h-10.8V16.44h0Zm7.5,18h2.9c1.1,0,2-.2,2.7-.6,.7-.4,1.3-.9,1.6-1.5,.4-.6,.6-1.3,.8-1.9,.1-.7,.2-1.4,.2-2,0-.5-.1-1.1-.2-1.7-.1-.6-.4-1.2-.8-1.9-.4-.6-1-1.1-1.8-1.6-.8-.4-1.8-.6-3.1-.6h-2.4v11.8h.1Z"/>
						<path class="cls-2" d="M220.4,23.44c.6-1.6,1.4-2.9,2.5-4s2.4-2,3.9-2.6c1.5-.6,3.2-.9,5-.9s3.5,.3,5,.9c1.5,.6,2.8,1.5,3.9,2.6s1.9,2.5,2.5,4c.6,1.6,.9,3.3,.9,5.1s-.3,3.5-.9,5.1-1.4,2.9-2.5,4-2.4,2-3.9,2.6-3.2,.9-5,.9-3.5-.3-5-.9c-1.5-.6-2.8-1.5-3.9-2.6-1.1-1.1-1.9-2.5-2.5-4-.6-1.6-.9-3.3-.9-5.1,0-1.8,.3-3.5,.9-5.1Zm7.1,8.4c.3,.9,.7,1.6,1.2,2.1s1,.8,1.5,1.1,1.1,.3,1.6,.3,1.1-.1,1.6-.3,1.1-.6,1.5-1.1c.5-.5,.9-1.2,1.2-2.1s.5-2,.5-3.2-.2-2.3-.5-3.2-.7-1.6-1.2-2.1-1-.8-1.5-1.1c-.5-.2-1.1-.3-1.6-.3s-1.1,.1-1.6,.3-1.1,.6-1.5,1.1c-.5,.5-.9,1.2-1.2,2.1-.3,.9-.5,2-.5,3.2s.2,2.3,.5,3.2Z"/>
						<path class="cls-2" d="M247.3,16.44h12.5c1.6,0,2.9,.3,4.1,.8s2.1,1.2,2.8,2c.7,.8,1.2,1.7,1.5,2.7s.5,1.9,.5,2.8c0,2.8-.9,5-2.6,6.4-1.7,1.5-4,2.2-6.9,2.2h-4.4v7.3h-7.5V16.44Zm7.4,11.2h2.9c.6,0,1.1,0,1.5-.1,.4,0,.8-.2,1.2-.3,.4-.2,.7-.4,.9-.8,.2-.4,.3-.8,.3-1.4,0-.5-.1-.9-.3-1.3-.2-.3-.4-.6-.8-.7-.3-.1-.7-.2-1.1-.3-.4,0-.9-.1-1.4-.1h-3.3v5h.1Z"/>
						<path class="cls-2" d="M276.9,22.64h-6.8v-6.2h21v6.2h-6.8v18h-7.5V22.64h.1Z"/>
					</g>
					<g>
						<path class="cls-2" d="M8.9,16.44h7.3l8.8,24.2h-7.7l-1-3.5h-7.7l-1.1,3.5H0L8.9,16.44Zm5.9,15.6l-2.2-7.5h-.1l-2.3,7.5h4.6Z"/>
						<path class="cls-2" d="M26.7,16.44h7.5v18h10.7v6.2H26.7V16.44Z"/>
						<path class="cls-2" d="M48.1,16.44h7.5v18h10.7v6.2h-18.2V16.44Z"/>
					</g>
					<path class="cls-2" d="M124.25,17.04v6.1c0,5.54-4.24,10.05-9.45,10.05s-9.45-4.51-9.45-10.05v-5.8h-7.3v5.8c0,5.54-4.24,10.05-9.45,10.05s-9.45-4.51-9.45-10.05v-5.7h-7.3v5.7c0,9.57,7.51,17.35,16.75,17.35,5.3,0,10.03-2.57,13.1-6.57,3.07,4,7.8,6.57,13.1,6.57,9.24,0,16.75-7.78,16.75-17.35v-6.1h-7.3Z"/>
				</svg>
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto  my-2 mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="${contextPath}/board/shelter">보호소</a></li>
                    <li class="nav-item"><a class="nav-link" href="${contextPath}/board/user">사용자</a></li>
                    <li class="nav-item"><a class="nav-link" href="${contextPath}/funding/detail?page=1">펀딩</a></li>
                    <li class="nav-item"><a class="nav-link" href="${contextPath}/findHospital">병원찾기</a></li>

                    <c:choose>
                        <c:when test="${ empty sessionScope.loginMember }"> 
                            <%-- 로그인 X --%>
                            <li class="nav-item"><a class="nav-link" href="${contextPath}/member/login">로그인</a></li>
                        </c:when>

                        <c:otherwise>
                                <!-- 사이트로 로그인 했을 때 -->
                                <li class="nav-item dropdown" >
                                    <a class="nav-link dropdown-toggle py-1" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius: 50%;">
                                        <%-- 기본 프로필이미지(= 프로필이미지 설정 안했을때) --%>
                                        <c:if test="${empty loginMember.profileImage }">
                                             <img src="${contextPath}/resources/images/user.png" id="member-profile" style="width : 35px; height : 35px;">	
                                        </c:if>     

                                        <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'K'}">
                                             <img src="${loginMember.profileImage}" id="member-profile" style="width : 35px; height : 35px;">
                                        </c:if>

                                        <%-- 사용자 설정 프로필이미지 --%>
                                        <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'M'}">
                                             <img src="${contextPath}/${loginMember.profileImage}" id="member-profile" style="width : 35px; height : 35px;">
                                        </c:if>


                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio"  >
                                        <li><a class="dropdown-item" href="${contextPath}/member/myPage/pwConfirm">회원 정보 수정</a></li>
                                        <li><a class="dropdown-item" href="portfolio-item.html">관심 목록</a></li>
                                        <li><a class="dropdown-item" href="portfolio-item.html">작성글 목록</a></li>
                                        <li><a class="dropdown-item" href="portfolio-item.html">펀딩 참여 내역</a></li>
                                        <li><a class="dropdown-item" href="portfolio-item.html">채팅 목록</a></li>
                                        <li><a class="dropdown-item" href="portfolio-item.html">문의하기</a></li>
                                        <li><a class="dropdown-item" href="${contextPath}/member/myPage/notice">공지사항</a></li>
                                        <c:if test="${  loginMember.memberType == 'M' }">
                                            <li><a class="dropdown-item" href="${contextPath}/member/logout">로그아웃1</a></li>
                                        </c:if>

                                        <c:if test="${ loginMember.memberType == 'K' }">
                                            <li><a class="dropdown-item" href="${contextPath}/logout">로그아웃2</a></li>
                                        </c:if>

                                    </ul>
                                </li>
                         </c:otherwise>
                         
                     </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Navigation mypage-->
     <%-- <nav class="navbar navbar-expand-lg navbar-dark bg-pink " >
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
    </nav>  --%>
</header>
