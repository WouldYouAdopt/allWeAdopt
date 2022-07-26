(function($) {
  $.fn.extend({

    roulette: function(options) {

      const defaults = {
        angle: 0,
        angleOffset: -45,
        speed: 5000,
        easing: "easeInOutElastic",
      };

      const opt = $.extend(defaults, options);

      return this.each(function() {
        const o = opt;

        const data = [
					{
            color: '#f25c54',/*남색*/
            text: '꽝~!'
          },
          {
            color: '#f27059',/*파랑 1*/
            text: '+100'
          },
          {
            color: '#f4845f', /* 하늘 2*/
            text: '꽝~!'
          },
          {
            color: '#f79d65', /*초록*/
            text: '+100'
          },
          {
            color: '#f7b267',/*연두*/
            text: '꽝~!'
          },
          {
            color: '#86bbbd',/*노랑*/
            text: '+300'
          },
          {
            color: '#76949f',/*귤*/
            text: ''
          },
          {
            color: '#76949f',/*주황>빨강*/
            text: '꽝~!'
          },
          {
            color: '#76949f',/*빨강*/
            text: ''
          },
          {
            color: '#6a6b83',
            text: 'X2 두배!'
          },
          {
            color: '#5f506b',
            text: '꽝~!'
          },
          {
            color: '#533747',
            text: '+700'
          }
        ];

        const $wrap = $(this);
        const $btnStart = $wrap.find("#btn-start");
        const $roulette = $wrap.find(".roulette");
        const wrapW = $wrap.width();
        const angle = o.angle;
        const angleOffset = o.angleOffset;
        const speed = o.speed;
        const esing = o.easing;
        const itemSize = data.length;
        const itemSelector = "item";
        const labelSelector = "label";
        const d = 360 / itemSize;
        const borderTopWidth = wrapW;
        const borderRightWidth = tanDeg(d);

        for (i = 1; i <= itemSize; i += 1) {
          const idx = i - 1;
          const rt = i * d + angleOffset;
          const itemHTML = $('<div class="' + itemSelector + '">'); // item class추가
          let labelHTML = '';
              labelHTML += '<p class="' + labelSelector + '">'; // label class 추가
              labelHTML += '	<span class="text">' + data[idx].text + '<\/span>';
              labelHTML += '<\/p>';

           $roulette.append(itemHTML);
           $roulette.children("." + itemSelector).eq(idx).append(labelHTML);
           $roulette.children("." + itemSelector).eq(idx).css({ // 룰렛 아이템판 기울이기
            "left": wrapW / 2,
            "top": -wrapW / 2,
            "border-top-width": borderTopWidth,
            "border-right-width": borderRightWidth,
            "border-top-color": data[idx].color,
            "transform": "rotate(" + rt + "deg)"
          });

          const textH = parseInt(((2 * Math.PI * wrapW) / d) * .5);

           $roulette.children("." + itemSelector).eq(idx).children("." + labelSelector).css({
            "height": textH + 'px',
            "line-height": textH + 'px',
            "transform": 'translateX(' + (textH * 1.3) + 'px) translateY(' + (wrapW * -.3) + 'px) rotateZ(' + (90 + d * .5) + 'deg)'
          });

        }

        function tanDeg(deg) {
          const rad = deg * Math.PI / 180;
          return wrapW / (1 / Math.tan(rad));
        }


        $btnStart.on("click", function() {
			if(memberPoint>0){
				
				Swal.fire({
					title: memberPoint +'point 보유 중',
					text: "확인 버튼을 클릭하면 100포인트를 사용합니다.",
					width: 340,		
				    icon: 'warning',
					iconColor: 'rgb(251, 131, 107)',
					showCancelButton: true,
					confirmButtonColor: 'rgb(251, 131, 107)',
					cancelButtonColor: '#999',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							 // '확인'클릭시 수행될 코드 작성
							 rotation();
						}else{
				             // '취소'클릭시 수행될 코드 작성
							e.preventDefault();
						}
					 })
					 
	          
				
			}else{
				Swal.fire({
			     title: '포인트가 부족해 참여하실 수 없습니다',
			     width: 350,
			     padding: '3em',
			     color: 'black',
			     confirmButtonColor: 'rgb(251, 131, 107)',
			     confirmButtonText: '확인'
			     });
			}
        });

        function rotation() {

          const completeA = 360 * r(5, 10) + r(0, 360);
			
           $roulette.rotate({
            angle: angle,
            animateTo: completeA,
            center: ["50%", "50%"],
            easing: $.easing.esing,
            callback: function() {
            	let currentA = 0;
            	currentA = Number($(this).getRotateAngle());

            	console.log(currentA);
              
            	console.log("각도 나머지 값 : "+currentA%360);
            	
               let realval=0;
				if(15<=currentA%360 && currentA%360<45){ // 왼쪽부터 반시계방향
					realval=700;
				}
				if(45<=currentA%360 && currentA%360<75){
					realval=0;
				}
				if(75<=currentA%360 && currentA%360<105){
					realval=2;
				}
				if(105<=currentA%360 && currentA%360<135){
					realval=0;
				}
				if(135<=currentA%360 && currentA%360<165){
					realval=0;
				}
				if(165<=currentA%360 && currentA%360<195){ // 젤아래임
					realval=0;
				}
				if(195<=currentA%360 && currentA%360<225){
					realval=300;
				}
				if(225<=currentA%360 && currentA%360<255){
					realval=0;
				}
				if(255<=currentA%360 && currentA%360<285){
					realval=100;
				}
				if(285<=currentA%360 && currentA%360<315){
					realval=0;
				}
				if(315<=currentA%360 && currentA%360<345){
					realval=100;
				}
				if(345<=currentA%360 && currentA%360<360 || 0<=currentA%360 && currentA%360<15){/*남색*/
					realval=0; //젤 위임
				}
				
				console.log("당첨 포인트 : "+realval);
				console.log("보유 포인트 : "+memberPoint);
				let total;				
				if(realval>1 && realval<10){ // 곱해부러~
				total = Number(memberPoint)*realval;
					
				}else{
				total = Number(memberPoint)+realval-100;
					
				}
				//let total = '룰렛을 돌린 후 결과 값에 따라 연산된 포인트'
				console.log("연산한 포인트 : "+total);
				
				
				$.ajax({
				    url: 'roulette/run', //룰렛 돌아갔을 때
				    type: "get",
				    data:{'total':total},
				    success: function (result) {
				     if(result>=0){
				        // 정상적으로 포인트 변경
				        
				        Swal.fire({
					     title: total+'point 로 변경되었습니다',
					     width: 350,
					     padding: '3em',
					     color: 'black',
					     confirmButtonColor: 'rgb(251, 131, 107)',
					     confirmButtonText: '확인'
					     });
				        memberPoint=result;
				        
				     }else{
				        //반환값이 이상할 때
				     }
				    }, error(request, status, error) {
				        console.log("AJAX 에러 발생");
				        console.log("상태코드 : " + request.status); // 404, 500
				    }
				})



				
            },
            duration: speed
          });
        }

        function r(min, max) {
          return Math.floor(Math.random() * (max - min + 1)) + min;
        }

      });
    }
  });
})(jQuery);

$(function() {

  $('.box-roulette').roulette();

});