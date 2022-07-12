<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>펀딩목록 : ALL WE ADOPT</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- 폰트어썸 (폰트)-->
        <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/funding/funding-detail.css" rel="stylesheet" />

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
            .bg-pink {
            —bs-bg-opacity: 1;
            background-color: rgb(251, 131, 107);
            }


            .st0{fill:#373737;}
            .st1{fill:#FB836B;}
            .st2{fill:none;stroke:#373737;stroke-width:7.3;stroke-miterlimit:10;}

        </style>
    </head>
    <body class="">
    
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


					
					
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/header.jsp" />

			<!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
			<div class="fundingTitleBox" style="height:120px;">
			    <div class="fundingTitleImage" style="background: url(${contextPath}/resources/images/funding_sample/funding_title_img.png) 50% 0 ;"></div>
			    <div class="fundingTitleText" style="top:30px;">
			        우리아이 시원하게 여름 쿨매트
			    </div>
			</div>
			
			
 
			



            <section class="py-4">
                <div class="container px-5">




					
					
					
					
					
					<div class="text-center py-5">
						<h1 class="fw-bolder">리워드 선택</h1>
						<p class="lead fw-normal text-muted mb-0">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
					</div>
                    
					<div class="row gx-5">
                    
                    
                    
                    
						<!-- 리워드-->
						<div class="col-lg-6 col-xl-4 mb-5">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">
								
									<div class="rew-number reward-select">
										리워드1
									</div>
									<div class="rew-price reward-select">
										108,000<span>원 펀딩</span>
									</div>
									<div class="rew-title">
										슈퍼얼리도그 쿨매트 러그형 M(150x250x1.5cm) 그레이
									</div>
									<div class="rew-content">
										몽뚜뚜 프리미엄 러그형 쿨매트! 3D매쉬 소재로 통풍이 잘되는 애견매트로 M(150x250x1.5cm) 사이즈는 싱글 침대에 함께 사용할 수 있습니다.<br>★ 쿨매트 : 그레이 색상
									</div>
									<div class="delivery-box">
										<span class="deli-title">리워드 발송 시작일</span>
										<span class="deli-content">08월 01일 부터 순차발송</span>
									</div>
									<div class="stock-box">
										<span class="stock">현재 47개 남음 / 제한수량 50개</span>
										<span class="order-count">총 3개 펀딩 완료</span>
									</div>
									
									<div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn">리워드 선택</p></div>
								</div>
							</div>
						</div>
                        
                        
                        
                        <div class="col-lg-6 col-xl-4">
                            <div class="card mb-5 mb-xl-0">
                                <div class="card-body p-5">

									<div class="rew-number reward-select">
                                        리워드2
                                    </div>
                                    <div class="rew-price reward-select">
                                        108,000<span>원 펀딩</span>
                                    </div>
                                    <div class="rew-title">
                                        슈퍼얼리도그 쿨매트 러그형 M(150x250x1.5cm) 그레이
                                    </div>
                                    <div class="rew-content">
                                        몽뚜뚜 프리미엄 러그형 쿨매트! 3D매쉬 소재로 통풍이 잘되는 애견매트로 M(150x250x1.5cm) 사이즈는 싱글 침대에 함께 사용할 수 있습니다.<br>★ 쿨매트 : 그레이 색상
                                    </div>
                                    <div class="delivery-box">
                                        <!-- <span class="deli-title">배송비</span>
                                        <span class="deli-content">0원</span> -->
                                        <span class="deli-title">리워드 발송 시작일</span>
                                        <span class="deli-content">08월 01일 부터 순차발송</span>
                                    </div>
                                    <div class="stock-box">
                                        <span class="stock">현재 47개 남음 / 제한수량 50개</span>
                                        <span class="order-count">총 3개 펀딩 완료</span>
                                    </div>

                 
                                    <div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn">리워드 선택</p></div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="col-lg-6 col-xl-4">
                            <div class="card mb-5 mb-xl-0">
                                <div class="card-body p-5">

									<div class="rew-number reward-select">
                                        리워드3
                                    </div>
                                    <div class="rew-price reward-select">
                                        108,000<span>원 펀딩</span>
                                    </div>
                                    <div class="rew-title">
                                        슈퍼얼리도그 쿨매트 러그형 M(150x250x1.5cm) 그레이
                                    </div>
                                    <div class="rew-content">
                                        몽뚜뚜 프리미엄 러그형 쿨매트! 3D매쉬 소재로 통풍이 잘되는 애견매트로 M(150x250x1.5cm) 사이즈는 싱글 침대에 함께 사용할 수 있습니다.<br>★ 쿨매트 : 그레이 색상
                                    </div>
                                    <div class="delivery-box">
                                        <!-- <span class="deli-title">배송비</span>
                                        <span class="deli-content">0원</span> -->
                                        <span class="deli-title">리워드 발송 시작일</span>
                                        <span class="deli-content">08월 01일 부터 순차발송</span>
                                    </div>
                                    <div class="stock-box">
                                        <span class="stock">현재 47개 남음 / 제한수량 50개</span>
                                        <span class="order-count">총 3개 펀딩 완료</span>
                                    </div>

                 
                                    <div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn">리워드 선택</p></div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
     
     
                     
                        
                        
                        
                    </div>
                        
                    
                    
                    <div class="mx-5 px-5 py-5" >
                    
	                    <table style="margin: 20px auto;">
		                    <tr>
		                    	<th class="align-top" style="width:130px;">
		                    		공개여부(선택)
			                    </th>
			                    <td>
			                    	서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히 펀딩하고 싶으시다면, 비공개로 선택해주세요.
									<p>커뮤니티, 새소식 댓글 작성 시에는 비공개 여부와 상관없이 펀딩 참여자 표시가 노출됩니다.</p>
		                    	</td>
		                    </tr>
	                    </table>
	                    
	                    
						<div style="margin: 20px auto;" class="d-flex justify-content-center">
							<div class="form-check px-5">
								<input class="form-check-input" type="checkbox" value="" id="name">
								<label class="form-check-label" for="name">
									이름 비공개
								</label>
							</div>
							<div class="form-check px-5">
								<input class="form-check-input" type="checkbox" value="" id="price">
								<label class="form-check-label" for="price">
									펀딩금액 비공개
								</label>
							</div>
						</div>
						
						
						<div class="text-center mt-5 fs-5">우리아이 시원하게 여름 쿨매트에 0원을 펀딩합니다.</div>
						<button data-bs-toggle="modal" data-bs-target="#exampleModal" class="selected d-grid col-6 mx-auto my-3 py-2" style="border-radius:4px; font-size:20px;" >결제 페이지로</button>
						
                    
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
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script>
        	const rewardSelectBtn = document.getElementsByClassName("rewardSelectBtn");
        	
        	for(let i=0; i<rewardSelectBtn.length; i++){
        		
        		// 마우스오버 했을때
         		rewardSelectBtn[i].addEventListener("mouseover",function(){	
        			
        			if(this.classList.contains("selected")){
        				this.classList.remove("btn-pk"); 
        			}else{
			        	this.classList.add("btn-pk");        		        				
        			}
        			
        		})
        		
        		// 마우스아웃 했을때
        		rewardSelectBtn[i].addEventListener("mouseout",function(){	
		        	this.classList.remove("btn-pk");        		
        		})
 
        		// 클릭 했을때
        		rewardSelectBtn[i].addEventListener("click",function(){	
		        	this.classList.toggle("selected");  
        			if(this.classList.contains("selected")){
        				this.classList.remove("btn-pk"); 
        			}
        		})
        		
        	}
        
        </script>

    </body>
    
</html>