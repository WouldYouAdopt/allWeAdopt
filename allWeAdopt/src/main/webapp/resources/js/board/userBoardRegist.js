// 썸머노트 이미지 미리보기
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 1200,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
			disableResizeEditor:true,
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
        });
        
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
           var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
					$(el).summernote("editor.insertImage", contextPath + data.url);
				},
        error:function(request,status,error){
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
			});
		}

(function (){ 
		// 지역선택, 축종 버튼에 값이 없을 시 상세 드롭다운 버튼 숨김
		if(document.getElementsByName("areaValue")[0].innerText.trim()=="지역 선택"){
		document.getElementsByName("areaDetailValue")[0].style.display = "none";	
		}

		if(document.getElementsByName("animalTypeValue")[0].innerText.trim()=="축종"){
		document.getElementsByName("animalDetailValue")[0].style.display = "none";	
		}
})();

// 버튼 값 변경
const selectMenu = document.getElementsByClassName("selectMenu");

for (let i = 0; i < selectMenu.length; i++) {
	selectMenu[i].addEventListener("click",function () {
		selectMenu[i].parentElement.previousElementSibling.innerText = selectMenu[i].innerText;

		document.getElementsByName("category")[0].value = document.getElementsByName("categoryValue")[0].innerText;

		document.getElementsByName("area")[0].value = document.getElementsByName("areaValue")[0].innerText;

		document.getElementsByName("animalType")[0].value = document.getElementsByName("animalTypeValue")[0].innerText;

		document.getElementsByName("genders")[0].value = document.getElementsByName("genderValue")[0].innerText.trim();

		document.getElementsByName("neuterings")[0].value = document.getElementsByName("neuteringValue")[0].innerText.trim();

		if(document.getElementsByName("category")[0].value=="보호"){
			document.getElementsByClassName("dateArea")[0].style.display = "block";
		}else{
			document.getElementsByClassName("dateArea")[0].style.display = "none";
		}
		// 지역선택, 축종 버튼에 값이 있을 시 상세 드롭다운 버튼 생성
		if(document.getElementsByName("areaValue")[0].innerText.trim()!="지역 선택"){
			document.getElementsByName("areaDetailValue")[0].style.display = "block";	
		  }
	
		if(document.getElementsByName("animalTypeValue")[0].innerText.trim()!="축종"){
		document.getElementsByName("animalDetailValue")[0].style.display = "block";	
		}
	})
};

// 지역이 바뀔 때마다 상세 지역 값 초기화
const areaList = document.getElementsByClassName("areaList");

