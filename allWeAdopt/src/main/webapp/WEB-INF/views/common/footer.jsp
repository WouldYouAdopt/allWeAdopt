<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Footer-->
<footer class="py-4 mt-auto" id="footer">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">&copy; ALL WE ADOPT all rights reserved. </div></div>
            <div class="col-auto">
                <a class="link-light small text-decoration-none" href="${contextPath}/etc?mode=1">Privacy</a>
                <span class="text-white mx-1 ">&middot;</span>
                <a class="link-light small text-decoration-none" href="${contextPath}/etc?mode=2">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small text-decoration-none" href="${contextPath}/etc?mode=3">Contact</a>
            </div>
        </div>
    </div>
    
<%-- 채팅 서버로 연결하는 함수 --%>
    <form action="http://3.35.8.153:8080/weChat/list" method="POST" name="chatForm">
        <input type="hidden"  name="member" value='${loginMember.memberJson}'>
    </form>

    <form action="http://3.35.8.153:8080/weChat/add" method="POST" name="addChatForm" id="addChatForm">
        <input type="hidden" id="member"  name="member" value='${loginMember.memberJson}'>
        <input type="hidden" id="targetMember"  name="targetMember" value=''>
    </form>

</footer>

<%-- request에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
<c:if test="${ !empty message }">
    <script>
            Swal.fire({
            title: '${message}',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
            });
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
</c:if> 

 <script src="${contextPath}/resources/js/chat/chat.js"></script>