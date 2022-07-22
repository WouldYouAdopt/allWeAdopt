<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>리워드 선택 : ALL WE ADOPT</title>
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
        	/* input number에 화살표 없애기 */
        	input[type="number"]::-webkit-outer-spin-button,
			input[type="number"]::-webkit-inner-spin-button {
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			}
			.minus, .plus, .rewardCount {

				background : #fff;
				margin:0;
				width: 35px !important;
				padding:0;
				height:35px;
			}
			.minus, .plus{
				border:1px solid #999;
			}
			.rewardCount{
				text-align:center;
				border-top :1px solid #999;
				border-bottom :1px solid #999;
				border-left: none;
				border-right: none;
				
			}


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
		    <div class="modal-content" style="border-radius:40px; overflow:hidden;">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">펀딩 취소 / 반환 방법 미리 체크해보세요</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-right:25px;"></button>
		      </div>
		      <div class="modal-body py-4" style="padding-right:30px;">
		      
		      	<div class="d-flex py-3">
			      	<div class="px-3">
			      		<input type="checkbox" class="payCheck form-check-input">
			      	</div>
			      	<div class="px-2 modalcon">
			        	<p>펀딩이 끝나기 전까지 언제든 결제를 취소할 수 있어요.</p>
			        	<p>펀딩이 끝나고 바로 리워드가 제작되어 다음 날 부터 순차 발송이 시작되기 때문에, 펀딩이 끝나면 결제를 취소 할 수 없습니다.</p>
			        </div>
		      	</div>
		      	
		      	<div class="d-flex py-3">
			      	<div class="px-3">
		        		<input type="checkbox" class="payCheck form-check-input">
		        	</div>
			      	<div class="px-2 modalcon">
		        		<p>리워드에 문제가 있거나 배공일을 지키지 않으면 펀딩금을 돌려받을 수 있어요.</p>
		        		<p>펀딩금 반환 정책 확인</p>
			        </div>
		      	</div>
		        
		      	<div class="d-flex py-3">
			      	<div class="px-3">
		        		<input type="checkbox" class="payCheck form-check-input">
		        	</div>
			      	<div class="px-2 modalcon">
		        		<p>단순 변심에 의한 펀딩금 반환은 신청할 수 없어요.</p>
		        		<p>펀딩은 일반 쇼핑과 달리 리워드를 만드는 메이커에서 투자하고, 투자의 보상으로 제품이나 서비스를 받는 구조이기 때문에 전자상거래법상 통신판매에 해당하지 않아요. 그래서 단순 변심을 이유로 한 펀딩금 반환을 신청할 수 없습니다.</p>
			        </div>
		      	</div>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="" id="goPay">계속해서 펀딩하기</button>
		      </div>
		    </div>
		  </div>
		</div>  <!-- 모달끝 --> 

		<main class="flex-shrink-0">

			<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
			<!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
			<div class="fundingTitleBox" style="height:120px;">
			    <div class="fundingTitleImage" style="background: url(${contextPath}${map.funding.fundingThumbnail}) 50% 0 ;"></div>
			    <div class="fundingTitleText" style="top:30px;">
			        ${map.funding.fundingTitle}
			    </div>
			</div>
			
            <section class="py-4" style="margin-bottom:60px;">
                <div class="container px-5" style="padding-bottom:30px;">
				
					<div class="text-center py-5">
						<h1 class="fw-bolder">리워드 선택</h1>
						<p class="lead fw-normal text-muted mb-0">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
					</div>

					<!-- select 값 테스트용 -->
					<input type="hidden" value="${map.selected}" id="selected">
					
					<!-- 폼태그 -->
					<form action="../my/pay" method="POST" onsubmit="return submitConfirm()" id="goPayForm">
					
					<div class="row gx-5">
                    <c:forEach var="i" begin="0" end="${fn:length(map.rewardList)-1}">
                    
                    <c:if test="${map.rewardList[i].rewardNo==param.selected}">
                    
						<!-- 리워드-->
						<div class="col-lg-6 col-xl-4 mb-5">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">
								
									<div class="rew-number reward-select">
										리워드${i+1}
									</div>
									<div class="rew-price reward-select">
										<fmt:formatNumber value="${map.rewardList[i].rewardPrice}"/><span>원 펀딩</span>
									</div>
									<div class="rew-title">
										${map.rewardList[i].rewardTitle}
									</div>
									<div class="rew-content">
										${map.rewardList[i].rewardContent}
									</div>
									<div class="delivery-box">
										<span class="deli-title">리워드 발송 시작일</span>
										<span class="deli-content"> ${map.sendDate} &nbsp;순차발송</span>
									</div>
									
									<!-- 재고수량 0보다 클때 -->
                           			<c:if test="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount>0}">
                                    <div class="stock-box">
                                        <span class="stock">현재 ${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount}개 남음 / 제한수량 ${map.rewardList[i].maxRewardNo}개</span>
                                        <c:if test="${empty map.rewardListCount[i].rewardOrderAmount}">
	                                        <span class="order-count">총 0개 펀딩 완료</span>
                                        </c:if>
                                        <c:if test="${!empty map.rewardListCount[i].rewardOrderAmount}">
	                                        <span class="order-count">총 ${map.rewardListCount[i].rewardOrderAmount}개 펀딩 완료</span>
                                        </c:if>
                                    </div>
                           			</c:if>
                           			
                           			<!-- 재고수량 0보다 작을때 품절처리 -->
                           			<c:if test="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount<=0}">
                           			<div class="stock-box">
                                        <span class="stock">품절</span>
                                        <span class="order-count">총 ${map.rewardListCount[i].rewardOrderAmount}개 펀딩 완료</span>
                                    </div>
                           			</c:if>
                           			

                          
									
									<div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn selected">리워드 선택</p></div>
									
									<button type="button" class="minus"><i class="fa-solid fa-minus"></i></button><input type="number" min="0" max="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount}" name="${map.rewardList[i].rewardNo}" value="1" style="width:60px;" class="rewardCount" disabled><button type="button" class="plus"><i class="fa-solid fa-plus"></i></button>
									
								</div>
							</div>
						</div>
					</c:if>
					
					<c:if test="${map.rewardList[i].rewardNo!=param.selected}">

						<!-- 리워드-->
						<div class="col-lg-6 col-xl-4 mb-5">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">
								
									<div class="rew-number reward-select">
										리워드${i+1}
									</div>
									<div class="rew-price reward-select">
										<fmt:formatNumber value="${map.rewardList[i].rewardPrice}"/><span>원 펀딩</span>
									</div>
									<div class="rew-title">
										${map.rewardList[i].rewardTitle}
									</div>
									<div class="rew-content">
										${map.rewardList[i].rewardContent}
									</div>
									<div class="delivery-box">
										<span class="deli-title">리워드 발송 시작일</span>
										<span class="deli-content"> ${map.sendDate} &nbsp;순차발송</span>
									</div>
									
									
									<!-- 재고수량 0보다 클때 -->
                           			<c:if test="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount>0}">
                                    <div class="stock-box">
                                        <span class="stock">현재 ${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount}개 남음 / 제한수량 ${map.rewardList[i].maxRewardNo}개</span>
                                        <c:if test="${empty map.rewardListCount[i].rewardOrderAmount}">
	                                        <span class="order-count">총 0개 펀딩 완료</span>
                                        </c:if>
                                        <c:if test="${!empty map.rewardListCount[i].rewardOrderAmount}">
	                                        <span class="order-count">총 ${map.rewardListCount[i].rewardOrderAmount}개 펀딩 완료</span>
                                        </c:if>
                                    </div>
                                    <div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn">리워드 선택</p></div>
                           			</c:if>
                           			
                           			<!-- 재고수량 0보다 작을때 품절처리 -->
                           			<c:if test="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount<=0}">
                           			<div class="stock-box">
                                        <span class="stock">품절</span>
                                        <span class="order-count">총 ${map.rewardListCount[i].rewardOrderAmount}개 펀딩 완료</span>
                                    </div>
                                    <div class="d-grid"><p class="rewardSelectBtn lineBtn-gr rewardSelectBtn">품절</p></div>
                           			</c:if>
                           			
									<button type="button" class="minus"><i class="fa-solid fa-minus"></i></button><input type="number" min="0" max="${map.rewardList[i].maxRewardNo-map.rewardListCount[i].rewardOrderAmount}" name="${map.rewardList[i].rewardNo}" value="0" style="width:60px;" class="rewardCount"><button type="button" class="plus"><i class="fa-solid fa-plus"></i></button>
								</div>
							</div>
						</div>
					</c:if>
					
                    </c:forEach>  
                    </div>
                        
                    <div class="mx-5 px-5">
                    
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
								<input class="form-check-input" type="checkbox" value="N" id="name" name="nameAnonymous">
								<label class="form-check-label" for="name">
									이름 비공개
								</label>
							</div>
							<div class="form-check px-5">
								<input class="form-check-input" type="checkbox" value="N" id="price" name="priceAnonymous">
								<label class="form-check-label" for="price">
									펀딩금액 비공개
								</label>
							</div>
						</div>
						
						<c:forEach var="i" begin="0" end="${fn:length(map.rewardList)-1}" >
							<c:if test="${map.rewardList[i].rewardNo==param.selected}">
								<c:set var="defaultPrice" value="${map.rewardList[i].rewardPrice}"/>
							</c:if>
						</c:forEach>

								<div class="text-center mt-5 fs-5">${map.funding.fundingTitle} 에 
									<span id="payPrice">
										<c:if test="${empty defaultPrice}">
											0
										</c:if>
										<c:if test="${!empty defaultPrice}">
											<fmt:formatNumber value="${defaultPrice}"/>
										</c:if>
									</span>원을 펀딩합니다.
								</div>


                    </div>  
                    <input type="hidden" name="fundingNo" value="${map.fundingNo}">
                    </form>
                    
				
				</div> <!-- container끝 -->
				<c:if test="${empty defaultPrice}">
				<button id="toModal" data-bs-toggle="modal" class="selected d-grid col-6 mx-auto my-3 py-2" style="border-radius:4px; font-size:20px;" >결제 페이지로</button>
				</c:if>
				<c:if test="${!empty defaultPrice}">
				<button id="toModal" data-bs-target="#exampleModal" data-bs-toggle="modal" class="selected d-grid col-6 mx-auto my-3 py-2" style="border-radius:4px; font-size:20px;" >결제 페이지로</button>
				</c:if>

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
        	const rewardSelectBtn = document.getElementsByClassName("rewardSelectBtn"); // 리워드 선택 버튼
        	const payPrice = document.getElementById("payPrice"); // 아래 리워드 더해진 금액
        	const payPriceNum = Number(payPrice.innerText.replace(',',''));
        	const rewardCount = document.getElementsByClassName("rewardCount");
        	const toModal = document.getElementById("toModal"); // 모달 열리는 버튼
        	var price=null;
        	var selectValidate=true;
        	
        	// 리워드별 가격
        	var priceList = new Array();
        	<c:forEach items="${map.rewardList}" var="reward">
        		priceList.push("${reward.rewardPrice}");
        	</c:forEach>
        	
        	console.log(priceList);
        	console.log(payPrice.innerText);
        	console.log(payPriceNum);
        	
        	
        	// 리워드 선택버튼 반복쓰
        	for(let i=0; i<rewardSelectBtn.length; i++){
        		
        		// 리워드별 가격?
        		//price = ${map.rewardList[0].rewardPrice};
        		
 
        		// 클릭 했을때
        		rewardSelectBtn[i].addEventListener("click",function(){	
		        	console.log(payPriceNum);
        			if(this.classList.contains("selected")){

        				
        				this.classList.remove("selected"); 
        				const beforeCount = this.parentElement.nextElementSibling.nextElementSibling.value;
        				this.parentElement.nextElementSibling.nextElementSibling.value="0";
        				payPrice.innerText=(Number(payPrice.innerText.replace(',',''))-parseInt(beforeCount)*parseInt(priceList[i])).toLocaleString();
        				
        				
        				
						
        				// 버튼 클릭시 바뀐 값에 따라 서브밋(selected해제 할때)
        				if(payPrice.innerText!=0){
        					toModal.setAttribute( 'data-bs-target', '#exampleModal');
        					selectValidate=true;
        				}else{
        					toModal.removeAttribute( 'data-bs-target', '#exampleModal');
        					selectValidate=false;
        				}
        			}else{

        				// 품절 아니라면
        				if(this.parentElement.previousElementSibling.firstElementChild.innerText!='품절'){
        					
        				
	        				this.classList.add("selected"); 
	        				this.parentElement.nextElementSibling.nextElementSibling.value="1";
	        				payPrice.innerText=(Number(payPrice.innerText.replace(',',''))+parseInt(priceList[i])).toLocaleString();
	        				
	        				// 버튼 클릭시 바뀐 값에 따라 서브밋(selected 들어갈때)
	        				if(payPrice.innerText!=0){
	        					toModal.setAttribute( 'data-bs-target', '#exampleModal');
	        					selectValidate=true;
	        				}else{
	        					toModal.removeAttribute( 'data-bs-target', '#exampleModal');
	        					selectValidate=false;
	        				}
        				
        				}
        				
        			}
        		})

        		
        		//const selected = document.getElementsById("selected");
	        	// selected 넘버확인
	        	//if(selected.value!=""){

		        	
		        	//if(selected==rewardNo){
		        		//rewardSelectBtn[i].classList.add("btn-pk");
		        	//}
	        	//}
        	}
        	

        	// value값 바꼈을때로.. 가능? changeEvent?
        	for(let i=0; i<rewardCount.length; i++){
        		
        		// input값이 바뀌었을때??
        		rewardCount[i].addEventListener("change",function(){
        			
        			var sum=0;
		        	// value값(반복문 덧셈으로 바꾸기)
		        	for(var a=0; a<priceList.length; a++){
		        		sum +=parseInt(rewardCount[a].value)*parseInt(priceList[a]);
		        	}
					payPrice.innerText= sum.toLocaleString();
					
					// input value change에 따라 서브밋(selected 들어갈때)
    				if(payPrice.innerText!=0){
    					toModal.setAttribute( 'data-bs-target', '#exampleModal');
    					selectValidate=true
    				}else{
    					toModal.removeAttribute( 'data-bs-target', '#exampleModal');
    					selectValidate=false;
    				}
				
					
					if(rewardCount[i].value>0){
						rewardSelectBtn[i].classList.add("selected");  
					}else{
						rewardSelectBtn[i].classList.remove("selected");  
					}
        		})
        	
        	}
        	
        	
        	
        	const minus = document.getElementsByClassName("minus");
        	const plus = document.getElementsByClassName("plus");
        	// plus minus 버튼 동작
        	for(let i=0; i<minus.length; i++){
        		minus[i].addEventListener("click",function(){
        			if(this.nextElementSibling.value>0){        				
	        			this.nextElementSibling.value= parseInt(this.nextElementSibling.value)-1;
	     				
	        			if(this.nextElementSibling.value==0){
	        				rewardSelectBtn[i].classList.remove("selected");
	        			}
	        			
        			var sum=0;
	        			for(var a=0; a<priceList.length; a++){
			        		sum +=parseInt(rewardCount[a].value)*parseInt(priceList[a]);
			        	}
						payPrice.innerText= sum.toLocaleString();
	        			
        			}
        			
        			// input value change에 따라 서브밋(selected 들어갈때)
        			if(payPrice.innerText!=0){
        				toModal.setAttribute( 'data-bs-target', '#exampleModal');
        				selectValidate=true
        			}else{
        				toModal.removeAttribute( 'data-bs-target', '#exampleModal');
        				selectValidate=false;
        			}
        		})
        		
        		const max = plus[i].previousElementSibling.getAttribute('max');
        		plus[i].addEventListener("click",function(){
        			// input의 max속성값 가져오기
        			if(this.previousElementSibling.value<parseInt(max)){        				
	        			this.previousElementSibling.value= parseInt(this.previousElementSibling.value)+1;
	        			rewardSelectBtn[i].classList.add("selected");
	        			
        			var sum=0;
	        			for(var a=0; a<priceList.length; a++){
			        		sum +=parseInt(rewardCount[a].value)*parseInt(priceList[a]);
			        	}
						payPrice.innerText= sum.toLocaleString();
        			}
        			
        			
        			
        			// input value change에 따라 서브밋(selected 들어갈때)
        			if(payPrice.innerText!=0){
        				toModal.setAttribute( 'data-bs-target', '#exampleModal');
        				selectValidate=true
        			}else{
        				toModal.removeAttribute( 'data-bs-target', '#exampleModal');
        				selectValidate=false;
        			}
        		})
        		
        		
        		
        		
        	}
        	

        	
        	
        	// 결제버튼 submit
        	const goPay = document.getElementById("goPay"); // 결제버튼
        	const goPayForm = document.getElementById("goPayForm"); // 결제폼태그
        	

        	goPay.addEventListener("click",function(){ // 결제버튼 클릭 했을때

        		// 결제 전 유효성검사

	        	// class="payCheck" 세개 다 체크되어 있어야 submit
	        	const payCheck1 = document.getElementsByClassName("payCheck")[0];
	        	const payCheck2 = document.getElementsByClassName('payCheck')[1];
	        	const payCheck3 = document.getElementsByClassName('payCheck')[2];

		        if(payCheck1.checked && payCheck2.checked && payCheck3.checked){        	
        			goPayForm.submit();
		        }else{
		        	alert("모든 항목을 확인하고 체크해주세요");
		        }
	        	
	        	
        		
        	})
        	
        	//모달 열리는 버튼 클릭이벤트
        	
        	toModal.addEventListener("click",function(){
        		if(selectValidate=='false'){
        		alert("리워드를 선택하렴");
        		// 이거 이전에 모달연결하는 class빠져있으면 부트스트랩 js에서 오류남
        			
        			
        		}
        	});
        	
        	


        </script>

    </body>
    
</html>