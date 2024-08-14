let link = document.getElementsByClassName("link");
let currentValue = 1;

function activeLink(event){
    for(let l of link){
        l.classList.remove("active");
    }
    event.target.classList.add("active");
    currentValue = parseInt(event.target.getAttribute("data-value"));
}

function backBtn(){
    if(currentValue > 1){
        currentValue--;
        for(let l of link){
            l.classList.remove("active");
        }
        link[currentValue - 1].classList.add("active");
    }
}

function nextBtn(){
    if(currentValue < link.length){
        currentValue++;
        for(let l of link){
            l.classList.remove("active");
        }
        link[currentValue - 1].classList.add("active");
    }
}
