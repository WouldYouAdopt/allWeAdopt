(function (){ 
	const diffTime = document.getElementsByClassName('diffTime');
	
  // 몇 분전, 몇 일전 표시
  for (let i = 0; i < diffTime.length; i++) {
      if (diffTime[i].innerText < 60) {
        diffTime[i].innerText = "방금 전";
      } else if ((diffTime[i].innerText / 60) < 60) {
        diffTime[i].innerText = diffTime[i].innerText/60;
        diffTime[i].innerText = Math.round(diffTime[i].innerText) + "분 전";
      } else if ((diffTime[i].innerText / 3600) < 24) {
        diffTime[i].innerText = diffTime[i].innerText/3600;
        diffTime[i].innerText = Math.round(diffTime[i].innerText) + "시간 전";
      } else if ((diffTime[i].innerText / (3600*24)) < 30) {
        diffTime[i].innerText = diffTime[i].innerText/(3600*24);
        diffTime[i].innerText = Math.round(diffTime[i].innerText) + "일 전";
      } else if ((diffTime[i].innerText / (3600*24*30)) < 12) {
        diffTime[i].innerText = diffTime[i].innerText/(3600*24*30);
        diffTime[i].innerText = Math.round(diffTime[i].innerText) + "달 전";
      } else {
        diffTime[i].innerText = diffTime[i].innerText/(3600*24*30*12);
        diffTime[i].innerText = Math.round(diffTime[i].innerText) + "년 전";
      }
      }

	  // 검색을 실행했을 경우 검색필터에 값 저장
	  document.getElementsByName("category")[0].value = document.getElementsByName("categoryValue")[0].innerText.trim();

	  document.getElementsByName("area")[0].value = document.getElementsByName("areaValue")[0].innerText.trim();

	  document.getElementsByName("areaDetail")[0].value = document.getElementsByName("areaDetailValue")[0].innerText.trim();
	  
	  document.getElementsByName("animalType")[0].value = document.getElementsByName("animalTypeValue")[0].innerText.trim();

	  document.getElementsByName("animalDetail")[0].value = document.getElementsByName("animalDetailValue")[0].innerText.trim();

	  // 검색 후 검색창이 열려있게 설정
	  if(displayValue==1){
		document.getElementById("search-area").style.display = "block"
		document.getElementById("searchBtn").style.display = "block"
	  }

	  // 지역선택, 축종 버튼에 값이 없을 시 상세 드롭다운 버튼 숨김
	  if(document.getElementsByName("areaValue")[0].innerText.trim()=="지역선택"){
		document.getElementsByName("areaDetailValue")[0].style.display = "none";	
	  }

	  if(document.getElementsByName("animalTypeValue")[0].innerText.trim()=="축종"){
		document.getElementsByName("animalDetailValue")[0].style.display = "none";	
	  }

	  // 축종 값이 있을 시 품종 목록 불러오기
	  animalDetailAjax(document.getElementsByName("animalType")[0].value.trim());

	  // 지역 값이 있을 시 상세지역 목록 불러오기
	  areaDetailAjax(document.getElementsByName("area")[0].value.trim());
})();

// 초기화 바튼 클릭 시 검색 필터 초기화
document.getElementById("initialization").addEventListener("click", function () {
	  document.getElementsByName("category")[0].value = null;
	  document.getElementsByName("categoryValue")[0].innerText = "상태여부";

	  document.getElementsByName("area")[0].value = null;
	  document.getElementsByName("areaValue")[0].innerText = "지역선택";

	  document.getElementsByName("areaDetail")[0].value = null;
	  document.getElementsByName("areaDetailValue")[0].innerText = "상세 지역 선택";
	  document.getElementsByName("areaDetailValue")[0].style.display = "none";
	  
	  document.getElementsByName("animalType")[0].value = null;
	  document.getElementsByName("animalTypeValue")[0].innerText = "축종";

	  document.getElementsByName("animalDetail")[0].value = null;
	  document.getElementsByName("animalDetailValue")[0].innerText = "품종";
	  document.getElementsByName("animalDetailValue")[0].style.display = "none";

	  document.getElementsByName("boardPeriod")[0].value = null;
	  document.getElementsByName("boardPeriod2")[0].value = null;
   });

// 게시글 등록 버튼을 클릭했을 때
const registBtn = document.getElementsByClassName("addBoard")[0];
const registValue = document.getElementsByName("registValue")[0];
let message = null;
registBtn.addEventListener("click", function () {
	
	if(registValue.value==1){
		message = "로그인이 필요한 기능입니다. 로그인 페이지로 이동합니다.";
	}else if(registValue.value==2){
		message = "회원만 사용할 수 있는 기능입니다";
	}else{
		location.href="user/boardRegist"
	}

	if(registValue.value!=0){
		Swal.fire({
			title: message,
			width: 600,
			padding: '3em',
			color: 'black',
			confirmButtonColor: 'rgb(251, 131, 107)',
			confirmButtonText: '확인'
			}).then((result) => {
				if (result.isConfirmed && registValue.value==1) {
					location.href= contextPath+"/member/login";
				}
			 });
	}
});

