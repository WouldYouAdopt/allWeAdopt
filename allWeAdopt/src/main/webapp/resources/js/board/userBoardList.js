console.log("js출력");

// window.addEventListener('scroll',function(){
//     console.log(window.scrollY);

//     if(this.window.scrollY>=68){
//         document.getElementsByClassName("filter-area")[0].classList.add("fixed");
//     }else{
//         document.getElementsByClassName("filter-area")[0].classList.remove("fixed");
//     }
// });

// 무한 스크롤
let options = {
    root: null,
    rootMargin: '10px',
    threshold: 0.5
  }

console.log(document.getElementsByClassName('mt-auto')[0].innerText);

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