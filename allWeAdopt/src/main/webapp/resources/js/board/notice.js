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


const boardTitle = document.getElementById("exampleFormControlInput3");
const note = document.getElementsByClassName("note-editable");

// 게시글 작성 유효성검사
function writeValidate(){

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

    if( note[1].innerHTML.trim() == "<p><br></p>" && (note[1].innerText.trim() == "" || note[1].innerText == "\n" )){

        Swal.fire({
            title: '내용을 입력해주세요!',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });
        note[1].focus();
        return false;
    }

    return true;
};

// 문의 게시글 작성 유효성검사
function writeValidate1(){

    const t = document.getElementById("category");

    if(   t.value == "0" ) {
        Swal.fire({
            title: '문의사항을 선택해주세요.',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });
        return false;
    }
    

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

    if( note[0].innerHTML.trim() == "<p><br></p>" && (note[0].innerText.trim() == "" || note[0].innerText == "\n" )){

        Swal.fire({
            title: '내용을 입력해주세요!',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });
        note[0].focus();
        return false;
    }


    return true;
};

// 템플릿 설정 버튼 클릭여부 알려주는 변수
let check = false;

// 템플릿 설정 클릭시
if(document.getElementById("setting")!=null){

    const setting = document.getElementById("setting");

    // 템플릿 설정 버튼 클릭시
    setting.addEventListener("click", function(){

        const insertB = document.getElementById("insert");
        const deleteB = document.getElementById("delete");
        const tListArea = document.getElementById("tListArea");
        const buttonArea = document.getElementById("buttonArea");

        if(!check){
            check = true;
            insertB.classList.remove("none");
            deleteB.classList.remove("none");
            tListArea.classList.remove("none");
            buttonArea.classList.add("none");
        }else{
            check = false;
            insertB.classList.add("none");
            deleteB.classList.add("none");
            tListArea.classList.add("none");
            buttonArea.classList.remove("none");
        }

    });


}

// 저장 버튼 클릭시
if(document.getElementById("add")!=null){

    const add = document.getElementById("add");
    const tempName = document.getElementById("tempName");
    const tempContent = document.getElementById("summernote2");

    add.addEventListener("click", function(){

        // 제목 입력 안한경우
        if(tempName.value.trim().length == 0 ){

            Swal.fire({
                title: '템플릿 이름을 입력해주세요!',
                width: 350,
                padding: '3em',
                color: 'black',
                confirmButtonColor: 'rgb(251, 131, 107)',
                confirmButtonText: '확인'
            });
    
            tempName.value = "";
            tempName.focus();
            return;
        }
    
        if( note[0].innerHTML.trim() == "<p><br></p>" && (note[0].innerText.trim() == "" || note[0].innerText == "\n" )){
    
            Swal.fire({
                title: '내용을 입력해주세요!',
                width: 350,
                padding: '3em',
                color: 'black',
                confirmButtonColor: 'rgb(251, 131, 107)',
                confirmButtonText: '확인'
            });
            note[0].focus();
            return;
        }

        $.ajax({
            url : contextPath+"/admin/template/write",
            type : "post",
            data : {
                "tempName" : tempName.value,
                "tempContent" : tempContent.value
            },
            dataType: "json",
            success : function(tList){
                selectTemplateList(tList);
            },
            error : function(){
                console.log("ajax 실패");
            }
    
        });

    });

}

// 작성 중 모달창을 끈 경우 (x버튼 혹은 창 외부 클릭시)
if(document.getElementById("insert")!=null){

    const insertB = document.getElementById("insert");

    insertB.addEventListener("click", function(){

        const closeBtn = document.getElementById("closeBtn");
        const tempName = document.getElementById("tempName");
        const exampleModal = document.getElementById("exampleModal");
        const placeholder = document.getElementsByClassName("note-placeholder");
    
        if(!exampleModal.classList.contains("show")){
            tempName.value = "";
            note[0].innerHTML = "<p><br></p>";
            placeholder[0].style.display ="block";
        }
    
        closeBtn.addEventListener("click", function(){
            tempName.value = "";
            note[0].innerHTML = "<p><br></p>";
            placeholder[0].style.display ="block";
        });


    });

}


