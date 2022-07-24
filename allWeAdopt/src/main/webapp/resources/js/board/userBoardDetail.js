function likeFunc(loginMember,boardNo,likeNo) {
    //좋아요 아이콘 클릭 시 DB 등록
	$.ajax({
		url: "likeRegist",
		contentType: "application/json",
		dataType: "json",
		type: "GET",
		data: {
			"memberNo" : loginMember,
            "boardNo" : boardNo,
            "likeNo" : likeNo
		},
		success: function(result){
			if(result > 0){
                if(likeNo==0){
                    alert("관심동물로 등록되었습니다");
                }else{
                    alert("관심동물이 해제되었습니다");
                }
            }
		},
		error: function (request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}



// 좋아요 아이콘 변경
const likeIcon = document.getElementById('likeIcon');
const iconValue = document.getElementsByClassName("iconValue")[0];
const loginMember = document.getElementById("loginMember").value;

likeIcon.addEventListener("click",function() {
    const likeNo = document.getElementsByClassName('iconValue')[0].value;
    if(iconValue.value == 0){
        likeIcon.innerHTML= '&#x2665;';
        iconValue.value = 1;
    }else{
        likeIcon.innerHTML='&#x2661;';
        iconValue.value = 0;
    };
   
    likeFunc(loginMember,boardNo,likeNo);
});

// 트위터 공유 기능
function shareTwitter() {
    const url = "/localhost:8081/allWeAdopt/board/detail/2/"+boardNo;
    var sendText = "allWeAdopt"; // 전달할 텍스트
    var sendUrl = encodeURIComponent(url); // 전달할 URL
    // var sendUrl = "devpad.tistory.com/"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

//페이스북 공유 기능
function shareFacebook() {
    const url = "http://localhost:8081/allWeAdopt/board/detail/2/"+boardNo;
    var sendUrl = encodeURIComponent(url); // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?href=" + sendUrl);
}

// function sethref() 
// {
//  document.getElementById("shareFB").setAttribute("href","https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(document.URL));
// }

// window.onload = sethref;
// 카카오톡 공유 기능
function shareKakao() {
    const url = "http://localhost:8081/allWeAdopt/board/detail/2/"+boardNo;

    // 사용할 앱의 JavaScript 키 설정
    Kakao.init('c2a34c4788a9b6f5a1d552ea9a4f9083');
   
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
      container: '#btnKakao', // 카카오공유버튼ID
      objectType: 'feed',
      content: {
        title: "allWeAdopt", // 보여질 제목
        description: "동물입양 사이트입니다", // 보여질 설명
        imageUrl: "http://localhost:8081/allWeAdopt/", // 콘텐츠 URL
        link: {
           mobileWebUrl: url,
           webUrl: url
        }
      }
    });
  }

// 삭제 버튼 클릭 시
function deleteBtn() {
    if (confirm("정말 삭제하시겠습니까??") == true){ 
                alert("게시글이 삭제되었습니다");
                return true;
            }else{
                return false;
            }
}

// 로그인하지 않았을 때 문의하기 버튼 클릭 시
function inquiryFunc() {
    const inquiryValue = document.getElementsByName('inquiryValue')[0];
    let message = null;
    if(inquiryValue.value==0){
        message = "로그인이 필요한 기능입니다. 로그인 페이지로 이동합니다";
    }else if(inquiryValue.value==1){
        message = "관리자는 이용할 수 없는 기능입니다";
    }else{
        message = "본인이 작성한 게시글에는 문의할 수 없습니다";
    }

    Swal.fire({
        title: message,
        width: 600,
        padding: '3em',
        color: 'black',
        confirmButtonColor: 'rgb(251, 131, 107)',
        confirmButtonText: '확인'
        }).then((result) => {
            if (result.isConfirmed && inquiryValue.value==0) {
                location.href= contextPath+"/member/login";
            }
         });

}