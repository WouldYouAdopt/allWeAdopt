

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

    
})();