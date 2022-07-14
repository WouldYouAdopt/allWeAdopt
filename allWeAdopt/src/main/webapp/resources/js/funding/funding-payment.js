
//유효성 검사용 변수
const checkObj = {
  "inputrecipient": false,
  "inputTelMain": false,
  "postCode": false,
  "address": false,
  "PIA": false,
  "LRA": false
};

function DaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
    var roadAddr = data.roadAddress; // 도로명 주소 변수
    var extraRoadAddr = ''; // 참고 항목 변수
    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      let addr;
      document.getElementById("postCode").value = data.zonecode ;
      document.getElementById("Address").value = roadAddr ;
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

    inputName.value = prevOrder.recipient;
    inputTelMain.value = prevOrder.orderPhoneMain;
    if (prevOrder.orderPhoneSub != '') {
      inputTelSub.value = prevOrder.orderPhoneSub;
    }
    
    const addr = prevOrder.orderAddress.split(",,");
 
    if (addr.length >= 2){
      postCode.value=addr[0];
      address.value=addr[1];
      detailAddress.value=addr[2];

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
    
    postCode.value="";
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
 
    if (addr.length >=2 ||addr!=''){
      postCode.value=addr[0];
      address.value=addr[1];
      detailAddress.value=addr[2];
      checkObj.postCode = true;
      checkObj.address = true;
    }

    checkObj.inputrecipient = true;

    if (inputTelMain != '') {      checkObj.inputTelMain = true;    }
    else{checkObj.inputTelMain = false;}

    if (supportAddress != '') {       
      checkObj.postCode = true;
      checkObj.address = true;  
    }
    else{
      checkObj.postCode = false;
      checkObj.address = false;}
  })


  //이름 , 번호, 주소 변경 이벤트시 checkObj값 변경
//이름
  $('#inputName').change(function(){
    if(this.value.trim().length==0){              checkObj.inputName = false;    }
    else{      checkObj.inputName = true;    }
  })

//번호
  $('#inputTelMain').change(function(){
    if(this.value.trim().length==0){              checkObj.inputTelMain = false;    }
    else{      checkObj.inputTelMain = true;    }
  })

//주소
$('#postCode').change(function(){
  if(this.value.trim().length==0){         checkObj.inputAddress = false;    }
  else{      checkObj.inputAddress = true;    }
})

  

})();




//정보 제공 동의 
(function(){
  const PIA = document.getElementById("PIA");
  const LRA = document.getElementById("LRA");
  //모두 동의용 이벤트 
  document.getElementById("allAgree").addEventListener("change",function(){
    //let checked = true; //== 1: true으로 사용 가능
    let checked = document.getElementById('allAgree').checked;

    if(checked){
      PIA.checked = true;
      LRA.checked = true;
      checkObj.PIA = true;
      checkObj.LRA = true;
    }
    if(!checked){
      PIA.checked = false;
      LRA.checked = false;
      checkObj.PIA = false;
      checkObj.LRA = false;
    }
  })
  //각각 체크되었을 경우 checkedObj에 추가하는 이벤트
  document.getElementById("PIA").addEventListener("change",function(){
    checkObj.PIA = document.getElementById('PIA').checked;
  })
  
  document.getElementById("LRA").addEventListener("change",function(){
    checkObj.LRA = document.getElementById('LRA').checked;
  })
})();



//onsubmit 함수

//결제방식 체크된 경우 true false 반환 
//$('.payment').is(':checked')





function submitValidate(){

  //결제정보 테스트
    if(!$('.payment').is(':checked')){
      alert("결제정보를 선택해주세요");
      return false;
    }


    for(let i in checkObj){
        if(!checkObj[i]){
          alert("필수 입력 값이 입력되지 않았습니다 ("+i+" )");
          return false;
        }
    }

}












/* 아임포트 동의*/

function requestPay() {
  IMP.init("{imp13427583}");
  
  IMP.request_pay({ 
      
      // 파라미터 찾아보기
      // https://docs.iamport.kr/sdk/javascript-sdk?lang=ko#request_pay

      //------------------------------------------------------------------
      // pg: "kakaopay",
      // pay_method: "kakaopay", //결제수단 
      // merchant_uid: "TC0ONETIME",
      // name: "노르웨이 회전 의자",
      // amount: 100, //TC0ONETIME
      // //주문자 정보 ---------------------------------
      // buyer_email: "gildong@gmail.com",
      // buyer_name: "홍길동",
      // buyer_tel: "010-4242-4242",
      // buyer_addr: "서울특별시 강남구 신사동",
      // buyer_postcode: "01181"
      //------------------------------------------------------------------

      pg : 'kakaopay',
      pay_method : 'card', //생략 가능
      merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
      name : '주문명:결제테스트',
      amount : 14000,
      buyer_email : 'iamport@siot.do',
      buyer_name : '구매자이름',
      buyer_tel : '010-1234-5678',
      buyer_addr : '서울특별시 강남구 삼성동',
      buyer_postcode : '123-456'

  }, function (rsp) { 

    console.log(rsp);
      // if (rsp.success) {
      //     console.log("결제 성공!!!!!!!!!!!!!");
      //   } else {
      //   console.log("결제 실패ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");        
      // }

      
  });
}


