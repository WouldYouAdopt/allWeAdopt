console.log("js");

function likeFunc(loginMember,boardNo,likeNo) {
    //좋아요 아이콘 클릭 시 변경
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
    console.log("dd");
}

const likeIcon = document.getElementById('likeIcon');
const iconValue = document.getElementsByClassName("iconValue")[0];
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
