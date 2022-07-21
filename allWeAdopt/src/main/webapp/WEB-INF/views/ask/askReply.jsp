<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%-- <%@ page import = "java.util.Calendar" %> --%>
        

            

            <!-- 댓글 전체박스-->
            <section class="py-0 " >
                <div class="container px-2 my-1 mt-3">
                    <div class="row gx-5 align-items-center">
                        <div class="ms-3">
                            <div class="card bg-light">
                                <div class="card-body">

                                    <!-- 코멘트 작성공간. -->
                                     <c:if test="${loginMember.memberType =='A' }">
                                        <div class="row g-2 mb-4 align-items-center">
                                            <div class="col-md-11 ">
                                                <textarea class="form-control" placeholder="관리자 로그인 일때만 보임." id="floatingTextarea" style="resize: none;"></textarea>
                                            </div>
                                            <div class="col-auto">
                                            <button type="submit" class="btn button-pink col-mb-1 btn-lg" style="color: white;">등록</button>
                                            </div>
                                        </div>
                                    </c:if>


                                    <c:if test="${empty rList}">
                                    <div id="area">
                                    <div>
                                        <div class="d-flex">
                                            <div class="flex-shrink-0" ><img class="rounded-circle" src="${contextPath}/resources/images/user.png" style="width: 50px;"/></div>
                                                <div class="ms-3 ">
                                                    <div class="col-lg-8  fw-bold" id="reply-name" >관리자</div>
                                                    <!-- 코멘트 조회 넣기 -->
                                                        <div>
                                                          답변 작성중....
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="d-flex">
                                            <div class="flex-shrink-0" ><img class="rounded-circle" src="${contextPath}/resources/images/user.png" style="width: 50px;"/></div>
                                                <div class="ms-3 ">
                                                    <div class="col-lg-8  fw-bold" id="reply-name" >관리자</div>
                                                    <!-- 코멘트 조회 넣기 -->
                                                        <div>
                                                          답변 작성중....
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="d-flex">
                                            <div class="flex-shrink-0" ><img class="rounded-circle" src="${contextPath}/resources/images/user.png" style="width: 50px;"/></div>
                                                <div class="ms-3 ">
                                                    <div class="col-lg-8  fw-bold" id="reply-name" >관리자</div>
                                                    <!-- 코멘트 조회 넣기 -->
                                                        <div>
                                                          답변 작성중....
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                    </div>


                                    </c:if>

                                    <div id="comentArea"> 
                                    <!-- 관리자 답변 조회 공간-->
                                    <c:forEach var="reply" items="${rList}">
                                    <div class="reply-row">
                                        <div class="d-flex" >
                                            <div class="flex-shrink-0" ><img class="rounded-circle" src="${contextPath}/resources/images/user.png" style="width: 50px;"/></div>
                                                <div class="ms-3 ">
                                                    <div class="col-lg-8  fw-bold" >관리자</div>
                                                    <!-- 코멘트 조회 넣기 -->
                                                        <div>
                                                           22222 If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                                           
                                                        </div>
                                                        <c:if test="${loginMember.memberType =='A' }">
                                                            <div class="col-lg-6">
                                                                <button type="submit" class="btn btn-outline-secondary mb-2  btn-sm">수정</button>
                                                                <button type="submit" class="btn btn-outline-secondary mb-2 btn-sm">삭제</button>
                                                            </div>
                                                        </c:if> 
                                                </div>
                                                
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <div>
                                
                            </div>
                        </div>
                                <c:if test="${loginMember.memberType =='A' }">
                                    <button type="submit" class="col-lg-12  btn bg-pink mt-3" style="color : white; height : 50px" >해당 문의글 삭제(관리자)</button> 
                                </c:if>
                    </div>
                </div>

               
            </section>
           
