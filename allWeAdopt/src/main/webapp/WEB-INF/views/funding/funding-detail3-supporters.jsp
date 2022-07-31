<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="col-lg-9 policy">

	<!-- Post content-->
	<article class="content-box">
	    <p class="policy-main-title">
	        현재 이 프로젝트에<br> 
	        <span class="pink">${detail.supportersNo}명</span>의 참여가 이루어졌습니다.
	    </p>
	    
	    <c:if test="${detail.supportersNo==0}">
	    참여 서포터가 없습니다.
	    </c:if>
	    <c:if test="${detail.supportersNo!=0}">
	    
	    
	    <table class="supporter-table">
	    	<c:forEach var="i" begin="0" end="${fn:length(detail.supportersList)}">
	    	
	    		<!-- 펀딩 이름 공개 -->
	    		<c:if test="${detail.supportersList[i].nameOpen=='Y'}">
		    		<tr>
		    		<th rowspan="2" style="vertical-align:center;">
		    		<!-- 프로필 이미지가 비었을때 -->
		    		<c:if test="${empty detail.supportersList[i].profileImage}">
		    			<img class="rounded-circle" src="${contextPath}/resources/images/funding_sample/profile-sample.png">
		    		</c:if>
		    		<!-- 프로필 이미지가 있을때 -->
		    		<c:if test="${!empty detail.supportersList[i].profileImage}">
		    			<c:if test="${detail.supportersList[i].memberType=='M'}">
		    			<img class="rounded-circle" src="${contextPath}${detail.supportersList[i].profileImage}">
		    			</c:if>
		    			<c:if test="${detail.supportersList[i].memberType=='K'}">
		    			<img class="rounded-circle" src="${detail.supportersList[i].profileImage}">
		    			</c:if>
		    		</c:if>
		    		</th>
		    		
		    		<td style="vertical-align:bottom;">${detail.supportersList[i].memberName}님이
		    		<c:if test="${detail.supportersList[i].priceOpen=='Y'}">
		    			<fmt:formatNumber value="${detail.supportersList[i].payFullPrice}"/>원
		    		</c:if>
		    		<c:if test="${detail.supportersList[i].priceOpen=='N'}">
		    		</c:if>
		    		 펀딩으로 참여 하셨습니다.</td>
		    		<tr class="end-oneSupporter" style="vertical-align:top;"><td>${detail.supportersList[i].payDate}</td></tr>
	    		</c:if>
	    		
	    		<!-- 펀딩 이름 미공개 -->
	    		<c:if test="${detail.supportersList[i].nameOpen=='N'}">
		    		<tr>
		    		<th rowspan="2" style="vertical-align:center;"><img class="rounded-circle" src="${contextPath}/resources/images/funding_sample/profile-sample.png"></th>
		    		<td style="vertical-align:bottom;">All We Adopt Supporter님이
		    		<c:if test="${detail.supportersList[i].priceOpen=='Y'}">
		    			${detail.supportersList[i].payFullPrice}원
		    		</c:if>
		    		<c:if test="${detail.supportersList[i].priceOpen=='N'}">
		    		</c:if>
		    		펀딩으로 참여 하셨습니다.</td>
		    		<tr class="end-oneSupporter" style="vertical-align:top;"><td>${detail.supportersList[i].payDate}</td></tr>
	    		</c:if>
	    	</c:forEach>
	    	
	    	
	    </table>
	    </c:if>
	</article>

</div>