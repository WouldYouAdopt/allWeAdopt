

let objectC = {
    category : false, //$('select').val()
    title : false, //document.getElementById('fundingTitle').value.trim() == ''
    subHead : false, //document.getElementById('subheadInput').value.trim() == ''
    reward : false,//document.getElementById('insertRewardList').value == ''
    delivery : false, //document.getElementById('delivery').value.trim() == ''
    targetDonation :false,//document.getElementById('targetDonation').value.trim() == ''

    
}
function ttt(){
    let note = document.getElementById("summernote").value;
    if(note.value.replace(/<p><br><\/p>/gm,'') == ''){
        alert("게시글을 작성해주세요.");
        note.value="";
        note.value.focus();
        return false;
    }
}



/* 모두 체크하는 이벤트 부여 */
let bol = false;
(function(){

if($('#flexCheckDefault') != null){
    $('#flexCheckDefault').click(function(){
            var checked = $('#flexCheckDefault').is(':checked');
            
            if(checked){
                $('input:checkbox').prop('checked',true);
            }else{
                $('input:checkbox').prop('checked',false);
            }
        });
    } 
})();



//각종 버튼들에 이벤트를 추가해주는 즉시 실행 함수.
(function(){
   //배송조회 버튼
   const selectDelivery= document.getElementById("selectDelivery");
    if(selectDelivery !=null){
        document.getElementById("selectDelivery").addEventListener("click",function(){
            submitSweettracker=document.getElementById("submitSweettracker");
        
            window.open('', "sweettracker", "width=500, height=800" );
            submitSweettracker.target = "sweettracker";
            submitSweettracker.submit();
        })
    }


    //결제 취소 버튼
    const cancelPayment = document.getElementById("cancelPayment");
    if(cancelPayment !=null){
        cancelPayment.addEventListener("click",function(){

            Swal.fire({
                title: '결제 취소',
                text: "정말로 결제 취소 하시겠습니까?.",
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
                        $.ajax({
                            url:'../cancel/'+paymentNo,
                            type : "get",
                            success:function(result){
                                
                                if(result>0){
                                    Swal.fire({
                                        title: '결제 취소',
                                        text: "정상적으로 결제 취소 되었습니다..",
                                        width: 340,		
                                        icon: 'success',
                                        iconColor: 'rgb(251, 131, 107)',
                                        confirmButtonColor: '008000',
                                        confirmButtonText: '확인',
                                        }).then((result) => {
                                            location.href="";
                                         })
                                    
                                }
                            },   
                            error(request, status, error){
                                console.log("AJAX 에러 발생");
                                console.log("상태코드 : " + request.status); // 404, 500
                                Swal.fire({
                                    title: '결제 취소에 실패하였습니다.',
                                    width: 350,
                                    padding: '3em',
                                    color: 'black',
                                    confirmButtonColor: 'rgb(251, 131, 107)',
                                    confirmButtonText: '확인'
                                    });
                            }
                         })
                    }else{

                        e.preventDefault();
                    }
                 })
          
        })
        
    }


    //환불 버튼
    const refundBtn = document.getElementById("refundBtn");
    if(refundBtn != null){
        refundBtn.addEventListener("click",function(){

            Swal.fire({
                title: '환불 신청',
                text: "정말로 환불 신청을 하시겠습니까?.",
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
                        $.ajax({
                            url:'../refund/'+paymentNo,
                            type : "get",
                            success:function(result){
                                
                                if(result>0){
                                    Swal.fire({
                                        title: '환불',
                                        text: "환불 신청이 완료되었습니다.",
                                        width: 340,		
                                        icon: 'success',
                                        iconColor: 'rgb(251, 131, 107)',
                                        confirmButtonColor: '008000',
                                        confirmButtonText: '확인',
                                        }).then((result) => {
                                            location.href="";
                                         })
                                    
                                }
                            },   
                            error(request, status, error){
                                console.log("AJAX 에러 발생");
                                console.log("상태코드 : " + request.status); // 404, 500
                                Swal.fire({
                                    title: '환불 신청에 실패하였습니다.',
                                    width: 350,
                                    padding: '3em',
                                    color: 'black',
                                    confirmButtonColor: 'rgb(251, 131, 107)',
                                    confirmButtonText: '확인'
                                    });
                            }
                         })
                    }else{
                        e.preventDefault();
                    }
                 })
          
        })
    }

    //반품 버튼
    const returnBtn = document.getElementById("returnBtn");
    if(returnBtn != null){

        returnBtn.addEventListener("click",function(){
            
            document.getElementById("btn-area").innerHTML="";

            const div=document.createElement("div");
            div.classList.add("summernoteArea");

            const h3=document.createElement("h3");
            h3.innerText="사유를 입력해주세요";
            div.append(h3);

            const ta=document.createElement("textarea");
            ta.setAttribute("id","summernote");
            ta.setAttribute("name","returnReason");
            div.append(ta); 


            const div2=document.createElement("div");
            div2.classList.add("btnArea")

            const button1 = document.createElement("button");
            button1.setAttribute("id","returnSubmitBtn");
            button1.setAttribute("onclick","sendReturn()");
            button1.innerText = "반품 신청";
            div2.append(button1); 

            const button2 = document.createElement("button");
            button2.setAttribute("id","returnCancelBtn");
            button2.setAttribute("onclick","location.href=''");
            button2.innerText = "작성 취소";
            div2.append(button2); 
            
            div.append(div2);

            document.getElementById("twoTable").after(div);  

            summer();
        })
    }


    //넣어야하는 정보
    // 반품 번호 : 시퀀스
    // 반품 사유 : 사용자가 직접 작성
    // 반품 상태 : n
    // 반품 신청일 : sysdate
    // 결제 정보 : paymentNo(PathVariable로 가져감)
})();

