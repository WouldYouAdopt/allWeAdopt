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




let objectC = {
    category : false, //$('select').val()
    title : false, //document.getElementById('fundingTitle').value.trim() == ''
    subHead : false, //document.getElementById('subheadInput').value.trim() == ''
    reward : false,//document.getElementById('insertRewardList').value == ''
    delivery : false, //document.getElementById('delivery').value.trim() == ''
    targetDonation :false,//document.getElementById('targetDonation').value.trim() == ''
}



//form 태그 입력 검증용 
function submitValidate(){
    //카테고리 선택 됬는지
    if($('select').val().trim()==''){alert('카테고리를 선택해주세요'); return false;   }
 
    //타이틀 선택 됬는지
    if($('#fundingTitle').val().trim()==''){alert('펀딩 타이틀을 입력 해주세요'); return false;   }
  
    //소제목 선택 됬는지
    if($('#subheadInput').val().trim()==''){alert('펀딩 소개를 입력 해주세요'); return false;   }

    //배송비 선택 됬는지
    if($('#delivery').val().trim()==''){alert('배송비를 입력 해주세요'); return false;   }
 
    // 목표 후원금 선택 됬는지
    if($('#targetDonation').val().trim()==''){alert('목표 후원금을 입력 해주세요'); return false;   }
    
    //섬머노트에 내용이 입력되었는지. (정규삭)
    const reg = /<\/p>|<p>|&nbsp;|<br>/gm;
    let note = document.getElementById("summernote");
    if(note.value.replace(reg,'').trim() == ''){
        alert("게시글을 작성해주세요.");
        note.value="";
        return false;
    }

    //리워드 목록 검증용 
    if($('#insertRewardList').val().trim()==''){
        alert('리워드를 등록해주세요 <br> (수정 포함)');
        return false;
    }
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
    const rInput = document.createElement('input');
    rInput.setAttribute("type","hidden");
    rInput.setAttribute("value",0);
    td1.append(rInput);
    td1.append(document.querySelectorAll('.rewardsRows>tr>td:nth-child(1)').length+1);
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

    $('.rewardsAddBtn').off("click",checkInput);
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
    
    const rewardNo= arr[0].children[0].value;
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

    if(fundingNo==''){
        fundingNo = 0;
    }

    let item = {
        rewardNo:rewardNo,
        rewardTitle:title,
        rewardContent:content,
        rewardPrice:price,
        maxRewardNo :amount,
        fundingNo:fundingNo
    } 
    const t = document.getElementById("insertRewardList");
    t.value += JSON.stringify(item)+"-";
    
    this.classList.remove("rewardsAddBtn");
    this.classList.add("btn-secondary");
    
     $('.btn-secondary').off("click",checkInput);
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


//내용 집어 넣는 이벤트
(function(){
    if(dFee != ''){
        let i = dFee.replaceAll(",","");
        i = parseInt(i);
        dFee=i;
        document.getElementById("targetDonation").value=i;
    }
})();


$(document).ready(function() {
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 500,
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link']],
            // ['view', ['fullscreen', 'help']]
        ],
        callbacks:{
            onImageUpload: function(files, editor) {
                console.log(files);
                sendFile(files[0], this);
            }
        }
    });
});