
//유효성 검사용 변수
const checkObj = {
  "inputrecipient": false,
  "inputTelMain": false,
  "inputAddress": false,
  "checkedPayMethod": false,
  "agree": false
};



function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== '' && data.apartment === 'Y') {
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== '') {
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      let addr;
      addr = "(" + data.zonecode + ")";
      addr += roadAddr;

      const p = document.createElement('p');
      p.classList.add('badge');
      p.classList.add('bg-primary');
      p.classList.add('text-wrap');
      p.setAttribute('id', 'addressInfo');
      p.innerText = addr;
      console.log(addr);
      document.getElementById('findPostcode').after(p);
      document.getElementById('address').setAttribute('value', addr)
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
  const address = document.getElementById("address");
  const detailAddress = document.getElementById("detailAddress");

  const backUp = document.getElementsByClassName("inputArea")[0].innerHTML;

  //이전 배송지
  prevDestination.addEventListener("change", function () {
    console.log('이전 주소 체크됨');

    inputName.value = prevOrder.recipient;
    inputTelMain.value = prevOrder.orderPhoneMain;
    if (prevOrder.orderPhoneSub != null) {
      inputTelSub.value = prevOrder.orderPhoneSub;
    }
    address.value = prevOrder.orderAddress;
    detailAddress.value = prevOrder.orderAddress;


    checkObj.inputrecipient = true;
    checkObj.inputTelMain = true;
    checkObj.inputAddress = true;

  })

  //신규 배송지
  newDestination.addEventListener("change", function () {
    console.log('신규배송지 체크됨');
    inputName.value = "";
    inputTelMain.value = "";
    inputTelSub.value = "";
    address.value = "";
    detailAddress.value = "";

    checkObj.inputrecipient = false;
    checkObj.inputTelMain = false;
    checkObj.inputAddress = false;
  })

  //서포터 정보와 동일
  supportDestination.addEventListener("change", function () {
    console.log('서포터 주소 체크됨');
    inputName.value = supportName;
    inputTelMain.value = supportTel;
    inputTelSub.value = "";
    address.value = supportAddress;
    detailAddress.value = supportAddress;


    checkObj.inputrecipient = true;

    if (inputTelMain != '') {
      checkObj.inputTelMain = true;
    }
    if (supportAddress != '') {
      checkObj.inputAddress = true;
    }

  })

})()




$('')





