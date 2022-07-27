
// 즉시 실행 함수
(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if(goToListBtn != null){ // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){


          let  url = contextPath + "/shelter/pamphlet/list?"; 


            // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
            // location.href : 현재 페이지 주소 + 쿼리스트링
            // URL.searchParams : 쿼리 스트링만 별도 객체로 반환

            // http://localhost:8080/community/board/detail?no=249&cp=6&type=1&key=c&query=9
            const params = new URL(location.href).searchParams;
           
            let cp;

            if(params.get("cp") != null){ // 쿼리스트링에 cp가 있을 경우
                cp =  "cp=" + params.get("cp");     
            }else{
                cp = "cp=1";
            }

            url += cp;

            location.href = url; 

        });
    }

})();


(function(){
    const deleteBtn = document.getElementById("deleteBtn"); // 존재하지 않으면 null

    if(deleteBtn != null){ // 버튼이 화면에 존재할 때
        deleteBtn.addEventListener("click", function(){
            // 현재 : detail?no=1508&cp=1&type=1

            // 목표 : delete?no=1508&type=1

            let url = contextPath + "/shelter/pamphlet/delete/" + boardNo;

            Swal.fire({
                title: '전단지를 삭제 하시겠습니까?',
                text: "확인 버튼을 클릭하면 전단지가 삭제됩니다.",
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
                         location.href = url;
                    }else{
                         // '취소'클릭시 수행될 코드 작성
                        e.preventDefault();
                    }
                 })


            // if( confirm("정말로 삭제 하시겠습니까?") ){
            //     location.href = url; // get방식으로 url에 요청

                

            // }

        });
    }

})();



// 트위터
function shareTwitter() {
    var sendText = "allWeAdopt"; // 전달할 텍스트
    var sendUrl ="http://kh-classa.xyz/allWeAdopt"  + "/shelter/pamphlet/detail/" + boardNo; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}


// 페이스북
// 고정 IP라서 지금 오류남
function shareFacebook() {
    var sendUrl = "http://kh-classa.xyz/allWeAdopt" + "/shelter/pamphlet/detail/" + boardNo; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}


// 로컬호스트여서 보내지기만 가능
// 카카오톡 공유하기
function shareKakao() {
 
    // 사용할 앱의 JavaScript 키 설정
    Kakao.init('69933a089a5ecd291058167064475d66');
   
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
      container: '#btnKakao', // 카카오공유버튼ID
      objectType: 'feed',
      content: {
        title: "allWeAdopt", // 보여질 제목
        description: "allWeAdopt입니다", // 보여질 설명
        imageUrl: "http://kh-classa.xyz/allWeAdopt" + "/resources/images/intro.png",
        // "http://localhost:8081/allWeAdopt/shelter/pamphlet/detail/" + boardNo, // 콘텐츠 URL
        link: {
        //    mobileWebUrl: "devpad.tistory.com/",
           webUrl: "http://kh-classa.xyz/allWeAdopt"
        }
      }
    });
  }


// 위로 가기 버튼
mybutton = document.getElementById("myBtn");

if(mybutton != null){

  window.onscroll = function() {scrollFunction()};

  function scrollFunction() {
    if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }


  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0; 
  }

}

// 전단지 다운
function download(){
  var download = document.getElementById("download");
  var image = document.getElementById("myCanvas").toDataURL("image/png").replace("image/png", "image/octet-stream");



  download.setAttribute("href", image);

}






