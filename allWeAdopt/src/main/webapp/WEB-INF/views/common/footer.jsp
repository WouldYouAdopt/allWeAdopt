<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
            <div class="col-auto">
                <a class="link-light small" href="#!">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Contact</a>
            </div>
        </div>
    </div>
</footer>

<%-- request에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
<c:if test="${ !empty message }">
    <script>
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
    
</c:if> 