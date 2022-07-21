
// 댓글 목록 조회(AJAX)
function selectReplyList() {
    
    // contextPath, boardNo, memberNo 전역 변수 사용
    $.ajax({
        url : contextPath + "/reply/selectReplyList",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
        success : function(rList){
            // rList : 반환 받은 댓글 목록 
            console.log(rList);

            const replyList = document.getElementById("comentArea");
            replyList.innerHTML = ""; 
            
            // rList에 저장된 요소를 하나씩 접근
            for(let r of rList){

                const row = document.createElement("div");
                row.classList.add("reply-row");

                const div1 = document.createElement("div");
                div1.classList.add("d-flex","col-lg-8");

                const imgDiv = document.createElement("div");
                imgDiv.classList.add("flex-shrink-0");
                
                
                const img = document.createElement("img");
                img.classList.add("rounded-circle");
                img.setAttribute("src",contextPath+'/resources/images/user.png');
                img.style.width = '50px';

                imgDiv.append(img);

                const div2 = document.createElement("div");
                div2.classList.add("ms-3");

                const nameDiv = document.createElement("div");
                nameDiv.classList.add("col-lg-8","fw-bold");
                nameDiv.innerText = '관리자';

                // 댓글 내ㅇ
                const contentDiv = document.createElement("div");
                contentDiv.innerText = r.replyContent;

                const btnDiv = document.createElement("div");
                btnDiv.classList.add("col-lg-6");
                
                const profileImg = document.createElement("img");
                profileImg.classList.add("rounded-circle");

                const deleteBtn = document.createElement("button");
                deleteBtn.classList.add("btn", "btn-outline-secondary","mb-2","btn-sm");
                deleteBtn.innerText = "삭제";

                const updateBtn = document.createElement("button");
                updateBtn.classList.add("btn", "btn-outline-secondary","mb-2","btn-sm");
                updateBtn.innerText = "수정";

                
                btnDiv.append(deleteBtn,updateBtn);
                div2.append(nameDiv,contentDiv,btnDiv);
                div1.append(imgDiv,div2);
                row.append(div1);
                replyList.append(row);

            }


        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });



}
