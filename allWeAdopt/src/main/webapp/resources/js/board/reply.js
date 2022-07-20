
// 댓글 목록 조회(AJAX)
function selectReplyList(){
    
    // contextPath, boardNo, memberNo 전역 변수 사용
    $.ajax({
        url : contextPath + "/reply/selectReplyList",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
        success : function(rList){
            // rList : 반환 받은 댓글 목록 
            console.log(rList);

            // rList에 저장된 요소를 하나씩 접근
            for(let reply of rList){

                const contentDiv = document.createElement("div");
                const btnDiv = document.createElement("div");

                const updateBtn = document.createElement("button");
                const deleteBtn = document.createElement("button");

                updateBtn.classList.add("btn");

                // divTag2.classList.add("class1", "class2", "class3"); // 클래스 여러개

            }


        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}
