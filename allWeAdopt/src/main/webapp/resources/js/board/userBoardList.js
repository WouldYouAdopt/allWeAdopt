console.log("js출력");

(function (){ 
  const diffTime = document.getElementsByClassName('diffTime');

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
})();

// window.addEventListener('scroll',function(){
//     console.log(window.scrollY);

//     if(this.window.scrollY>=68){
//         document.getElementsByClassName("filter-area")[0].classList.add("fixed");
//     }else{
//         document.getElementsByClassName("filter-area")[0].classList.remove("fixed");
//     }
// });

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

		document.getElementsByName("category")[0].value = document.getElementsByName("categoryValue")[0].innerText;

		document.getElementsByName("area")[0].value = document.getElementsByName("areaValue")[0].innerText;

		document.getElementsByName("animalType")[0].value = document.getElementsByName("animalTypeValue")[0].innerText;
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