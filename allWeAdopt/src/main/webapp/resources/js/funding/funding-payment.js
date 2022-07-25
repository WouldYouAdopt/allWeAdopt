
//유효성 검사용 변수
const checkObj = {
  "inputrecipient": false,
  "inputTelMain": false,
  "postCode": false,
  "address": false,
  "PIA": false,
  "LRA": false
};

function alert(msg){
  Swal.fire({
      title: msg,
      width: 400,
      padding: '3em',
      color: 'black',
      confirmButtonColor: 'rgb(251, 131, 107)',
      confirmButtonText: '확인'
      });
}


function DaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수
      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      let addr;
      document.getElementById("postCode").value = data.zonecode;
      document.getElementById("Address").value = roadAddr;
      document.getElementById("detailAddress").focus();
      checkObj.postCode = true;
      checkObj.address = true;
    }
  }).open();
}


//배송지 라디오 버튼들에 이벤트를 추가
(function () {
  /* 이전 배송지를 대입시켜주는 함수 */
  prevDestination = document.getElementById('prevDestination');
  newDestination = document.getElementById('newDestination');
  supportDestination = document.getElementById('supportDestination');

  //배송지 정보를 대입시켜줄 input box들
  const inputName = document.getElementById("inputName");
  const inputTelMain = document.getElementById("inputTelMain");
  const inputTelSub = document.getElementById("inputTelSub");
  const postCode = document.getElementById("postCode");
  const address = document.getElementById("Address");
  const detailAddress = document.getElementById("detailAddress");

  //이전 배송지
  prevDestination.addEventListener("change", function () {
    console.log('이전 주소 체크됨');

    if(prevOrder==null){
      alert("이전 배송지가 없습니다");
      return;
    }

    inputName.value = prevOrder.recipient;
    inputTelMain.value = prevOrder.orderPhoneMain;
    if (prevOrder.orderPhoneSub != null) {
      inputTelSub.value = prevOrder.orderPhoneSub;
    }

    const addr = prevOrder.orderAddress.split(",,");
    console.log(addr[0]);
    console.log(addr[1]);
    console.log(addr[2]);
    if (addr.length > 1) {
      postCode.value = addr[0];
      address.value = addr[1];
      detailAddress.value = addr[2];

      checkObj.postCode = true;
      checkObj.address = true;
    }


    checkObj.inputrecipient = true;
    checkObj.inputTelMain = true;


  })

  //신규 배송지
  newDestination.addEventListener("change", function () {
    console.log('신규배송지 체크됨');
    inputName.value = "";
    inputTelMain.value = "";
    inputTelSub.value = "";

    postCode.value = "";
    address.value = "";
    detailAddress.value = "";

    checkObj.inputrecipient = false;
    checkObj.inputTelMain = false;
    checkObj.postCode = false;
    checkObj.address = false;
  })

  //서포터 정보와 동일
  supportDestination.addEventListener("change", function () {
    console.log('서포터 주소 체크됨');
    inputName.value = supportName;
    inputTelMain.value = supportTel;
    inputTelSub.value = "";


    const addr = supportAddress.split(",,");

    if (addr.length >= 2 || addr != '') {
      postCode.value = addr[0];
      address.value = addr[1];
      detailAddress.value = addr[2];
      checkObj.postCode = true;
      checkObj.address = true;
    }

    checkObj.inputrecipient = true;

    if (inputTelMain.value.trim() != '') {
      console.log(inputTelMain.value.trim());
       checkObj.inputTelMain = true; 
      }
    else {
       checkObj.inputTelMain = false; 
      }

    if (supportAddress.value.trim() != '') {
      checkObj.postCode = true;
      checkObj.address = true;
    }
    else {
      checkObj.postCode = false;
      checkObj.address = false;
    }
  })


  //이름 , 번호, 주소 변경 이벤트시 checkObj값 변경
  //이름
  $('#inputName').change(function () {
    if (this.value.trim().length == 0) { checkObj.inputrecipient = false; }
    else { checkObj.inputrecipient = true; }
  })

  //번호
  $('#inputTelMain').change(function () {
    if (this.value.trim().length == 0) { checkObj.inputTelMain = false; }
    else { checkObj.inputTelMain = true; }
  })

  //주소
  $('#postCode').change(function () {
    if (this.value.trim().length == 0) { checkObj.inputAddress = false; }
    else { checkObj.inputAddress = true; }
  })



})();




