// const exampleFormControlInput3 = document.getElementById("exampleFormControlInput3");
// const summernote = document.getElementById("summernote");


// function validate(){


//     if(exampleFormControlInput3.value.trim().length == 0 ){

//         Swal.fire({
//             title: '제목을 입력해주세요!!!!',
//             width: 350,
//             padding: '3em',
//             color: 'black',
//             confirmButtonColor: 'rgb(251, 131, 107)',
//             confirmButtonText: '확인'
//             });

//             exampleFormControlInput3.value = "";
//             exampleFormControlInput3.focus();
//         return false;

//     }

//     if(summernote.value.trim().length == 0){

//         Swal.fire({
//             title: '내용을 입력해주세요!!!!',
//             width: 350,
//             padding: '3em',
//             color: 'black',
//             confirmButtonColor: 'rgb(251, 131, 107)',
//             confirmButtonText: '확인'

//         });

//         summernote.value = "";
//         summernote.focus();
//         return false;

//     }

//     return true;


// }

const boardTitle = document.getElementById("exampleFormControlInput3");
const boardContent = document.getElementById("summernote");

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

    if(boardContent.value.trim().length == 0 ){

        Swal.fire({
            title: '제목을 입력해주세요!',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });

        boardContent.value = "";
        boardContent.focus();
        return false;
    }

    return true;
};