//채팅 서버 열기
function popUpOpne(){
    window.open('', "chattingWindow", "width=800, height=500" );
    chatForm.target = "chattingWindow";
    chatForm.submit();
}


//채팅 1대1
function requestChat(){
    const targetMember = JSON.parse(document.getElementById('targetMember').value);
    const member = JSON.parse(document.getElementById('member').value);
    if(member.memberEmail==targetMember.memberEmail){
        alert('대상이 올바르지 않습니다( 본인 )');
        return;
    }
    console.log('1대1 채팅 신청');
    //채팅 서버 연결.
    window.open('', "chattingWindow", "width=800, height=500" );
    addChatForm.target = "chattingWindow";
    addChatForm.submit()
}

function selectThisUser(thisUser){
    
    /* new Gson().toJson(thisMember) */

     $.ajax({
         url:'/allWeAdopt/member/select/thisUser',
         data:{'memberNo':thisUser},
         dataType:'json',
         type: "POST",
         success: function (member) {
                console.log(member);

                const targetMember = document.getElementById('targetMember');
                targetMember.value = JSON.stringify(member);
                
                requestChat();
         },
         error: function () {
            console.log("에러발생"); // 404, 500
        }
 
     })
}
