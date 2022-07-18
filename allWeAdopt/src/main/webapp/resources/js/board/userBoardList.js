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





//   let i = 1;
// const display = document.getElementsByClassName('row');
// display[0].style.display = 'flex';
// // IntersectionObserver 를 등록한다.
// const io = new IntersectionObserver((entries, observer) => {
//     entries.forEach(entry => {
//       // 관찰 대상이 viewport 안에 들어온 경우 image 로드
//       if (entry.isIntersecting) {
//         display[i].style.display = 'flex';
//         i++;
//         console.log('무한');
//         observer.unobserve(entry.target);
//       }
//     })
//   }, options)
  
//   // 관찰할 대상을 선언하고, 해당 속성을 관찰시킨다.
//   const row = document.querySelectorAll('.row');
//   row.forEach((el) => {
//     io.observe(el);
//   })

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

// 검색 필터 설정
const filter = document.getElementsByClassName('filter-menu');
const selectArea = document.getElementsByClassName('select');

for (let i = 0; i < filter.length; i++) {
  selectArea[i].style.display = 'none';
  filter[i].addEventListener("click", function () {
    

     if (selectArea[i].style.display == 'block') {
       selectArea[i].style.display = 'none';
     } else{
      selectArea[i].style.display = 'block';
     }
  });
}

// // 사용자 게시판 등록 시간 출력 함수
// function calcul(diffTime[i].innerText) {
//   const msg = null;
//   if (diffTime[i].innerText < 60) {
//     msg=("방금 전");
//   } else if ((diffTime[i].innerText / 60) < 60) {
//     diffTime[i].innerText = diffTime[i].innerText/60;
//     msg=(diffTime[i].innerText + "분 전");
//   } else if ((diffTime[i].innerText / 3600) < 24) {
//     diffTime[i].innerText = diffTime[i].innerText/3600;
//     msg=((diffTime[i].innerText) + "시간 전");
//   } else if ((diffTime[i].innerText / (3600*24)) < 30) {
//     diffTime[i].innerText = diffTime[i].innerText/(3600*24);
//     msg=((diffTime[i].innerText) + "일 전");
//   } else if ((diffTime[i].innerText / (3600*24*30)) < 12) {
//     diffTime[i].innerText = diffTime[i].innerText/(3600*24*30);
//     msg=((diffTime[i].innerText) + "달 전");
//   } else {
//     diffTime[i].innerText = diffTime[i].innerText/(3600*24*30*12);
//     msg=((diffTime[i].innerText) + "년 전");
//   }
//   console.log(msg);
//   return msg;
// }