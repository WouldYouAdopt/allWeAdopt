const fundingInfoS = document.getElementsByClassName("fundingInfoS");

for(var i=0; i<fundingInfoS.length; i++){

	fundingInfoS[i].addEventListener("mouseover",function(){
		this.firstElementChild.firstElementChild.nextElementSibling.classList.add('visable');
	})
	
	fundingInfoS[i].addEventListener("mouseout",function(){
		this.firstElementChild.firstElementChild.nextElementSibling.classList.remove('visable');
	})
	

}