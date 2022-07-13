

// 회원 탈퇴 유효성 검사
function secessionValidate(){

    const memberPw = document.getElementById("floatingInputValue");

    // 비밀번호 미작성
    if(memberPw.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");
        memberPw.focus();
        return false;
    }

    
    return true;
}