//정보 제공 동의 
(function () {
  const PIA = document.getElementById("PIA");
  const LRA = document.getElementById("LRA");
  //모두 동의용 이벤트 
  document.getElementById("allAgree").addEventListener("change", function () {
    //let checked = true; //== 1: true으로 사용 가능
    let checked = document.getElementById('allAgree').checked;

    if (checked) {
      PIA.checked = true;
      LRA.checked = true;
      checkObj.PIA = true;
      checkObj.LRA = true;
    }
    if (!checked) {
      PIA.checked = false;
      LRA.checked = false;
      checkObj.PIA = false;
      checkObj.LRA = false;
    }
  })
  //각각 체크되었을 경우 checkedObj에 추가하는 이벤트
  document.getElementById("PIA").addEventListener("change", function () {
    checkObj.PIA = document.getElementById('PIA').checked;
  })

  document.getElementById("LRA").addEventListener("change", function () {
    checkObj.LRA = document.getElementById('LRA').checked;
  })
})();



/* --------------------------------------------------------------------------------------------- */
/* 아임포트 일반 결제*/
function requestPayInicis() {

  IMP.init("imp13427583");
  const uid = newUID($('#memberNo').val());
  // 이니시스 일반 결제
  // INIpayTest
  IMP.request_pay({
    pg: 'html5_inicis.INIpayTest',
    pay_method: 'card',
    merchant_uid: uid, // 상점에서 관리하는 주문 번호를 전달 (newUID으로 생성함)
    name: $('#fundingTitle').text(), //펀딩 이름 fundingTitle
    amount: 100,//$('#fullPrice').val()
    buyer_email: $('#memberEmail').text(), // buyeremail 이메일은 한글 사용 불가능
    buyer_name: $('#inputName').val(),
    buyer_tel: $('#inputTelMain').val(),
    buyer_addr: $('#Address').val() + $('#detailAddress').val(),
    buyer_postcode: $('#postCode').val()
  }, function (r) { // callback 로직

    $('#pay_method').val(r.pay_method);
    if (r.success) {
      Swal.fire({
        title: '결제 완료',
        text: "결제가 완료되었습니다!.",
        width: 340,		
        iconColor: 'rgb(251, 131, 107)',
        confirmButtonColor: 'rgb(251, 131, 107)',
        confirmButtonText: '확인',
        }).then((result) => {
          if (result.isConfirmed) {
            $('form[name="submitEvent"]').serialize();
            $('form[name="submitEvent"]').attr('method', 'POST');
            $('form[name="submitEvent"]').attr('action', 'pay/' + r.merchant_uid);
            
            document.getElementById("submitEvent").submit();
          }
         })

    } else {
      alert("결제에 실패하였습니다");
    }
  });


}


function kakaoPay() {
  IMP.init("imp13427583");
  const uid = newUID($('#memberNo').val());

  IMP.request_pay({
    pg: 'kakaopay.TC0ONETIME',
    pay_method: 'card', //생략 가능
    merchant_uid: uid, // 상점에서 관리하는 주문 번호
    name:$('#fundingTitle').text(),
    amount: 100,
    buyer_email: $('#memberEmail').text(), // buyeremail 이메일은 한글 사용 불가능
    buyer_name: $('#inputName').val(),
    buyer_tel: $('#inputTelMain').val(),
    buyer_addr: $('#Address').val() + $('#detailAddress').val(),
    buyer_postcode: $('#postCode').val()
  }, function (r) {

    $('#pay_method').val(r.pay_method);
    if (r.success) {
      Swal.fire({
        title: '결제 완료',
        text: "결제가 완료되었습니다!.",
        width: 340,		
        iconColor: 'rgb(251, 131, 107)',
        confirmButtonColor: 'rgb(251, 131, 107)',
        confirmButtonText: '확인',
        }).then((result) => {
          if (result.isConfirmed) {
            $('form[name="submitEvent"]').serialize();
            $('form[name="submitEvent"]').attr('method', 'POST');
            $('form[name="submitEvent"]').attr('action', 'pay/' + r.merchant_uid);
            
            document.getElementById("submitEvent").submit();
          }
         })

    } else {
      alert("결제에 실패하였습니다");
    }
  });
}


