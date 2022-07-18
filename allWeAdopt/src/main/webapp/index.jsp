<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 

	* JSP 는 컴파일 시 Servlet으로 변환된다
	  -> JSP 에서도 forward(요청위임) 가능
	
	* webapp 폴더 바로 하위에 존재하는 index.jsp파일은
	  자동으로 welcome-file로 인식된다. 
	  == 최상위 주소로 요청시 index.jsp화면이 보여지게 된다. 

	기존 : Servlet -> JSP로 forward (JSP경로 작성)
	이제 JSP -> servlet으로 forward (Servlet의 요청주소 작성)
	
	* http://localhost:8080/comm/main 주소로 요청 위임
	  단, forward이기때문에 출력되는 주소는 http://localhost:8080/comm 유지


--%>






    <c:choose>
       <c:when test="${ loginMember.memberType == 'A' }"> 
			<jsp:forward page="admin/main"/>
       </c:when>

       <c:otherwise>
	   
			<c:if test="${ !empty cookie.intro.name}">
				<jsp:forward page="main"/>
			</c:if>
			<c:if test="${ empty cookie.intro.name}">
				<jsp:forward page="intro"/>
			</c:if>
				
			
        </c:otherwise>
    </c:choose>

