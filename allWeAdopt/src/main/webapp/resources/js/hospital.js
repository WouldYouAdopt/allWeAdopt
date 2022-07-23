const url = 'http://openapi.seoul.go.kr:8088/58717a6e5463686f3130306d58694a4f/json/LOCALDATA_020301/1/100/';

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨 
	    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 여기까지 기본 맵 생성
		
		
		
		
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
	            
	          // 반경표시
				    //지도에 표시할 원을 생성합니다
		        var circle = new kakao.maps.Circle({
		            center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 (현재 위도경도)
		            radius: 500, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 1, // 선의 두께입니다 
		            strokeColor: '#75B8FA', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid', // 선의 스타일 입니다
		            fillColor: '#CFE7FF', // 채우기 색깔입니다
		            fillOpacity: 0.3  // 채우기 불투명도 입니다   
		        });
	      
		     	// 지도에 원을 표시합니다 
		        circle.setMap(map); 
	            
	            
            // 안해 파일 안불러올거야 
            //var hospital = JSON.parse(DESCRIPTION);
	          
            //console.log("파일왔냐구 데이터"+hospital[0].bplcnm); 
	            
				    // 병원정보 요청받아오기
		        fetch(url)
		        .then((res) => res.json())
				.then((hospital) =>{
				
		        	//console.log(JSON.stringify(hospital, null , 1));
					
		            var markers = [];
		            
		            var results = hospital.LOCALDATA_020301.row;
		               
		            
		            //console.log(results.length);
		            
					// 병원이름
		            const names = new Array();
		            
		            for (let i=0; i<results.length; i++){

						//names.push(results[i].BPLCNM);
					
		            	// WTM 좌표 
		                //console.log("X좌표"+results[i].X);
		                //console.log("Y좌표"+results[i].Y);
		                //console.log("주소"+results[i].RDNWHLADDR);
		                //console.log("타이틀"+results[i].BPLCNM);
		                

						
						// 이좌표가 아니고 변환해야함
		                
		                
		              // 좌표 위경도로 변환하기
			            // 좌표관련
			            var geocoder = new kakao.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
						    wtmX = results[i].X, // 변환할 WTM X 좌표 입니다
						    wtmY = results[i].Y; // 변환할 WTM Y 좌표 입니다
						
						// WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
						geocoder.transCoord(wtmX, wtmY, transCoordCB, {
						    input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
						    output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
						});
		        
			//console.log(result);
						
            // 마커 생성을 for로 어떻게?? 콜백인데 어떻게 인덱스 쓰면되는거임??
            // 마커에 표시할 인포윈도우를 생성합니다 
            //var infowindow = new kakao.maps.InfoWindow({
              //content: positions[i].content // 인포윈도우에 표시할 내용
            //});






					// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
					function transCoordCB(result, status) {

						//console.log(names)
					    // 정상적으로 검색이 완료됐으면 
					    if (status === kakao.maps.services.Status.OK) {

					        // 마커를 변환된 위치에 표시합니다
					        var marker = new kakao.maps.Marker({
					            position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
					            map: map, // 마커를 표시할 지도객체입니다
					            title: results[i].BPLCNM // 여기에 정보 for문 어떻게 세팅함
					        })
					        
					        // results[i].BPLCNM
					        var iwContent = '<div class="info-title">'+results[i].BPLCNM+'<div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    		iwPosition = new kakao.maps.LatLng(result[0].y, result[0].x), //인포윈도우 표시 위치입니다
				    		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				    
							var infowindow = new kakao.maps.InfoWindow({
							    //map: map, // 인포윈도우가 표시될 지도
							    position : iwPosition, 
							    content : iwContent,
							    removable : iwRemoveable
							});
							
							
							
							
							// ************ 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								
								// 이전에 클릭한건 꺼지게 ************
								// 클릭한거말고 다른것들......은 어떻게 선택함
								
								if($('.info-title').parent().parent()){
									$('.info-title').parent().parent().remove();
								}
								
							    // 마커 위에 인포윈도우를 표시합니다
							    infowindow.open(map, marker);  
							      
							      
								// 클릭해서 보이는 인포윈도우를 클릭하면!
								document.getElementsByClassName('info-title')[0].addEventListener('click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      alert("111111");
								      
								      
								      
								      
								});
							      
							});
							
							
							
							
										        
					    }
					    
					    
					    
					    
					    
					    
					    

					    
					}
					
					
					
					
					
							



							
					
					
					
					
					
					
					
		                
            //infowindow.open(map, marker); 
            markers.push(marker);
		                



					} // for문끝




	        // 강제로 css바꿔주기 // 엘리먼트 선택이 잘 안되네
			var infoTitle = document.querySelectorAll('.info-title');
			
			infoTitle.forEach(function(e) {
			    e.parentElement.style.top = "82px";
			});
	       	
	       	// 엘리먼트 선택 다시시도... 선택해야 클릭이벤트 주지  
	            	
	        for(let q=0; q<infoTitle.length; q++){
				infoTitle[q].addEventListener("click",function(){
					alert('뜨냐구');
					
				})
			}   	
	            	
            		






				}); //then

	        

	            
	            
	            

	      
	      
	     
	     
	     
	     // 마커를 표시할 위치와 title 객체 배열입니다 
	        var positions = [
	            {
	                title: '서울시야생동물센터', 
	                latlng: new kakao.maps.LatLng(37.4680260, 126.959275)
	            },
	            {
	                title: '동작구청', 
	                latlng: new kakao.maps.LatLng(37.5125090, 126.939920)
	            },
	            {
	                title: '보라매공원', 
	                latlng: new kakao.maps.LatLng(37.4926473, 126.919096)
	            },
	            {
	                title: '롯데백화점 관악점',
	                latlng: new kakao.maps.LatLng(37.4905249, 126.925035)
	            }
	        ];
	     
	     
	     // 마커 이미지의 이미지 주소입니다
	        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	            
	        for (var i = 0; i < positions.length; i ++) {
	            
	            // 마커 이미지의 이미지 크기 입니다
	            var imageSize = new kakao.maps.Size(40); 
	            
	            // 마커 이미지를 생성합니다    
	            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	            
	            // 마커를 생성합니다
	            var marker = new kakao.maps.Marker({
	                map: map, // 마커를 표시할 지도
	                position: positions[i].latlng, // 마커를 표시할 위치
	                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	                image : markerImage // 마커 이미지 
	            });
	        }
	     
	     
	        
	        
	        
	      
	            
		});
	    	
	   
	   
	   
	   
	   




 	
	    	
	// 아래로 쭉 geolocation 관련 마커
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
	        iwRemoveable = false;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    //infowindow.open(map, marker);
	    

	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);    
	    
	    
	    
	    



  
	}    
	
	
	

	