// 요소 체크 + 삭제 버튼 클릭시 선택 템플릿 삭제 . . . 
if(document.getElementById("delete")!=null){

    const deleteB = document.getElementById("delete");
    const chk = document.getElementsByClassName("chk");

    deleteB.addEventListener("click", function(){

        let num = "";
        for(let i=0; i<chk.length; i++){
            if(chk[i].checked){
                num += chk[i].value + ",";
            }
        }

        num = num.substring(0, num.length-1);

        console.log(num);

        $.ajax({
            url : contextPath+"/admin/template/delete",
            type : "post",
            data : { "tempNo" : num },
            dataType: "json",
            success : function(tList){
                selectTemplateList(tList);
            },
            error : function(){
                console.log("ajax 실패");
            }

        });


    });
}

// 템플릿 조회하는 함수
function selectTemplateList(tList){

    const tListArea = document.getElementById("tListArea");
    const buttonArea = document.getElementById("buttonArea");
    const exampleModal = document.getElementById("exampleModal");
    const body = document.getElementById("body");
    const tempName = document.getElementById("tempName");

    let input;
    let input2;
    let button;
    tListArea.innerHTML ="";
    buttonArea.innerHTML ="";
    for(let t of tList){

        // 템플릿 설정영역
        input = document.createElement("input");
        input.setAttribute("type", "checkbox");
        input.setAttribute("name", "chk");
        input.setAttribute("title", t.tempEnc);
        input.value=t.tempNo;
        input.classList.add("chk");

        tListArea.append(input);
        tListArea.innerHTML += " "+ t.tempName + "<br>";

        // 템플릿 버튼영역
        button = document.createElement("button");
        button.classList.add("btn", "btn-primary", "button-pink", "form-check-label", "p-1",  "m-1", "tempBtn");
        button.setAttribute("type", "button");
        button.setAttribute("title", t.tempEnc);
        button.innerText = t.tempName;

        input2 = document.createElement("input");
        input2.setAttribute("type", "hidden");
        input2.classList.add("hiddenContent");
        input2.value=t.tempContent;

        buttonArea.append(button, input2);

    }

    exampleModal.classList.remove("show");
    exampleModal.style.display ="none";
    exampleModal.removeAttribute("role","dialog");

    body.classList.remove("modal-open");
    body.style ="";
    body.removeChild(body.lastChild);

    // 다 완료하면 내용 지우기
    tempName.value = "";
    note[0].innerHTML = "<p><br></p>";
    const placeholder = document.getElementsByClassName("note-placeholder");
    placeholder[0].style.display ="block";

    print();

}

// 각 템플릿 클릭시 썸머노트에 출력되게 만들기 . . . ><
if(document.getElementById("buttonArea")!=null){
    print();
}

function print(){

    const tempBtn = document.getElementsByClassName("tempBtn");
    const hiddenContent = document.getElementsByClassName("hiddenContent");
    const summernote = document.getElementById("summernote");

    for(let i=0; i<tempBtn.length; i++){
        
        tempBtn[i].addEventListener("click", function(){

            const placeholder = document.getElementsByClassName("note-placeholder");

            if(note[1].childNodes[0]==null){

                const p = document.createElement("p");
                
                note[1].append(p);
            }

            if(note[1].childNodes[0].innerHTML == '<br>'){
                placeholder[1].style.display ="none";
                note[1].childNodes[0].innerHTML += hiddenContent[i].value;
                summernote.value += hiddenContent[i].value;
            }else{
                summernote.value += hiddenContent[i].value;
                note[1].lastElementChild.innerHTML += hiddenContent[i].value;
            }


        });
    }

}


// 문의사항 삭제 즉시 실행 함수
(function(){
    const deleteBtn = document.getElementById("deleteBtn1"); // 존재하지 않으면 null

    if(deleteBtn != null){ // 버튼이 화면에 존재할 때
        deleteBtn.addEventListener("click", function(){

            let url = contextPath + "/admin/ask/delete/"+ boardNo ; // 상대경로 형식으로 작성

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

