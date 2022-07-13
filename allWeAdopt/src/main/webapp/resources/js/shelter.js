// // 이미지 파일 업로드
// function uploadSummernoteImageFile(file, editor){

//     data = new FormData();

//     data.append("file", file);

//     $.ajax({

//         data : data, 
//         type : "POST",
//         url : "/uploadSummernoteImageFile",
//         contentType : false,
//         processData : false, 
//         sucesess : function(data){
//             var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
//             $(editor).summernote("editor.insertImage", contextPath + data.url);
//         }

//     })

// }

// 즉시 실행 함수
(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if(goToListBtn != null){ // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){


            url = contextPath + "/shelter/pamphlet/list?"; 


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

            let url = contextPath + "/board/delete/" + boardCode + "/" + boardNo;


            if( confirm("정말로 삭제 하시겠습니까?") ){
                location.href = url; // get방식으로 url에 요청
            }

        });
    }

})();






