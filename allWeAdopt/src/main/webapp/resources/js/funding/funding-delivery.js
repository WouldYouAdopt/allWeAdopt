


/* 모두 체크하는 이벤트 부여 */

let bol = true;
(function () {
    if ($('#flexCheckDefault') != null) {
        $('#flexCheckDefault').click(function () {
            if (bol) {
                $('input:checkbox').prop('checked', true);
                this.style.backgroundColor="#FB836b";
                bol=false;
            } else {
                $('input:checkbox').prop('checked', false);
                this.style.backgroundColor="white";
                bol=true;
            }
        });
    }
})();



//각종 버튼들에 이벤트를 추가해주는 즉시 실행 함수.
(function () {
    //배송조회 버튼
    const selectDelivery = document.getElementById("selectDelivery");
    if (selectDelivery != null) {
        document.getElementById("selectDelivery").addEventListener("click", function () {
            submitSweettracker = document.getElementById("submitSweettracker");

            window.open('', "sweettracker", "width=500, height=800");
            submitSweettracker.target = "sweettracker";
            submitSweettracker.submit();
        })
    }


    //결제 취소 버튼
    const cancelPayment = document.getElementById("cancelPayment");
    if (cancelPayment != null) {
        cancelPayment.addEventListener("click", function () {

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
                        url: '../cancel/' + paymentNo,
                        type: "get",
                        success: function (result) {

                            if (result > 0) {
                                Swal.fire({
                                    title: '결제 취소',
                                    text: "정상적으로 결제 취소 되었습니다..",
                                    width: 340,
                                    icon: 'success',
                                    iconColor: 'rgb(251, 131, 107)',
                                    confirmButtonColor: '008000',
                                    confirmButtonText: '확인',
                                }).then((result) => {
                                    location.href = "";
                                })

                            }
                        },
                        error(request, status, error) {
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
                } else {

                    e.preventDefault();
                }
            })

        })

    }


    //환불 버튼
    const refundBtn = document.getElementById("refundBtn");
    if (refundBtn != null) {
        refundBtn.addEventListener("click", function () {

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
                        url: '../refund/' + paymentNo,
                        type: "get",
                        success: function (result) {

                            if (result > 0) {
                                Swal.fire({
                                    title: '환불',
                                    text: "환불 신청이 완료되었습니다.",
                                    width: 340,
                                    icon: 'success',
                                    iconColor: 'rgb(251, 131, 107)',
                                    confirmButtonColor: '008000',
                                    confirmButtonText: '확인',
                                }).then((result) => {
                                    location.href = "";
                                })

                            }
                        },
                        error(request, status, error) {
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
                } else {
                    e.preventDefault();
                }
            })

        })
    }

    //반품 버튼
    const returnBtn = document.getElementById("returnBtn");
    if (returnBtn != null) {

        returnBtn.addEventListener("click", function () {

            document.getElementById("btn-area").innerHTML = "";

            const div = document.createElement("div");
            div.classList.add("summernoteArea");

            const h3 = document.createElement("h3");
            h3.innerText = "사유를 입력해주세요";
            div.append(h3);

            const ta = document.createElement("textarea");
            ta.setAttribute("id", "summernote");
            ta.setAttribute("name", "returnReason");
            div.append(ta);


            const div2 = document.createElement("div");
            div2.classList.add("btnArea")

            const button1 = document.createElement("button");
            button1.setAttribute("id", "returnSubmitBtn");
            button1.setAttribute("onclick", "sendReturn()");
            button1.innerText = "반품 신청";
            div2.append(button1);

            const button2 = document.createElement("button");
            button2.setAttribute("id", "returnCancelBtn");
            button2.setAttribute("onclick", "location.href=''");
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
function summer() {
    $('#summernote').summernote({
        placeholder: '반품 사유를 작성해주세요.',
        tabsize: 2,
        height: 200,
        focus: true,
        disableResizeEditor: true,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['insert', ['picture']],
            ['view', ['codeview', 'fullscreen']]
        ]
    });
};

//반품사유 작성
function sendReturn() {
    console.log('연결 완료');

    const ta = document.getElementById("summernote");

    if (ta.value.trim().length == 0) {
        Swal.fire({
            title: '반품 사유를 작성해주세요',
            width: 350,
            padding: '3em',
            color: 'black',
            confirmButtonColor: 'rgb(251, 131, 107)',
            confirmButtonText: '확인'
        });

        ta.value = "";
        ta.focus();
        return;
    }


    $.ajax({
        url: '../return/' + paymentNo,
        type: "post",
        data: { 'returnReason': ta.value },
        dataType: "json",
        success: function (result) {

            console.log(result);
            console.log("정상 수행");
            if (result != '') {
                Swal.fire({
                    title: '반품',
                    text: "반품 신청이 완료되었습니다.",
                    width: 340,
                    icon: 'success',
                    iconColor: 'rgb(251, 131, 107)',
                    confirmButtonColor: '008000',
                    confirmButtonText: '확인',
                }).then((result) => {
                    location.href = "";
                })

            }
        },
        error(request, status, error) {
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


function selectReturnState() {

    if (
        document.getElementsByClassName("summernoteArea")[0] != null) {
        document.getElementsByClassName("summernoteArea")[0].innerHTML = "";
    }
 


    $.ajax({
        url: contextPath+'/funding/my/selectReturn/' + paymentNo,
        type: "POST",
        dataType: "json",
        success: function (result) {
            console.log(result);
            const div = document.createElement("div");
            div.classList.add("summernoteArea");

            const ta = document.createElement("textarea");
            ta.readOnly="true";
            ta.setAttribute("id", "returnReason");
            ta.innerHTML=result;
            div.append(ta);

            document.getElementById("twoTable").after(div);

         
        },
        error(request, status, error) {
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    })

}

/* ------------------------------------------------------------------------------------ */
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


//발송 처리 버튼

function process(code) {
    let obj="";
    let msg="";
    switch(code){
        case 2:msg='배송';break;
        case 4:msg='배송 완료';break;
        case 5:msg='결제 취소';break;
        case 9:msg='반품 완료';break;
    }

    if(code==9){
        if($("input[name='flexRadioDefault']:checked").parent().siblings()[4].innerText != '반품 신청'){
            alert('반품 신청중인 주문만 처리 가능합니다.');
            return false;
        } 
        obj = $("input[type='radio']:checked").val();
    }else{
        $('input[type="checkbox"]:checked').each(function (index) {
           
            if(index != 0){
                obj += ', ';
            }
            obj += $(this).val();
        });
    }
        

    if(obj == ''){
        alert('주문을 체크해주세요');
        return false;
    } else{
        console.log('프로세스 진행');
    }


    $.ajax({
        url: '../processing',
        data: { code:code , //변경할 값
                orderCode:orderCode, //현재 카테고리 번호
                list:obj  ,  //체크된 대상들
                fundingNo : fundingNo // 현재 펀딩 번호/
            },
        type: "get",
        dataType:"json",
        success: function (orderList) {
            if(orderList != null){
               alert(msg+' 처리 가 완료되었습니다');
               const tbody = document.getElementById("tbody");
               
               tbody.innerHTML = "";
                for(let o of orderList){
                    const tr = document.createElement("tr");

                    const th1 = document.createElement("th");
                    const input1 = document.createElement("input");

                    if(code==9){
                        input1.classList.add("form-check-input");
                        input1.setAttribute("type","radio");
                        input1.setAttribute("value",o.paymentNo);
                        input1.setAttribute("name","flexRadioDefault");
                        input1.setAttribute("id","flexRadioDefault");
                    }else{   
                        input1.classList.add("form-check-input");
                        input1.setAttribute("type","checkbox");
                        input1.setAttribute("value",o.paymentNo);
                    }

                    th1.append(input1);
                    tr.append(th1);

                    const td1 = document.createElement("td");
                    td1.innerText=o.paymentNo;
                    const td2 = document.createElement("td");
                    td2.innerText=o.fundingCategory;
                     

                    const td3 = document.createElement("td");
                    const a = document.createElement("a");
                    a.setAttribute("href","../detail/"+o.paymentNo);
                    a.innerHTML=o.fundingTitle;
                    td3.append(a);
                    const td4 = document.createElement("td");
                    td4.innerText=o.recipient;
                    const td5 = document.createElement("td");
                    td5.innerText=o.orderState;
                    const td6 = document.createElement("td");
                    td6.innerText=o.payDate;
                    tr.append(td1,td2,td3,td4,td5,td6);
                    if(code != 9){
                        const td7 = document.createElement("td");
                        td7.innerText=o.fullPrice;
                        tr.append(td7);
                    }

                    
                    tbody.append(tr);
                }
            

            }
        },
        error(request, status, error) {
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    })

}


async function returnProcess(code){
    if(!$('input:radio[name=flexRadioDefault]').is(':checked')){
        alert('주문을 체크해주세요');
        return false;
    } 
    const { value: text } = await Swal.fire({
        input: 'textarea',
        inputLabel: '반품 사유를 작성해주세요',
        inputPlaceholder: '반품 사유를 작성해주세요',
        inputAttributes: {
          'aria-label': 'Type your message here'
        }
      });

      if (text == '') {
        Swal.fire('반품사유를 작성해주세요');
        return false;
      }

      $.ajax({
        url: '../return/processing',
        data: { code:code , //변경할 값
                orderCode:orderCode, //현재 카테고리 번호
                fundingNo : fundingNo, // 현재 펀딩 번호/
                returnReason:text,
                paymentNo:$("input[name='flexRadioDefault']:checked").val(),
            },
        type: "get",
        dataType:"json",
        success: function (orderList) {
            alert("반품처리가 완료되었습니다");
            if(orderList != ''){
                const tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for(let o of orderList){
                    const tr = document.createElement("tr");

                    const th1 = document.createElement("th");
                    const input1 = document.createElement("input");
                    input1.classList.add("form-check-input");
                    input1.setAttribute("type","radio");
                    input1.setAttribute("value",o.paymentNo);
                    input1.setAttribute("name","flexRadioDefault");
                    input1.setAttribute("id","flexRadioDefault");
                    th1.append(input1);

                    const td1 = document.createElement("td");
                    td1.innerText=o.paymentNo;
                    const td2 = document.createElement("td");
                    td2.innerText=o.fundingCategory;
                     

                    const td3 = document.createElement("td");
                    const a = document.createElement("a");
                    a.setAttribute("href","../detail/"+o.paymentNo);
                    a.innerHTML=o.fundingTitle;
                    td3.append(a);

                    const td4 = document.createElement("td");
                    td4.innerText=o.recipient;
                    const td5 = document.createElement("td");
                    td5.innerText=o.orderState;
                    const td6 = document.createElement("td");
                    td6.innerText=o.payDate;

                    tr.append(th1,td1,td2,td3,td4,td5,td6);
                    tbody.append(tr);
                }
            }

        },error(request, status, error) {
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    
    })
}


/* 즉시 실행 함수로 현재 선택된 페이지에 클래스 부여해주는 이벤트 */

(function(){ 
        if(orderCode != ''){
            document.getElementById(orderCode).classList.add("navCoice");
        }
} )();


function refoudPouprocess(){
    if(!$('input:radio[name=flexRadioDefault]').is(':checked')){
        alert('주문을 체크해주세요');
        return false;
    } 
    const st = $("input[name='flexRadioDefault']:checked").parent().siblings()[4].innerText;
    if(st =='반품 신청'){
        alert('반품 처리가 완료된 후 <br> 환불 처리가 가능합니다.');
        return false;
    }else if(st=='환불 처리중'){
        alert('이미 처리된 건입니다 .');
        return false;
    }

    $.ajax({
        url: '../processing',
        data: { code:6 , //변경할 값
                orderCode:orderCode, //현재 카테고리 번호
                list:$("input[name='flexRadioDefault']:checked").val()  ,  //체크된 대상들
                fundingNo : fundingNo // 현재 펀딩 번호/
            },
        type: "get",
        dataType:"json",
        success: function (orderList) {
            if(orderList != null){
               alert('정상적으로 처리되었습니다.<br> [환불 소요 예상 시간 3일]');
               const tbody = document.getElementById("tbody");
               tbody.innerHTML = "";
               for(let o of orderList){
                   const tr = document.createElement("tr");

                   const th1 = document.createElement("th");
                   const input1 = document.createElement("input");
                   input1.classList.add("form-check-input");
                   input1.setAttribute("type","radio");
                   input1.setAttribute("value",o.paymentNo);
                   input1.setAttribute("name","flexRadioDefault");
                   input1.setAttribute("id","flexRadioDefault");
                   th1.append(input1);

                   const td1 = document.createElement("td");
                   td1.innerText=o.paymentNo;
                   const td2 = document.createElement("td");
                   td2.innerText=o.fundingCategory;
                    

                   const td3 = document.createElement("td");
                   const a = document.createElement("a");
                   a.setAttribute("href","../detail/"+o.paymentNo);
                   a.innerHTML=o.fundingTitle;
                   td3.append(a);

                   const td4 = document.createElement("td");
                   td4.innerText=o.recipient;
                   const td5 = document.createElement("td");
                   td5.innerText=o.orderState;
                   const td6 = document.createElement("td");
                   td6.innerText=o.payDate;

                   tr.append(th1,td1,td2,td3,td4,td5,td6);
                   tbody.append(tr);
               }

            }

        },
        error(request, status, error) {
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    })


}

function sendProcessing(){
    let obj = "";
    let bol=false;
    let msg = '';
    $('input[class="tList"]:checked').each(function (index) {
         const payNo = $(this).val();
//         const company = $(this).parent().parent().children(6).children(0);
         const pc = this.parentElement.parentElement.children[6].children[0].value;
         const parcelNo = this.parentElement.parentElement.children[7].children[0].value;
         
         
         if (parcelNo == '') {
            msg="운송장번호가 입력되지 않았습니다.";
            this.parentElement.parentElement.children[7].children[0].focus();
            bol=true;
        }else{
            const reg=/^\d{9}$/;
            if(!reg.test(parcelNo)){
                msg="운송장 번호는 숫자 [9자리]만.<br>작성 가능합니다.";
                this.parentElement.parentElement.children[7].children[0].value="";
                bol=true;
            }
        }
        const jsObj={
            'paymentNo':payNo,
            'parcelCompany':pc,
            'parcelNo':parcelNo
        }
        obj += JSON.stringify(jsObj)+"-";
    })
    
    if (obj == '') {
        alert('선택된 주문이 없습니다.');
        return false;
    }
    if(bol){
        alert(msg);
        return false
    }
  
    
    $.ajax({
        url: '../sendProcessing',
        type: "post",
        data: { 'insertJSON': obj,
                'orderCode':orderCode,
                fundingNo : fundingNo
              },
        dataType: "json",
        success: function (sendList) {
            if(sendList != null){

       
            alert('발송 처리 가 완료되었습니다');
               const tbody = document.getElementById("tbody");
               
               tbody.innerHTML = "";
                for(let o of sendList){

                    const tr = document.createElement("tr");

                    const th1=document.createElement("th");
                        const input1=document.createElement("input");
                        input1.classList.add("tList");
                        input1.setAttribute("type","checkbox");
                        input1.value=o.paymentNo;
                        th1.append(input1);

                    const td2=document.createElement("td");
                       td2.innerText=o.paymentNo;
                       
                    const td3=document.createElement("td");
                       td3.innerText=o.fundingCategory;

                    const td4=document.createElement("td");
                        const a = document.createElement("a");
                        a.setAttribute("href","../detail/"+o.paymentNo);
                        a.innerText=o.fundingTitle;
                        td4.append(a);

                    const td5=document.createElement("td");
                        td5.innerText=o.recipient;
                    const td6=document.createElement("td");
                        td6.innerText=o.payDate;

                    const td7=document.createElement("td");
                    td7.classList.add("parcel");
                        const select = document.createElement("select");
                        select.classList.add("form-select");
                        select.classList.add("parcelCompany");
                        select.setAttribute("name","parcelCompany");
                        select.setAttribute("aria-label","Default select example");     
                        const o1 = document.createElement("option");
                        o1.value="CJ대한통운";
                        o1.innerText="CJ대한통운";
                        const o2 = document.createElement("option");
                        o2.value="롯데택배";
                        o2.innerText="롯데택배";
                        const o3 = document.createElement("option");
                        o3.value="우체국택배";
                        o3.innerText="우체국택배";
                        select.append(o1,o2,o3);
                    td7.append(select);

                    const td8=document.createElement("td");
                    td8.classList.add("parcel");
                        const input2=document.createElement("input");
                        input2.setAttribute("type",'text');
                        input2.setAttribute("name",'parcelNo');
                        input2.classList.add("parcelNo");
                    td8.append(input2);
                    
                    tr.append(th1,td2,td3,td4,td5,td6,td7,td8);
                    
                    tbody.append(tr);
                }                    
            }    
        },
        error(request, status, error) {
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    })
}

function changeFunding(sel){
    const fundingNo = sel.options[sel.selectedIndex].value;
    location.href="../" + fundingNo+"/"+orderCode;

}
