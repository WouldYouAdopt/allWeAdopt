<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>




<!DOCTYPE html>
<html lang="en">
    
<head>
    <title>Welcome</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <style>
    /* css 정리코드 : 여백없애고 선 없애고 그런것듯(많이들 쓴다고함 ???) */
    html { 
        height:100%;
        font-family:sans-serif;
        -webkit-text-size-adjust:100%;
        -ms-text-size-adjust:100%;
        -webkit-tap-highlight-color:rgba(0,0,0,0)
    }
    body{
        height:100%;
        -webkit-font-smoothing:antialiased;
        font-smoothing:antialiased;
        -webkit-overflow-scrolling:touch;
        overflow-scrolling:touch;
        }
    html,body,div,span,applet,object,iframe,
    figure,h1,h2,h3,h4,h5,h6,p,blockquote,pre,
    a,abbr,acronym,address,big,cite,code,del,dfn,
    em,font,img,ins,kbd,q,s,samp,small,strike,strong,
    sub,sup,tt,var,dl,dt,dd,ol,ul,li,fieldset,form,label,
    legend,table,caption,tbody,tfoot,thead,tr,th,td{
        margin:0;padding:0;border:0
    }
    article,aside,details,figcaption,figure,
    footer,header,hgroup,main,nav,section,summary{
        display:block
    }
    div,article,section,p,ul,li,span,label{
        box-sizing:border-box
    }
    /* 여기까지 정리 코드 끗! */

    /* 배경컬러 */
    body{
        background:  rgb(251, 131, 107);
    }


    #cover-canvas{
        /* 앱솔루트처럼 절대위치인데 고정값 스크롤을 내려도 값이 변하지않음 */
        position:fixed;
        top:0;
        left:0;
    }


    .video-wrapper{
        /* 비디오를 가운데로 고정 */
        display:flex;
        justify-content:center;
        align-items:center;

        /* 이거 없으면 스크롤 내릴때 비디오가 바운싱되면서 영상이 삐져나와 보여짐. */
        overflow:hidden;

        /* 스크롤바 움직일때, 오브젝트들 고정용. */
        position:fixed;
        top:0;
        left:0;

        /* 크기지정 브라우저 창에 딱 맞게하면 vw?vh? 를 쓰나봄.. -> 뷰포트인데 브랑우저 창사이즈를 딱 맞게한다구함.*/
        width:100vw;
        height:100vh;
    }


    #video-studiomeal{
        transform:scale(1)
    }

    .video-size{
        width : 850px;
        height: 300px;
        object-fit: fill;
    }

    .down{
        color: white;
        z-index: 1;
        position: absolute;
        left: 49.1%;
        top: 10%;
        font-size: 10pt;
    }

    .down1{
        color: white;
        z-index: 1;
        position: absolute;
        left: 50%;
        top: 17%;
        font-size: 10pt;
    }

    .down-mouse{
        color: white;
        z-index: 3;
        position: absolute;
        left: 49%;
        top: 13%;
        font-size: 20pt;


    }
    .down-mouse > img{
        width: 30px;
    }



    </style>
    
</head>

