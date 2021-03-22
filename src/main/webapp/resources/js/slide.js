/**
 * 
 */

var btnPrev = document.querySelector('.slick-prev');
var btnNext = document.querySelector('.slick-next');
var slideList = document.querySelector('.slick-track');
var slideIndex = 1;
slideList.style.transform = "translate3d(-" + 1030 * (slideIndex) + "px, 0px, 0px)";

btnPrev.addEventListener('click', function() {
	slideIndex -= 1;
	if (slideIndex == 0) {
		slideIndex = 11;
	}
	slideList.style.transform = "translate3d(-" + 1030 * (slideIndex) + "px, 0px, 0px)";
});

btnNext.addEventListener('click', function() {
	slideIndex += 1;
	if (slideIndex == 12) {
		slideIndex = 1;
	}
	slideList.style.transform = "translate3d(-" + 1030 * (slideIndex) + "px, 0px, 0px)";
});

setInterval(function() {
	slideList.style.transform = "translate3d(-" + 1030 * (slideIndex) + "px, 0px, 0px)";

	slideIndex++;

	if (slideIndex == 12) {
		slideIndex = 1;
	}
}, 5000);





