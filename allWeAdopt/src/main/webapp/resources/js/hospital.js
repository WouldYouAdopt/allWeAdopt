const url = 'http://openapi.seoul.go.kr:8088/58717a6e5463686f3130306d58694a4f/json/LOCALDATA_020301/1/200/';

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
		        var circle0 = new kakao.maps.Circle({
		            center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 (현재 위도경도)
		            radius: 1000, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 1, // 선의 두께입니다 
		            strokeColor: '#2181df', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid', // 선의 스타일 입니다
		            fillColor: '#CFE7FF', // 채우기 색깔입니다
		            fillOpacity: 0.3  // 채우기 불투명도 입니다   
		        });
	      		
	      		var circle1 = new kakao.maps.Circle({
		            center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 (현재 위도경도)
		            radius: 2000, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 1, // 선의 두께입니다 
		            strokeColor: '#2181df', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid', // 선의 스타일 입니다
		            fillColor: '#CFE7FF', // 채우기 색깔입니다
		            fillOpacity: 0.3  // 채우기 불투명도 입니다   
		        });
		        
		        var circle2 = new kakao.maps.Circle({
		            center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 (현재 위도경도)
		            radius: 5000, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 1, // 선의 두께입니다 
		            strokeColor: '#2181df', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid', // 선의 스타일 입니다
		            fillColor: '#CFE7FF', // 채우기 색깔입니다
		            fillOpacity: 0.3  // 채우기 불투명도 입니다   
		        });
	      		
		     	// 지도에 원을 표시합니다 
		        circle0.setMap(map); 

	      		const num0 = document.getElementsByClassName('lineBtn-gr')[0];
	      		const num1 = document.getElementsByClassName('lineBtn-gr')[1];
	      		const num2 = document.getElementsByClassName('lineBtn-gr')[2];
	      		
	      		num0.addEventListener("click",function(){
					num1.classList.remove('selected');
					num2.classList.remove('selected');
					this.classList.add('selected');
					circle1.setMap(null); 
					circle2.setMap(null); 
					circle0.setMap(map); 
				})
	      		num1.addEventListener("click",function(){
					num0.classList.remove('selected');
					num2.classList.remove('selected');
					this.classList.add('selected');
					circle0.setMap(null); 
					circle2.setMap(null); 
					circle1.setMap(map); 
				})
	      		num2.addEventListener("click",function(){
					num0.classList.remove('selected');
					num1.classList.remove('selected');
					this.classList.add('selected');
					circle0.setMap(null); 
					circle1.setMap(null); 
					circle2.setMap(map); 
				})
	            
	            
            // 안해 파일 안불러올거야 
            //var hospital = JSON.parse(DESCRIPTION);
	          
				    // 병원정보 요청받아오기
		        fetch(url)
		        .then((res) => res.json())
				.then((hospital) =>{
				
		            var markers = [];
		            
		            var results = hospital.LOCALDATA_020301.row;
		            
		            //marker_icon.png
					const imageSrc = contextPath+"/resources/images/marker_icon.png"; 
					
					// 생성된 infowindow 넣을 배열
		            const info = new Array();
		            
		            for (let i=0; i<results.length; i++){

						// 이좌표가 아니고 변환해야함
		                
		                if(results[i].DTLSTATENM=='정상'){
			
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
							
							// 마커 이미지의 이미지 크기 입니다
				            var imageSize = new kakao.maps.Size(37); 
				            
				            // 마커 이미지를 생성합니다    
				            var imageOption = {offset: new kakao.maps.Point(22, 50)};
				            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption); 
				            
					        // 마커를 변환된 위치에 표시합니다
					        var marker = new kakao.maps.Marker({
					            position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
					            map: map, // 마커를 표시할 지도객체입니다
					            image : markerImage 
					            //title: results[i].BPLCNM // 여기에 정보 for문 어떻게 세팅함
					        })
					        
					        // results[i].BPLCNM
					        var iwContent = '<div class="info-title">'+results[i].BPLCNM+'<div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    			iwPosition = new kakao.maps.LatLng(result[0].y, result[0].x); //인포윈도우 표시 위치입니다
				    		//iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				    		

				
							// ************ 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
							
							
  
//							const info = new Array();

								//if($('.info-title').length>0){
									//alert('11');
									//infowindow.close();
								//}
								
				    		// 인포윈도우 생성
							var infowindow = new kakao.maps.InfoWindow({
							    map: map, // 인포윈도우가 표시될 지도
							    position : iwPosition, 
							    content : iwContent,
							    //removable : iwRemoveable
							});
							info.push(infowindow);
								// 이전에 클릭한건 꺼지게 ************
								// 클릭한거말고 다른것들......은 어떻게 선택함
								//const infos = new Array();
								//infos.push(infowindow); // 생성하면 다 넣음
								
								for(let ww in info){
									info[ww].close();
								}
								//infowindow,close();
							    // 마커 위에 인포윈도우를 표시합니다
							    

			
							    infowindow.open(map, marker);  
							    


							    //info.push(infowindow);
							      
								// 클릭해서 보이는 인포윈도우를 클릭하면!
								//document.getElementsByClassName('info-title')[0].addEventListener('click', function() {
								    // 마커 위에 인포윈도우를 표시합니다
								    //alert(results[i].BPLCNM);
									document.getElementById("hosList").innerHTML='<p><span style="font-size:34px; font-weight:700; color:#555;">'+results[i].BPLCNM +'</span><span style="color:#999; padding-left:10px; font-size:22px;">'+results[i].SITETEL+'</span></p><hr>'
																				+ results[i].RDNWHLADDR
																				+'<br><span style="color:#aaa;">('+ results[i].SITEWHLADDR+')</span>';
								      
								//});
							      
							});
							
							
				// 인포윈도우 위치 바꾸기 // 클릭이벤트 안에서는 가능......... 아니면 어디넣냐고
				if(infoTitle){
					
				const infoTitle = document.getElementsByClassName('info-title');			
				let topNum=0;
				console.log(infoTitle[0].parentElement.parentElement.style.top);
				console.log(Number(infoTitle[0].parentElement.parentElement.style.top.replace('px',''))+50);
				topNum = (Number(infoTitle[0].parentElement.parentElement.style.top.replace('px',''))+32)*1;
				
				infoTitle[0].parentElement.parentElement.style.top=topNum+'px';
				infoTitle[0].parentElement.parentElement.style.width='20px';
				}
				
				
				
										        
					    }
					    
					}
							
            //infowindow.open(map, marker); 
           // markers.push(marker);

					} // for문끝

	        // 강제로 css바꿔주기 // 엘리먼트 선택이 잘 안되네
			const infoTitle = document.getElementsByClassName('info-title');
			
/*			infoTitle.forEach(function(e) {
			    e.parentElement.parentElement.style.border = "1px solid #ff0000;";
			});*/
	       	
	       	// 엘리먼트 선택 다시시도... 선택해야 클릭이벤트 주지  

		
	        for(let q=0; q<infoTitle.length; q++){
				infoTitle[0].parentElement.parentElement.style.top='100px';
				infoTitle[0].parentElement.parentElement.style.width='20px';
			}   	
	            	



					}
					
				}); //then

	        

	            
	            
	            

	      
	      
	     
	     
	     
	     
	     

	     
	     
	        
	        
	        
	      
	            
		});
	    	
	   
	   
	   
	   
	   




 	
	    	
	// 아래로 쭉 geolocation 관련 마커
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}



	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		
		const imageSrc = contextPath+"/resources/images/marker_icon2.png";
		var imageSize = new kakao.maps.Size(94);
		var imageOption = {offset: new kakao.maps.Point(45, 76)};
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption); 

		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition,
	        image: markerImage
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
	
	
	

	
