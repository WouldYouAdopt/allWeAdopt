

/* 모두 체크하는 이벤트 부여 */
let bol = false;
(function(){
    $('#flexCheckDefault').click(function(){
        var checked = $('#flexCheckDefault').is(':checked');
        
        if(checked){
            $('input:checkbox').prop('checked',true);
        }else{
            $('input:checkbox').prop('checked',false);
        }
    });
})()