<body  style="height: 3000px;">

    <div class="down"> scroll </div>
    <div class="down-mouse" ><img src="${contextPath}/resources/images/mouse1.png" alt=""></div>
    <!-- <div class="down1"> ↓ </div> -->

    <div OnClick="location.href = '${contextPath}/main'" style="cursor:pointer;">

        <!-- 비디오를 감싸는 div -->
        <div class="video-wrapper">
            <video class="video-size" muted="" playsinline="" autoplay="" loop="" id="video-studiomeal" src="https://images.apple.com/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/overview/primary/hero/large_2x.mp4" style="transform: scale(1);"></video>
        </div>
    
        <!-- canvas : 아이폰의 커지는 X랑 아이폰이미지가 들어가는 공간 -->
        <!-- cover : 비디오 위에 X가 덮으니까 커버캔버스라고 많이 함 -->
        <canvas id="cover-canvas" width="1592" height="638" style="width: 796px; height: 319px;"></canvas>
    </div>
    
 <script>
    'use strict';
    (function(){
        var elemCanvas,
            elemVideo,
            elemPhone, // 이미지 엘리먼트 : 아이폰 
            context,
            windowWidth=0, // 브라우저 폭
            windowHeight=0, // 브라우저 높이
            canvasWidth=0, // 캔버스폭(브라우저 폭에 맞춤)
            canvasHeight=0, // 캔버스 높이( 브라우저 높이에 맞추기)
            scrollY=0, // 현재스크롤 위치
            relativeScrollY=0, //  각 키프레임에서 사용하는 상대적인 스크롤 위치
            prevDurations=0, /// 이전 키프레임까지의 duration
            totalScrollHeight=0, // 스크롤을 할 수 있는 전체 높이(body높이로 세팅)
            currentKeyframe=0, // 현재 키프레임(0,1)
            phoneWidth=3500, // 아이폰 이미지 기본 크기.
            phoneHeight=2500, // 아이폰 이미지 기본 크기.
            resizeHandler,
            scrollHandler,
            render,
            drawCanvas,
            calcAnimationValue,
            calcFinalValue,
            init,
            pixelDuration=0,

            // 각 키프레임별로 애니메이션으로 처리해야할 수치들을 배열로 2개만듬.
            keyframes=[
                {
                    animationValues:{
                        videoScale:[1,2], // 비디오 크기의 시작값, 마지막값 ( 애니메이션 시작크기 1배, 끝크기 2배 )
                        triangleMove:[0,200], // x가 커지는 구간.
                        rectangleMove:[0,500]
                    }
                },
                {
                    animationValues:
                    {
                        videoScale:[2,0.5], // 비디오 크기가 스크롤 중반이후로 작아지는 값 설정( 애니메이션 시작크기 2배에서 , 끝크기 0.5배 )
                        triangleMove:[200,1000], // x가 급격히 커지는 구간. ( 차이가 클수록 애니메이션이 빠르게 진행됨)
                        rectangleMove:[500,500] 
                    }
                }
                ],

            
                elemBody=document.body,     // document.body 를 변수 설정.
                elemCanvas=document.getElementById('cover-canvas'), // 캔버스 id 들고오기 
                context=elemCanvas.getContext('2d'); // 캔버스에서 작업을 할때 들고오는 Context 객체 / 나중에 캔버스 기초 찾아보기 -> 저수준 api인데 재밌다함.
                elemVideo=document.getElementById('video-studiomeal'); // 비디오 id 들고오기 

            // init 초기화하는 함수
            init=function(){
                    windowWidth=window.innerWidth; // 브라우저 창크기 가져오기 
                    windowHeight=window.innerHeight; // 브라우저 창크기 가져오기 
                    
                    // *함수 실행 ( 아래의 )
                    resizeHandler();
                    render(); // 그림을 실제로 그려주는 용도의 함수.
                    
                    window.addEventListener('resize',function(){ // resize : 창 크기가 바뀔때마다 
                       
                        requestAnimationFrame(resizeHandler);
                    });

                    window.addEventListener('scroll',function(){ // scroll : 스크롤이 움직일 때 마다.
                        requestAnimationFrame(scrollHandler);
                    });

                    elemPhone=document.createElement('img');
                    elemPhone.src='${contextPath}/resources/images/intro.png';
                    elemPhone.addEventListener('load',function(){
                        drawCanvas();
                    });
            };
            
            // 브라우저 창 사이즈가 변화할 때(=resizeHandler 가 발생할 때)
            resizeHandler=function(){
                var i;
                windowWidth=window.innerWidth;
                windowHeight=window.innerHeight;
                totalScrollHeight=0; // 위에 선언한 -> 스크롤을 할 수 있는 전체 높이(body높이로 세팅) -> 타임라인이 스크롤 위치여서 스크롤 위치를 지정
                pixelDuration=0.5*windowHeight; // Duration : 애니메이션의 지속시간 == 여기서 스크롤 높이 == 0.5*windowHeight; 윈도우 높이의 절반

                
                for(i=0;i<keyframes.length;i++){
                    // 위에 선언한 키프레임 만큼 pixelDuration값을 더해주면 == 전체 스크롤할 높이 정해짐. -> 키프레임 크기가 늘어나면 얘 값도 늘어남 
                    totalScrollHeight+=pixelDuration;
                }
                totalScrollHeight+=windowHeight;

                elemBody.style.height=totalScrollHeight+'px'; // Body의 크기를 위에 계산한  totalScrollHeight px 로 선언(스크롤 되는게Body니까 )
                elemCanvas.width=canvasWidth=windowWidth*2; // 윈도우 폭에 2배 (왜? 고해상도 이미지 처리때문이라함 잘모름.)
                elemCanvas.height=canvasHeight=windowHeight*2; // 이건 높이 2배 
                elemCanvas.style.width=windowWidth+'px'; // 이건 2배된거 다시 줄이는거 
                elemCanvas.style.height=windowHeight+'px'; // 이것도 2배된거 다시 줄이는거
            };


            scrollHandler=function(){
                scrollY=window.pageYOffset;
                
                //스크롤 범위를 안전하게 제한 	
                if(scrollY<0||scrollY>(totalScrollHeight-windowHeight)){ // scrollY현재 스크롤된 위치
                    return;
                }


                if(scrollY>pixelDuration+prevDurations){
                    prevDurations+=pixelDuration;
                    currentKeyframe++;
                }

                else if(scrollY<prevDurations){
                    currentKeyframe--;
                    prevDurations-=pixelDuration;
                }
                relativeScrollY=scrollY-prevDurations;
                render();
            };
            

            // 위에 선언한   render(); 의 함수.
            render=function(){
                //  비디오크기       X모양에 관련된거    
                var videoScale,triangleMove,rectangleMove;
                
                if(keyframes[currentKeyframe]){
                    videoScale=calcAnimationValue(keyframes[currentKeyframe].animationValues.videoScale);
                    triangleMove=calcAnimationValue(keyframes[currentKeyframe].animationValues.triangleMove);
                    rectangleMove=calcAnimationValue(keyframes[currentKeyframe].animationValues.rectangleMove);
                }else{
                    return;
                }

                elemVideo.style.transform='scale('+videoScale+')';
                
                context.clearRect(0,0,canvasWidth,canvasHeight);

                if(elemPhone){
                    drawCanvas(videoScale,triangleMove,rectangleMove);
                }};
                
                calcAnimationValue=function(values){
                    return(relativeScrollY/pixelDuration)*(values[1]-values[0])+values[0];
                };


                
               // X 그리는 공간  render=function() 에서 호출하는 애임.
               drawCanvas=function(videoScale,triangleMove,rectangleMove){
                    var videoScale=videoScale||1,
                    triangleMove=triangleMove||0,
                    rectangleMove=rectangleMove||0;

                    context.save();
                    context.translate((canvasWidth-phoneWidth*videoScale)*0.5,(canvasHeight-phoneHeight*videoScale)*0.5);
                    context.drawImage(elemPhone,0,0,phoneWidth*videoScale,phoneHeight*videoScale);
                    context.restore();
                    
                    
                    // 박스 상, 하
                    context.fillStyle='rgb(251, 131, 107)';
                    context.fillRect(0,canvasHeight*0.5-2000-rectangleMove,canvasWidth,2000);
                    context.fillRect(0,canvasHeight*0.5+0+rectangleMove,canvasWidth,2000);
                    };
                    init();
                })();

 </script>
    
    
</body>

</html>


