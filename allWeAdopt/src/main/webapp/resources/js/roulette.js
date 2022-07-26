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
            color: '#3f297e',/*남색*/
            text: '+200'
          },
          {
            color: '#1d61ac',/*파랑 1*/
            text: '+1000'
          },
          {
            color: '#169ed8', /* 하늘 2*/
            text: '+2000'
          },
          {
            color: '#209b6c',
            text: '+3000'
          },
          {
            color: '#60b236',
            text: '+4000'
          },
          {
            color: '#efe61f',
            text: '+5000'
          },
          {
            color: '#f7a416',
            text: '+6000'
          },
          {
            color: '#e6471d',
            text: '+7000'
          },
          {
            color: '#dc0936',
            text: '+8000'
          },
          {
            color: '#e5177b',
            text: '+9000'
          },
          {
            color: '#be107f',
            text: '꽝~!'
          },
          {
            color: '#881f7e',
            text: '+100'
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
          rotation();
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
				if(15<=currentA%360 && currentA%360<45){
					realval=100;
				}
				if(45<=currentA%360 && currentA%360<75){
					realval=0;
				}
				if(75<=currentA%360 && currentA%360<105){
					realval=9000;
				}
				if(105<=currentA%360 && currentA%360<135){/*빨강*/
					realval=8000;
				}
				if(135<=currentA%360 && currentA%360<165){
					realval=7000;
				}
				if(165<=currentA%360 && currentA%360<195){
					realval=6000;
				}
				if(195<=currentA%360 && currentA%360<225){/*노랑*/
					realval=5000;
				}
				if(225<=currentA%360 && currentA%360<255){
					realval=4000;
				}
				if(255<=currentA%360 && currentA%360<285){
					realval=3000;
				}
				if(285<=currentA%360 && currentA%360<315){
					realval=2000;
				}
				if(315<=currentA%360 && currentA%360<345){
					realval=1000;
				}
				if(345<=currentA%360 && currentA%360<360 || 0<=currentA%360 && currentA%360<15){/*남색*/
					realval=200;
				}
				
				console.log("당첨 포인트 : "+realval);
				console.log("보유 포인트 : "+memberPoint);

				//let total = '룰렛을 돌린 후 결과 값에 따라 연산된 포인트'
				let total = Number(memberPoint)+realval;
				console.log("연산한 포인트 : "+total);
				
				
				$.ajax({
				    url: 'roulette/run', //룰렛 돌아갔을 때
				    type: "get",
				    data:{'total':total},
				    success: function (result) {
				     if(result>0){
				        // 정상적으로 포인트 변경
				        alert("포인트 획득 어쩌고~");
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