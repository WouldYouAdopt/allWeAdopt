

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



    //반품 버튼
    const returnBtn = document.getElementById("returnBtn");

})();