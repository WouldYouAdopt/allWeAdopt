// 댓글 목록 조회
function selectReplyList(){

    $.ajax({
        url : contextPath + "/shelter/reply/selectReplyList",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", 
        success : function(rList){

            console.log(rList);

            const replyList = document.getElementById("reply-list");

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }

    });



}