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
            
            
            
            
            
            
            
            
            
            
            .lineBtn-gr{
            	color: #999;
            	border: 1px solid #999;
            }
            .btn-pk{
                color: #fff;
            	border: 1px solid #fff;
            	background: #FB836B;
            }
            .selected{
                color: #fff;
            	border: 1px solid #fff;
            	background: #FB836B;
            }
            
            
            .mapCon{
            	position:relative;
            }
            .mapBtn{
            position:absolute;
            top:0px;
            right:0px;
            z-index:3;
            }
            .mapBtn div{
			    font-weight: 400;
			    line-height: 1.5;
			    text-align: center;
			    vertical-align: middle;
			    cursor: pointer;
			    padding: 0.375rem 0.75rem;
			    font-size: 1rem;
			    border-radius: 0.25rem;
            }
            #map{
            margin-right:10px;
            }

        </style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <section class="py-4">
                <div class="container px-5">

					<div class="text-center py-5">
						<h1 class="fw-bolder">병원찾기</h1>
						<p class="lead fw-normal text-muted mb-0">가까운 병원을 확인해보세요</p>
					</div>
                    
					<div class="d-flex mx-5 justify-content-center mapCon" >
						
						<div id="map" style="width:82%;height:500px; "></div>
						
						<div class="mapBtn">
							<div class="mb-2 lineBtn-gr">반경 1km</div>
							<div class="mb-2 lineBtn-gr selected">반경 2km</div>
							<div class="lineBtn-gr">반경 5km</div>
						</div>
						
					</div>
						<div style="height:200px;">병원 리스트 촤라라라</div>
                        
  
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
        
        <!-- 카카오맵 -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f77a10ecba4b0e9035d161f9f7eec76"></script>
		<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨 
		    }; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		
		
		



		
		
		

		
		
		
		
		
		
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		            
		            
		            
		            
		            
		        let circleRadius = 1;
				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
				    center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
				    radius: 500, // 미터 단위의 원의 반지름입니다 
				    strokeWeight: 1, // 선의 두께입니다 
				    strokeColor: '#75B8FA', // 선의 색깔입니다
				    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'solid', // 선의 스타일 입니다
				    fillColor: '#CFE7FF', // 채우기 색깔입니다
				    fillOpacity: 0.4  // 채우기 불투명도 입니다   
				}); 

				// 지도에 원을 표시합니다 
				circle.setMap(map); 
 
		            
		            
		            
		            
		            
		            
		            
		            
		            
		            
		            
		            
		       
		      });
		    
		    
		    

			
			
		    
		    
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}
		
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
		
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;
		
		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}  

		
		
		
		
		
		
		
		
		
		// 버튼 색상만 바꾸기
		const lineBtnGr = document.getElementsByClassName('lineBtn-gr');
		
/* 		if(let i=0; i<lineBtnGr.length; i++){
			
			lineBtnGr[i].addEventListner("click",function(){
				this.ClassList.add("selected")
				
				
			})
		} */
		</script>
        
    </body>
    
</html>