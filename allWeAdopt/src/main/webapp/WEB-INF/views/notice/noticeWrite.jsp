<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 - 공지사항 작성</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- include libraries(jQuery, bootstrap) -->
        <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>      
        
        <!-- summer note -->
 
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- 폰트어썸 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
        
        .none{
            display : none;
        }
        
        </style>
        
    </head>
    <body class="d-flex flex-column" id="body">

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title mx-auto" id="exampleModalLabel" style="padding-left:30px">매크로 생성 <img src="${contextPath}/resources/images/new_4.png"></h5>
                        <button type="button" class="btn-close mx-0" data-bs-dismiss="modal" aria-label="Close" id="closeBtn"></button>
                    </div>
                    <div class="modal-body py-2">
                    
                        <div class="d-flex flex-column align-items-center py-2">
                            <div class="pb-3">
                                매크로명 : <input type="text" id="tempName">
                            </div>
                            <div class="px-auto mb-1">
                                <textarea id="summernote2" name="boardContent"></textarea> 
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="d-grid btn btn-primary btn-lg col-sm-11 button-pink" id="add">저장</button>
                    </div>
                </div>
            </div>
        </div>  <!-- 모달끝 -->

        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

            <!-- Header-->
            <header class="py-3">
                <div class="container px-3">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-left mt-5">
                                <h2 class="fw-bolder mb-3">공지사항 글작성</h2>
                                <p class="lead fw-normal text-muted mb-2" style="font-size: 14px;">공지사항을 작성해주세요. </p>
                            </div>
                        </div>
                </div>
            </header>
           
            <!-- About section two-->
            <section class="py-0">
                <div class="container px-3 my-1">
                    <div class="row gx-5 align-items-center">
                        <form action="${contextPath}/admin/notice/write" method="post" onsubmit="return writeValidate()">

                            <div class="col-md-5 col-sm-6">
                                
                                <label for="exampleFormControlInput3" class="form-label"></label>
                                <input type="text" name="boardTitle" class="form-control" id="exampleFormControlInput3" placeholder="제목을 입력하세요" value="${detail.boardTitle}" >
                            </div>

                            <div class="btn"></div>

                            <div class="md-10" id="writeTemplate">

                                <fieldset class="form-group">
                                    <div class="row">

                                        <!-- 평소에 안보이다가 설정 클릭하면 보이기 -->
                                        <div class="my-0 mx-2 px-0 d-flex">
                                            <legend class="btn col-form-label p-1 m-1" style="width:12%; border: 1px solid #ddd;" id="setting" type="button"><i class="fa-solid fa-gear"></i> 매크로 설정</legend>
                                            <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary button-pink form-check-label none p-1 m-1" id="insert" type="button">신규 등록</button>
                                            <button class="btn btn-primary button-pink form-check-label none p-1 m-1" type="button" id="delete">선택 삭제</button>                                             
                                        </div>
        
                                        <div class="col-sm-10 mb-3 d-flex">

                                            <div id="tListArea" class="bg-white p-3 mx-0 form-control none">

                                                <c:forEach var="t" items="${tList}">
                                                    <input type="checkbox" name="chk" value='${t.tempNo}' title='${t.tempEnc}'  class="chk"> ${t.tempName} <br>
                                                </c:forEach>                                                

                                            </div>
                                        
                                        </div>


                                        <div class="col-sm-10">

                                            <div class="form-check px-0" id="buttonArea">
                                                <c:forEach var="t" items="${tList}">
                                                    <button class="btn btn-primary button-pink form-check-label p-1 tempBtn" type="button" title='${t.tempEnc}' >${t.tempName}</button>
                                                    <input type="hidden" class="hiddenContent" value='${t.tempContent}''>
                                                </c:forEach>      

                                            </div>

                                        </div>
                                    </div>
                                </fieldset>

                            </div>

                            <div class="mb-5 pb-3">
                                
                                    <label for="exampleFormControlTextarea1" class="form-label"></label>
                                    <textarea id="summernote" name="boardContent">${detail.boardContent}</textarea>    


                                    <!-- 숨겨진 값(hidden) : mode, boardNo, cp-->
                                    <input type="hidden" name="mode" value="${param.mode}">
                                    <input type="hidden" name="boardNo" value="${empty param.no ? 0 : param.no}">
                                    <input type="hidden" name="cp" value="${param.cp}">

                                    <button class="btn btn-primary mt-3 mx-1 button-pink">등록</button>

                                    <!-- insert 모드 -->
                                    <c:if test="${param.mode == 'insert'}">
                                        <button class="btn btn-primary mt-3 mx-1 button-pink" type="button" id="goToListBtn">목록으로</button>
                                    </c:if>
                                    
                                    <!-- update 모드 -->
                                    <c:if test="${param.mode == 'update'}">
                                        <button class="btn btn-primary mt-3 mx-1 button-pink" type="button" onclick="location.href='${header.referer}'">이전으로</button>                           
                                    </c:if>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </section>

        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
       
		<!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script>

            const contextPath = "${contextPath}";

            <c:if test="${loginMember.memberType == 'A'}">
                const url = "${contextPath}/admin/notice/list?";
            </c:if>
            <c:if test="${loginMember.memberType =='M' || loginMember.memberType == 'K'}">
                const url = "${contextPath}/member/myPage/notice/list?";
            </c:if>

            const tLength = "${fn:length(tList)}";

        </script>
        <!-- 썸머노트 -->
        <script>
            $(document).ready(function() {
                $('#summernote2').summernote({
                    placeholder: '내용을 입력해주세요.',
                    tabsize: 2,
                    height: 200,
                    width:434,
                    toolbar: [ 
                        // [groupName, [list of button]]
                        ['fontname', ['fontname']],
                        ['fontsize', ['fontsize']],
                        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                        ['color', ['forecolor','color']],
                        ['table', ['table']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']]
                        // ['insert',['picture','link']],
                        // ['view', ['fullscreen', 'help']]
                    ],
                    disableResizeEditor: true,
                    callbacks:{
                        onImageUpload: function(files, editor) {
                            // 업로드된 이미지를 ajax를 이용하여 서버에 저장
                            console.log("이미지 업로드됨");
                            console.log(files);
                            sendFile(files[0], this);
                        }
                    }
                });
            });


            $(document).ready(function() {
                $('#summernote').summernote({
                    placeholder: '내용을 입력해주세요.',
                    tabsize: 2,
                    height: 500,
                    toolbar: [
                        // [groupName, [list of button]]
                        ['fontname', ['fontname']],
                        ['fontsize', ['fontsize']],
                        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                        ['color', ['forecolor','color']],
                        ['table', ['table']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert',['picture','link']],
                        // ['view', ['fullscreen', 'help']]
                    ],
                    callbacks:{
                        onImageUpload: function(files, editor) {
                            // 업로드된 이미지를 ajax를 이용하여 서버에 저장
                            console.log("이미지 업로드됨");
                            console.log(files);
                            sendFile(files[0], this);
                        }
                    }
                });
            });
        </script>

        <script src="${contextPath}/resources/js/board/summerNote.js"></script>

        <script src="${contextPath}/resources/js/board/notice.js"></script>

    </body>
</html>
