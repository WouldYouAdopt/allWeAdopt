
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
                div1.classList.add("d-flex");

                const imgDiv = document.createElement("div");
                imgDiv.classList.add("flex-shrink-0");
                
                
                const img = document.createElement("img");
                img.classList.add("rounded-circle");
                img.setAttribute("src",contextPath+'/resources/images/user.png');
                img.style.width = '50px';
                
                imgDiv.append(img);
                
                const div2 = document.createElement("div");
                div2.classList.add("ms-3");
                div2.style.width = '100%';
                
                const nameDiv = document.createElement("div");
                nameDiv.classList.add("col-lg-8","fw-bold");
                nameDiv.innerText = '관리자';
                
                // 댓글 내ㅇ
                const contentDiv = document.createElement("div");
                contentDiv.classList.add("col-lg-10", "col-sm-10","mb-1");
                contentDiv.innerText = r.replyContent;
                
                const btnDiv = document.createElement("div");
                btnDiv.classList.add("col-lg-6");
                
                const profileImg = document.createElement("img");
                profileImg.classList.add("rounded-circle");
                
                const updateBtn = document.createElement("button");
                updateBtn.classList.add("btn", "btn-outline-secondary","mb-2","btn-sm","me-1");
                updateBtn.innerText = "수정";
                updateBtn.setAttribute("onclick","showUpdateReply("+ r.replyNo+", this)");
                
                const deleteBtn = document.createElement("button");
                deleteBtn.classList.add("btn", "btn-outline-secondary","mb-2","btn-sm");
                deleteBtn.innerText = "삭제";
                deleteBtn.setAttribute("onclick","deleteReply("+r.replyNo+")");
                
                
                btnDiv.append(updateBtn, deleteBtn);
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



// 댓글 등록
const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

addReply.addEventListener("click", function(){ // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
    if(memberType != "A"){ // 로그인 X
        // alert("관리자만 작성할 수 있습니다.");

        Swal.fire({
            title: "관리자만 작성할 수 있습니다.",
            width: 350,
            padding: '3em',
            icon: 'warring',
            iconColor: 'rgb(251, 131, 107)',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });


        
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(replyContent.value.trim().length == 0){ // 미작성인 경우
        // alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        Swal.fire({
            title: "댓글을 작성한 후 버튼을 클릭해주세요.",
            width: 350,
            padding: '3em',
            icon: 'warring',
            iconColor: 'rgb(251, 131, 107)',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });


        replyContent.value = ""; // 띄어쓰기, 개행문자 제거
        replyContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)
    $.ajax({
        url : contextPath + "/reply/insert",
        
        data : {"replyContent" : replyContent.value,
                "memberNo" : loginMemberNo,
                "boardNo" : boardNo },
        type : "post",
        success : function(result){

            if(result > 0){ // 등록 성공
                // alert("댓글이 등록되었습니다.");
                
                Swal.fire({
                    title: "댓글이 등록되었습니다.",
                    width: 350,
                    padding: '3em',
                    icon: 'success',
                    iconColor: 'rgb(251, 131, 107)',
                    color: 'black',
                    confirmButtonColor: 'rgb(251, 131, 107)',
                    confirmButtonText: '확인'
                });
        
        

                replyContent.value = ""; // 작성했던 댓글 삭제

                selectReplyList(); // 비동기 댓글 목록 조회 함수 호출
                // -> 새로운 댓글이 추가되어짐

            } else { // 실패
                // alert("댓글 등록에 실패했습니다...");

                Swal.fire({
                    title: "댓글 등록에 실패했습니다...",
                    width: 350,
                    padding: '3em',
                    icon: 'warring',
                    iconColor: 'rgb(251, 131, 107)',
                    color: 'black',
                    confirmButtonColor: 'rgb(251, 131, 107)',
                    confirmButtonText: '확인'
                });
            }

        },

        error : function(req, status, error){
            console.log("댓글 등록 실패")
            console.log(req.responseText);
        }
    });

});



// 댓글 삭제
function deleteReply(replyNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        $.ajax({
            url : contextPath + "/reply/delete",
            data : {"replyNo" : replyNo},
            type : "GET",
            success: function(result){
                if(result > 0){
                    // alert("삭제되었습니다");

                    Swal.fire({
                        title: "삭제되었습니다.",
                        width: 350,
                        padding: '3em',
                        icon: 'success',
                        iconColor: 'rgb(251, 131, 107)',
                        color: 'black',
                        confirmButtonColor: 'rgb(251, 131, 107)',
                        confirmButtonText: '확인'
                    });
            
                    selectReplyList(); // 목록을 다시 조회해서 삭제된 글을 제거
                }else{
                    // alert("삭제 실패");
                    Swal.fire({
                        title: "삭제 실패",
                        width: 350,
                        padding: '3em',
                        icon: 'warring',
                        iconColor: 'rgb(251, 131, 107)',
                        color: 'black',
                        confirmButtonColor: 'rgb(251, 131, 107)',
                        confirmButtonText: '확인'
                    });
            
                }
            },

            error : function(req, status, error){
                console.log("댓글 삭제 실패")
                console.log(req.responseText);
            }

        });
    }
}



