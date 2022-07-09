
/* 버튼 클릭시 색이 변하는 이벤트 주는 함수 */
let schedule = 0; //일정이 선택 되었는지 확인.
(function(){
      $('.fundingBtn ').click(function(e){
        const btn = e.target;
        
        if(btn.value == 'unable'){
            alert('잘못된 선택입니다( 수행된 일정 )');
            return;
        }
       if(schedule>0){
            if(confirm('선택된 일정이 있습니다 변경하시겠습니까?')){
                //existing : 기존에 선택된 변수
             const existing = document.getElementsByClassName('choiced')[0];
             existing.classList.remove('choiced');
             existing.classList.toggle('btn-outline-success');
             existing.classList.toggle('btn-secondary');
        }else{
            return;
        }
       } 

            btn.classList.toggle('btn-outline-success');
            btn.classList.toggle('btn-secondary');
            btn.classList.add('choiced');
            schedule = 1; 
      })
    //classList 태그 확인할려고 적은 구문
    //   const temp = document.getElementById('temp');
    //   temp.classList.toggle
})();

/* 만약 작성 버튼이 수행 시 결정된 일정 버튼에  'unable' Value가 추가되어야 한다!! */