// 무한 스크롤
// 무한 스크롤 설정
let options = {
    root: null,
    rootMargin: '10px',
    threshold: 0.5
  }

let i = 1;
const display = document.getElementsByClassName('row');
display[0].style.display = 'flex';
// IntersectionObserver 를 등록한다.
const io = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      // 관찰 대상이 viewport 안에 들어온 경우 image 로드
      if (entry.isIntersecting) {
        setTimeout(() => {
            display[i].style.display = 'flex';
            i++;
                if(i==display.length){
                    document.getElementsByClassName("spinner-area")[0].style.display = 'none';
                    document.getElementsByClassName("footer-area")[0].style.display = 'block';
                }
            observer.unobserve(entry.target);
          }, 1000);
      }
    })
  }, options)
  
  // 관찰할 대상을 선언하고, 해당 속성을 관찰시킨다.
  const row = document.querySelectorAll('.row');
  row.forEach((el) => {
    io.observe(el);
  })

// 카테고리 배경색 설정
const category = document.getElementsByClassName('category');

for (let i = 0; i < category.length; i++) {
  if(category[i].innerText.trim()=='실종'){
    category[i].style.backgroundColor = 'crimson';
  } else if(category[i].innerText.trim()=='보호'){
    category[i].style.backgroundColor = '#FB836B';
  } else if(category[i].innerText.trim()=='목격'){
    category[i].style.backgroundColor = 'coral';
  } else {
    category[i].style.backgroundColor = '#373737';
  }
}

// 버튼 값 변경
const selectMenu = document.getElementsByClassName("selectMenu");

for (let i = 0; i < selectMenu.length; i++) {
	selectMenu[i].addEventListener("click",function () {
		selectMenu[i].parentElement.previousElementSibling.innerText = selectMenu[i].innerText;

		document.getElementsByName("category")[0].value = document.getElementsByName("categoryValue")[0].innerText.trim();

		document.getElementsByName("area")[0].value = document.getElementsByName("areaValue")[0].innerText.trim();

		document.getElementsByName("animalType")[0].value = document.getElementsByName("animalTypeValue")[0].innerText.trim();

		// 지역선택, 축종 버튼에 값이 있을 시 상세 드롭다운 버튼 생성
		if(document.getElementsByName("areaValue")[0].innerText.trim()!="지역선택"){
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

	areaDetailAjax(area);
	
});
};

// 상세 지역 값 적용
function areaDetailFunc(){
	const Adetail = document.getElementsByClassName("areaDetail");
	for (let i = 0; i < Adetail.length; i++) {
			Adetail[i].addEventListener("click",function () {
			Adetail[i].parentElement.previousElementSibling.innerText = Adetail[i].innerText;
			document.getElementsByName("areaDetail")[0].value = document.getElementsByName("areaDetailValue")[0].innerText.trim();
		});
	}
};

// 축종이 바뀔 때마다 품종 값 초기화
const animalList = document.getElementsByClassName("animalList");

const ul2 = document.getElementsByName("animalDetailValue")[0].nextElementSibling;
	
	for (let i = 0; i < animalList.length; i++) {
		animalList[i].addEventListener("click",function () {
		document.getElementsByName("animalDetailValue")[0].innerText = "품종";
		const animalType = document.getElementsByName("animalType")[0].value;

		animalDetailAjax(animalType);
	
});
};

// 품종 값 적용
function animalDetailFunc(){
	const Adetail = document.getElementsByClassName("animalDetail");
	for (let i = 0; i < Adetail.length; i++) {
			Adetail[i].addEventListener("click",function () {
			Adetail[i].parentElement.previousElementSibling.innerText = Adetail[i].innerText;
			document.getElementsByName("animalDetail")[0].value = document.getElementsByName("animalDetailValue")[0].innerText.trim();
		});
	}
};

// 검색하기 버튼 클릭 시 해당 조건에 일치하는 게시글 리스트 검색
const searchST = document.getElementsByName('searchST')[0];
const searchBtn = document.getElementsByClassName('searchBtn')[0];

searchBtn.addEventListener("click", function () {
  searchST.value = 1;
})

// 검색 필터 창 열람
function searchDisplay() {
  const display = document.getElementById("search-area");
  const displayBtn = document.getElementById("searchBtn");
  const initialBtn= document.getElementById("initialization");

  if((display.style.display=="")||(display.style.display=="none")){
    display.style.display = 'block';
    displayBtn.style.display = 'block';
	initialBtn.style.display = 'block';
  }else{
    display.style.display = 'none';
    displayBtn.style.display = 'none';
	initialBtn.style.display = 'none';
  }
}

function animalDetailAjax(animalType) {
	// 축종 선택에 따른 품종 조회
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

			if((animal.innerText.trim()=="기타")||(animal.innerText.trim()=="축종")){
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
}

function areaDetailAjax(area) {
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
}