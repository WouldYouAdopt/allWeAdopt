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
        <title>Modern Business - Start Bootstrap Template</title>

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

     

        <style>
            .nav-text-color{
                /* color: rgb(251, 131, 107); */
                color: black;
            }
           
            .secession-button{
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 5px;
            }
            .nav-text-color:hover {
                color: rgb(251, 131, 107);
            }

            .button-pink{
                background-color: rgb(251, 131, 107);
                border: none;
            }
            .button-pink:hover{
                background-color: rgb(251, 131, 107);
                border: none;
            }
        </style>
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- 헤더 -->   
            <c:if test="${loginMember.memberType =='M' || loginMember.memberType == 'K'}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />
            </c:if>
            <c:if test="${loginMember.memberType =='A'}">
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
            </c:if>
            
            <!-- Header-->
            <header class="py-3">
                <div class="container px-2">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-left my-5">
                                <h2 class="fw-bolder mb-3">문의하기 글작성</h2>
                                <p class="lead fw-normal text-muted mb-2" style="font-size: 14px;">문의사항을 작성해주세요. </p>
                            </div>
                        </div>
                </div>
            </header>
           
            <!-- About section two-->
            <section class="py-0">
                <div class="container px-3 my-1">
                    <div class="row gx-5 align-items-center">
                        <div class="col-md-5 col-sm-6 ">
                            <span class="form-label">문의사항을 선택해주세요.</span>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>문의사항 선택</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="3">Three</option>
                              </select>
                        </div>

                        <div class="md-10"></div>

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput3" class="form-label">게시글 제목</label>
                            <input type="email" class="form-control" id="exampleFormControlInput3" placeholder="게시글의 제목을 입력하세요..."  >
                        </div>

                        <div class="md-10"></div>
                        
                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput2" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="김주에@naver.com(시간나면하도록)"  >
                        </div>

                        <div class="md-10"></div>

                        <div class="col-md-5 col-sm-6 mt-3">
                            <label for="exampleFormControlInput1" class="form-label">작성자</label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="김주에" readonly >
                        </div>

                        <div class="md-10"></div>

                        <div class="mb-3 mt-3">
                            <label for="exampleFormControlTextarea1" class="form-label">문의내용 작성</label>
                            <textarea id="summernote" name="editordata"></textarea>    
                            <button class="btn btn-primary mt-3 button-pink" type="submit">글작성</button>
                        </div>

                    </div>
                </div>
            </section>
           
            
            <!-- About section three-->
            <section class="py-3">
                <div class="container px-4 my-1">
                    <div class="row gx-5 align-items-center">
                        
                    </div>
                </div>
            </section>


        </main>

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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <script>
          const contextPath = "${contextPath}";
        </script>

        <!-- 섬머노트 -->
        <script>
         $(document).ready(function() {
            $('#summernote').summernote({
              placeholder: '문의내용을 입력해주세요.',
              tabsize: 2,
              height: 350,
              toolbar: [
                    // [groupName, [list of button]]
                    // ['fontname', ['fontname']],
                    // ['fontsize', ['fontsize']],
                    // ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    // ['color', ['forecolor','color']],
                    // ['table', ['table']],
                    // ['para', ['ul', 'ol', 'paragraph']],
                    // ['height', ['height']],
                    ['insert',['picture','link','video']]
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

    </body>
</html>
