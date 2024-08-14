const images = [
    '${pageContext.request.contextPath}/assets/static images/background.jpg',
    '${pageContext.request.contextPath}/assets/static images/background1.jpg',
    '${pageContext.request.contextPath}/assets/static images/background2.jpg'
];

let currentImageIndex = 0;

function changeBackgroundImage() {
    const sliderContent = document.querySelector('.slider-content');
    sliderContent.style.backgroundImage = `url(${images[currentImageIndex]})`;
    currentImageIndex = (currentImageIndex + 1) % images.length;
}

setInterval(changeBackgroundImage, 3000);

window.onload = changeBackgroundImage;