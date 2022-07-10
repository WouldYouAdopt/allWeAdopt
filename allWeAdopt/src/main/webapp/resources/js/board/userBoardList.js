console.log("js출력");

window.addEventListener('scroll',function(){
    console.log(window.scrollY);

    if(this.window.scrollY>=68){
        document.getElementsByClassName("filter-area")[0].classList.add("fixed");
    }else{
        document.getElementsByClassName("filter-area")[0].classList.remove("fixed");
    }
});