const ul = document.getElementsByName("areaDetailValue")[0].nextElementSibling;
	
	for (let i = 0; i < areaList.length; i++) {
		areaList[i].addEventListener("click",function () {
			document.getElementsByName("areaDetailValue")[0].innerText = "상세 지역 선택";
	const area = document.getElementsByName("area")[0].value;

	// 지역 선택에 따른 상세 지역 조회
	$.ajax({
		url: "loadAreaList",
		contentType: "application/json",
		dataType: "json",
		type: "GET",
		data: {
			"area" : area
		},
		success: function(data){
			while (ul.hasChildNodes()) {
				ul.removeChild(ul.firstChild);
			}
			
			for(let i in data){
				const li = document.createElement("li");
				li.classList.add("dropdown-item","areaDetail");
				ul.appendChild(li);
				let text = document.createTextNode(data[i].areaDetail);
				li.appendChild(text);
			}
			
		},
		error: function (request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
});
};

// 상세 지역 값 적용
function areaDetailFunc(){
	const Adetail = document.getElementsByClassName("areaDetail");
	for (let i = 0; i < Adetail.length; i++) {
			Adetail[i].addEventListener("click",function () {
			Adetail[i].parentElement.previousElementSibling.innerText = Adetail[i].innerText;
			document.getElementsByName("areaDetail")[0].value = document.getElementsByName("areaDetailValue")[0].innerText;
		});
	}
};

// 축종이 바뀔 때마다 품종 값 초기화
const animalList = document.getElementsByClassName("animalList");

const ul2 = document.getElementsByName("animalDetailValue")[0].nextElementSibling;
	
	for (let i = 0; i < areaList.length; i++) {
		animalList[i].addEventListener("click",function () {
		document.getElementsByName("animalDetailValue")[0].innerText = "품종";
		const animalType = document.getElementsByName("animalType")[0].value;

	// 지역 선택에 따른 상세 지역 조회
	$.ajax({
		url: "loadAnimalList",
		contentType: "application/json",
		dataType: "json",
		type: "GET",
		data: {
			"animalType" : animalType
		},
		success: function(data){
			while (ul2.hasChildNodes()) {
				ul2.removeChild(ul2.firstChild);
			}
			
			for(let i in data){
				const li = document.createElement("li");
				li.classList.add("dropdown-item","animalDetail");
				ul2.appendChild(li);
				let text = document.createTextNode(data[i].animalDetail);
				li.appendChild(text);
			}

			const animal = document.getElementsByName("animalTypeValue")[0];
			const animalDt = document.getElementsByName("animalDetailValue")[0];

			if(animal.innerText.trim()=="기타"){
				animalDt.style.display = 'none';
				document.getElementsByName("animalDetailValue")[0].innerText='';
				document.getElementsByName("animalDetail")[0].value = '';
			 } else{
				animalDt.style.display = 'block';
			 }
		},
		error: function (request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
});
};

// 품종 값 적용
function animalDetailFunc(){
	const Adetail = document.getElementsByClassName("animalDetail");
	for (let i = 0; i < Adetail.length; i++) {
			Adetail[i].addEventListener("click",function () {
			Adetail[i].parentElement.previousElementSibling.innerText = Adetail[i].innerText;
			document.getElementsByName("animalDetail")[0].value = document.getElementsByName("animalDetailValue")[0].innerText;
		});
	}
};

// 유효성 검사
function regist(){
	const validate = {
		"categoryVali" : false,
		"imgBoolVali" : false,
		"titleVali" : false,
		"contentVali" : false,
		"areaVali" : false,
		"areaDetailVali" : false,
		"phoneVali" : false,
		"animalVali" : false,
		"animalDetailVali" : false,
		"neuteringVali" : false,
		"genderVali" : false,
		"periodVali" : false
	};
	// 카테고리 검사
	const category = document.getElementsByName("categoryValue")[0];
	if(category.innerText.trim() == '카테고리를 선택해주세요'){
		validate.categoryVali = false;
	}else{
		validate.categoryVali = true;
	}
	
	// img검사
	const imgBool = !!document.querySelector('.card-block img');
	if(!imgBool){
		validate.imgBoolVali = false;
	}else{
		validate.imgBoolVali = true;
	}

	
	// 게시글 제목 검사
	const title = document.getElementById("boardTitle");
	if(title.value.trim()==0){
		validate.titleVali = false;
	}else{
		validate.titleVali = true;
	}

	// 게시글 내용 검사
	const content = document.getElementById("summernote");
	if(content.value.trim()==0){
		validate.contentVali = false;
	}else{
		validate.contentVali = true;
	}

	// 지역 검사
	const area = document.getElementsByName("areaValue")[0];
	if(area.innerText.trim()=='지역 선택'){
		validate.areaVali = false;
	}else{
		validate.areaVali = true;
	}

	// 상세 지역 검사
	const areaDetail = document.getElementsByName("areaDetailValue")[0];
	if(areaDetail.innerText.trim()=='상세 지역 선택'){
		validate.areaDetailVali = false;
	}else{
		validate.areaDetailVali = true;
	}

	// 연락처 검사
	const phone = document.getElementsByName("phone")[0];
	if(phone.value.trim()==0){
		validate.phoneVali = false;
	}else{
		validate.phoneVali = true;
	}

	// 축종 검사
	const animal = document.getElementsByName("animalTypeValue")[0];
	if(animal.innerText.trim()=="축종"){
		validate.animalVali = false;
	 }else{
		validate.animalVali = true;
	}

	 // 품종 검사
	const animalDt = document.getElementsByName("animalDetailValue")[0];
	if(animalDt.innerText.trim()=="품종"){
		validate.animalDetailVali = false;
	 }else{
		validate.animalDetailVali = true;
	}

	 // 성별 검사
	const gender = document.getElementsByName("genderValue")[0];
	if(gender.innerText.trim()=="수컷 / 암컷"){
		validate.genderVali = false;
	 }else{
		validate.genderVali = true;
	}

	// 중성화 검사
	const neutering = document.getElementsByName("neuteringValue")[0];
	if(neutering.innerText.trim()=="완료 / 미완료"){
		validate.neuteringVali = false;
	 }else{
		validate.neuteringVali = true;
	}

	// 날짜 검사
	const period = document.getElementsByName("boardPeriod")[0];
	const period2 = document.getElementsByName("boardPeriod2")[0];
	
	if((period.value=='')&&(period2.value=='')){
		validate.periodVali = true;
	}else if((period.value=='')&&(period2.value!='')){
		validate.periodVali = false;
	}else if((period.value!='')&&(period2.value=='')){
		validate.periodVali = false;
	}else if(period.value >= period2.value){
		validate.periodVali = false;
	}
	else{
		validate.periodVali = true;
	}
	
	for(let key in validate){ // 객체용 향상된 for문
        let str;
        // 현재 접근 중인 key의 value가 true인 경우
        if(!validate[key]){

			switch(key){
				case "categoryVali"    : str="카테고리 선택란을"; break;
				case "imgBoolVali"       : str="1장 이상의 이미지를 삽입해야 합니다. 이미지를"; break;    
				case "titleVali"		: str="게시글 제목 입력란"; break;
				case "contentVali"     : str="게시글 내용 입력란"; break;
				case "areaVali"      : str="지역 선택란을"; break;
				case "areaDetailVali"            : str="상세지역 선택란을"; break;
				case "phoneVali"            : str="휴대폰 입력란을"; break;
				case "animalVali"            : str="축종 선택란을"; break;
				case "animalDetailVali"            : str="품종 선택란을"; break;
				case "neuteringVali"            : str="중성화 선택란을"; break;
				case "genderVali"            : str="성별 선택란을"; break;
				case "periodVali"            : 
				str="공유 기간 선택란의 형식이 맞지 않거나 나머지 선택란이 입력되지 않았습니다. 날짜 선택란을"; break;
				}
				
				str += " 확인해주세요.";

            Swal.fire({
				title: str,
				width: 600,
				padding: '3em',
				color: 'black',
				confirmButtonColor: 'rgb(251, 131, 107)',
				confirmButtonText: '확인'
				});

				return false;
        }
	}
	
};

// function valiSuccess(conMessage) {
// 	Swal.fire({
// 		title: conMessage,
// 		width: 600,
// 		padding: '3em',
// 		color: 'black',
// 		confirmButtonColor: 'rgb(251, 131, 107)',
// 		confirmButtonText: '확인'
// 		}).then((result) => {
// 			if (result.isConfirmed) {
// 				return true;
// 			}
// 		 });
// }