//섬머노트 이벤트
function summer(){
    $('#summernote').summernote({
        placeholder: '반품 사유를 작성해주세요.',
        tabsize: 2,
        height: 200,
        focus:true,
        disableResizeEditor: true,
        toolbar: [
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['insert',['picture']],
		    ['view', ['codeview','fullscreen']]
        ]
    });
};

//반품사유 작성
function sendReturn(){
    console.log('연결 완료');

    const ta = document.getElementById("summernote");
    
    if(ta.value.trim().length == 0 ){
        Swal.fire({
            title: '반품 사유를 작성해주세요',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
            });

        ta.value="";
        ta.focus();
        return;
    }

   
    $.ajax({
        url:'../return/'+paymentNo,
        type : "post",
        data:{'returnReason':ta.value},
        dataType:"json",
        success:function(result){
            
           console.log(result);
           console.log("정상 수행"); 
            if(result != ''){
                Swal.fire({
                    title: '반품',
                    text: "반품 신청이 완료되었습니다.",
                    width: 340,		
                    icon: 'success',
                    iconColor: 'rgb(251, 131, 107)',
                    confirmButtonColor: '008000',
                    confirmButtonText: '확인',
                    }).then((result) => {
                        location.href="";
                     })
                
            }
        },   
        error(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
            Swal.fire({
                title: '반품 신청에 실패하였습니다.',
                width: 350,
                padding: '3em',
                color: 'black',
                confirmButtonColor: 'rgb(251, 131, 107)',
                confirmButtonText: '확인'
                });
        }
     }) 
}


function selectReturnState(){

    if(document.getElementsByClassName("summernoteArea")[0] !=null){
        document.getElementsByClassName("summernoteArea")[0].innerHTML ="";
    }
    const div=document.createElement("div");
    div.classList.add("summernoteArea");

    const ta=document.createElement("textarea");
    ta.setAttribute("name","returnReason");
    ta.setAttribute("id","returnReason");

 let data ='';


    $.ajax({
        url:'../selectReturn/'+paymentNo,
        type : "post",
        data:{'returnReason':ta.value},
        dataType:"json",
        success:function(result){
                data = result;
                div.append(ta); 
    
                document.getElementById("twoTable").after(div);  
                
                $('#returnReason').summernote('code', data);
                $('#returnReason').summernote('disable');
        },   
        error(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
     }) 

   
   
    
    
}