// 댓글 수정 화면 전환 

let beforeReplyRow; // 수정 전 원래 행의 상태를 저장할 변수
let beforeBtnDiv; // 수정 전 원래 행의 상태를 저장할 변수


function showUpdateReply(replyNo, btn){
                     // 댓글번호, 이벤트발생요소(수정버튼)

    // // ** 댓글 수정이 한 개만 열릴 수 있도록 만들기 **
    // const temp = document.getElementsByClassName("update-textarea");  
    
    // if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

    //     if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

    //         temp[0].parentElement.innerHTML = beforeReplyRow;
    //         // reply-row                       // 백업한 댓글
    //         // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
       
    //     }else{ // 취소
    //         return;
    //     } }


    // 1. 댓글 수정이 클릭된 행을 선택
    const replyRow = btn.parentElement.previousElementSibling; // 수정 버튼의 부모의 부모

    // 2. 행 내용 삭제 전 현재 상태를 저장(백업) (문자열)
    //    (전역변수 이용)
    beforeReplyRow = replyRow.innerHTML;

    // 취소 버튼 동작 코드
    //replyRow.innerHTML = beforeReplyRow;


    // 3. 댓글에 작성되어 있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정
    
    //console.log(replyRow.children[1].innerHTML); // <br> 태그 유지를 위해서 innerHTML 사용
    let beforeContent = replyRow.innerText;

    // 이것도 가능!
    //let beforeContent = btn.parentElement.previousElementSibling.innerHTML;


    // 4. 댓글 행 내부 내용을 모두 삭제
    replyRow.innerHTML = "";
    btn.parentElement.innerHTML="";

    // 5. textarea 요소 생성 + 클래스 추가  +  **내용 추가**
    const textarea = document.createElement("textarea");
    textarea.classList.add("form-control", "mb-1" );
    textarea.style.resize = 'none';

    // ******************************************
    // XSS 방지 처리 해제
    beforeContent =  beforeContent.replaceAll("&amp;", "&");
    beforeContent =  beforeContent.replaceAll("&lt;", "<");
    beforeContent =  beforeContent.replaceAll("&gt;", ">");
    beforeContent =  beforeContent.replaceAll("&quot;", "\"");
    
    // 개행문자 처리 해제
    beforeContent =  beforeContent.replaceAll("<br>", "\n");

    // ******************************************
    textarea.value = beforeContent; // 내용 추가

    // 6. replyRow에 생성된 textarea 추가
    replyRow.append(textarea);

    // 7. 버튼 영역 + 수정/취소 버튼 생성
    const replyBtnArea = document.createElement("div");
    replyBtnArea.classList.add("col-lg-6");
    
    
    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정 완료";
    updateBtn.classList.add("btn", "btn-outline-secondary", "mb-2",  "btn-sm", "me-1");
    updateBtn.setAttribute("onclick", "updateReply("+replyNo+", this)");
    
    


    // 8. 버튼영역에 버튼 추가 후 
    //    replyRow(행)에 버튼영역 추가
    replyBtnArea.append(updateBtn);
    replyRow.append(replyBtnArea);

}



// 댓글 수정(AJAX)
function updateReply(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.value;

    $.ajax({
        url : contextPath + "/reply/update",
        data : {"replyNo" : replyNo,
                "replyContent" : replyContent},
        type : "POST",
        success : function(result){
            if(result > 0){
                // alert("댓글이 수정되었습니다.");

                Swal.fire({
                    title: "수정 되었습니다.",
                    width: 350,
                    padding: '3em',
                    icon: 'success',
                    iconColor: 'rgb(251, 131, 107)',
                    color: 'black',
                    confirmButtonColor: 'rgb(251, 131, 107)',
                    confirmButtonText: '확인'
                });
                selectReplyList();
            }else{
                // alert("댓글 수정 실패");

                Swal.fire({
                    title: "삭제 실패",
                    width: 350,
                    padding: '3em',
                    icon: 'warring',
                    iconColor: 'rgb(251, 131, 107)',
                    color: 'black',
                    confirmButtonColor: 'rgb(251, 131, 107)',
                    confirmButtonText: '확인'
                });
            }
        },
        error : function(req, status, error){
            console.log("댓글 수정 실패");
            console.log(req.responseText);
        }
    });
}