// let rewardList = new Array();
let rewardList1 = {

    rewardTitle:'1번의 타이틀',
    rewardContent:'1번의 내용',
    rewardPrice:1111,
    maxRewardNo :50
    
 };

 let rewardList2 = {
    rewardNo:2,
    rewardTitle:'2번의 타이틀',
    rewardContent:'2번의 내용',
    rewardPrice:2222,
    maxRewardNo :100
} 

let temp ="-"+JSON.stringify(rewardList1) +"-"+ JSON.stringify(rewardList2);

function testList(){
    
    // console.log(JSON.stringify(rewardList));
    // document.getElementById("test1").value= JSON.stringify(rewardList);

    $.ajax({
        url:'testList',
        type : "get",
        data:{'list':document.getElementById("test").value},
        success:function(result){
            
            console.log(result);
        },   
        error(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
     })
}








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

       //위에서 return 수행 안되면 수행
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

/* 리워드칸수 추가 */
function addReward(){
    const rewardsRows= document.getElementsByClassName('rewardsRows')[0]
    
    const tr = document.createElement('tr');

    const td1 = document.createElement('td');
    td1.innerText= document.querySelectorAll('.rewardsRows>tr>td:nth-child(1)').length+1;
    tr.append(td1);
    
    for(let i=0; i<4; i++){
        const td = document.createElement('td');
        const input = document.createElement('input');
            if(i>=2){
                input.setAttribute("type","number")
            }
        td.append(input);
        tr.append(td);
    }

    const td = document.createElement('td');
    const button = document.createElement('button');
    button.setAttribute("type",'button');
    button.setAttribute("onclick",'addRewardList()');
    button.classList.add("rewardsAddBtn");
    button.innerText="등록"
    td.append(button);
    tr.append(td);

    rewardsRows.append(tr);

    
$('.rewardsAddBtn').click(checkInput);


}


/* 썸네일 이미지 미리보기 */
// 회원 프로필 이미지 변경(미리보기)
const inputImage = document.getElementById("input-image");
const previewImage = document.getElementById('previewImage')

if(inputImage != null){ 
    inputImage.addEventListener("change", function(){
        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function(e){ 
                previewImage.setAttribute("src", e.target.result);
             }
        }
    });
}

const deleteBtn = document.getElementById('deleteBtn');
deleteBtn.addEventListener('click',function(){
    previewImage.setAttribute('src','');
    inputImage.value='';
})



function addRewardList(){

    
}

$('.rewardsAddBtn').click(checkInput);

function checkInput(){
    const arr=this.parentElement.parentElement.children;

    const title = arr[1].children[0].value;
    const content = arr[2].children[0].value;
    const price =arr[3].children[0].value;
    const amount = arr[4].children[0].value;
   
    //입력될 값들이 있는지 확인
    if(title.trim().length == 0){
        alert('리워드 타이틀을 입력해주세요');
        return false;
    }
    if(content.trim().length == 0){
        alert('리워드 내용을 입력해주세요');
        return false;
    }
    if(price.trim().length == 0){
        alert('리워드 가격을 입력해주세요');
        return false;
    }
    if(amount.trim().length == 0){
        alert('리워드 수량 입력해주세요');
        return false;
    }


    let item = {
        rewardTitle:title,
        rewardContent:content,
        rewardPrice:price,
        maxRewardNo :amount
    } 
    const t = document.getElementById("insertRewardList");
    t.value += JSON.stringify(item)+"-";
    
    this.classList.remove("rewardsAddBtn");
    this.classList.add("btn-secondary");
    this.removeEventListener("onclick",addRewardList);
    
}

function alert(msg){
    Swal.fire({
        title: msg,
        width: 350,
        padding: '3em',
        color: 'black',
        confirmButtonColor: 'rgb(251, 131, 107)',
        confirmButtonText: '확인'
        });
}