// 몇 분전, 몇 일전 표시
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