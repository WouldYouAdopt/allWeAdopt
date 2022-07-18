// 즉시 실행 함수
(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if(goToListBtn != null){ // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){

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

            const listUrl = url + cp;

            location.href = listUrl; 

        });
    }

})();

// 즉시 실행 함수
(function(){
    const deleteBtn = document.getElementById("deleteBtn"); // 존재하지 않으면 null

    if(deleteBtn != null){ // 버튼이 화면에 존재할 때
        deleteBtn.addEventListener("click", function(){

            let url = contextPath + "/admin/notice/delete/"+ boardNo ; // 상대경로 형식으로 작성

            Swal.fire({
                title: '정말로 삭제 하시겠습니까?',
                text: "확인 버튼을 클릭하면 게시글이 삭제됩니다.",
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
                        location.href = url;
                    }else{
                        e.preventDefault();
                    }
                })
        });
    }

})();

// 게시글 작성 유효성검사
function writeValidate(){

    const boardTitle = document.getElementById("exampleFormControlInput3");
    const note = document.getElementsByClassName("note-editable")[0];

    if(boardTitle.value.trim().length == 0 ){

        Swal.fire({
            title: '제목을 입력해주세요!',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });

        boardTitle.value = "";
        boardTitle.focus();
        return false;
    }

    if( note.innerHTML.trim() == "<p><br></p>" && (note.innerText.trim() == "" || note.innerText == "\n" )){

        Swal.fire({
            title: '내용을 입력해주세요!',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });
        note.focus();
        return false;
    }

    return true;
};