// 중복되지 않는 식별키를 생성해주는 함수
function newUID(memberNo) {
  const now = new Date();

  const uid = memberNo
    + addZero(now.getDate())
    + addZero(now.getHours())
    + addZero(now.getMilliseconds());

  return parseInt(uid);

}
function addZero(temp) {
  return temp < 10 ? "0" + temp : temp;
}



//onsubmit 함수
//결제방식 체크된 경우 true false 반환 
//$('.payment').is(':checked')
function submitValidate() {

  //결제정보 테스트
  if (!$('.payment').is(':checked')) {
    Swal.fire({
      title: "결제정보를 선택해주세요",
      width: 500,
      padding: '3em',
      color: 'black',
      confirmButtonColor: 'rgb(251, 131, 107)',
      confirmButtonText: '확인'
      });
    return false;
  }


  for (let i in checkObj) {
    if (!checkObj[i]) {
      Swal.fire({
        title: "필수 입력 값이 입력되지 않았습니다 (" + i + " )",
        width: 500,
        padding: '3em',
        color: 'black',
        confirmButtonColor: 'rgb(251, 131, 107)',
        confirmButtonText: '확인'
        });

      return false;
    }
  }


  let payMethod = $('input[name=pay-Method]:checked').val();

  $('#fullPrice').val($('#fullPrice').val()-$('#inputPoint').val());

  if( $('#fullPrice').val() == 0){
    alert("결제 완료되었습니다");
  }
  
  return false;
  switch (payMethod) {
    case 'none': 
        Swal.fire({
          title: '은행사의 문제로 지원되지 않습니다',
          width: 500,
          padding: '3em',
          color: 'black',
          confirmButtonColor: 'rgb(251, 131, 107)',
          confirmButtonText: '확인'
          });
      break;
    case 'pay': requestPayInicis(); break;
    case 'kakaoPay': kakaoPay(); break;

  }

}



//즉시 실행 함수로 이벤트 제거.
(function () {
  document.getElementById("submitEvent").onsubmit = function () {
    return false;
  }
})();



/* --------------------------------------------------------------- */
/* label 클릭 이벤트용 함수. */

//Selected Pay Method
//체크된 결제가 있는지 없는지
let SPM = true;
let temp = "";
$(".payBtn").click(function(){

  if(SPM){
    $(".payBtn").removeClass('reversBtnColor');
    $(".pp").removeClass('reversPp');
    // this.classList.add('fa-spin');
    
    // setTimeout(function() {
    //   $(".payBtn").removeClass('fa-spin');

    //  }, 1500);
    this.classList.add('reversBtnColor');
    const p = this.children[1];
    p.classList.add('reversPp');


    SPM=true;
  }else{
    SPM=false;
  }
 
});

//---------------------------------------------------

//결제시 포인트 사용 여부

const useAll = document.getElementById("useAll");
useAll.addEventListener("click",()=>{

  const havePoint = document.getElementById("havePoint").value;
  const fullPrice = document.getElementById("fullPrice").value;
  const inputPoint = document.getElementById("inputPoint");

  if(havePoint == 0){
    alert("사용 할 수 있는 포인트가 없습니다.");
    return;
  }

  if(Number(havePoint)>Number(fullPrice)){
    inputPoint.value = fullPrice;
  }else{
    inputPoint.value = havePoint;
  }
})

$('.agreeWrapper a').click(()=>{
  alert("솔직히 관심 없잔아요");
})