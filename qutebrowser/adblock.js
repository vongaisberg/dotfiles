try{
document.getElementsByClassName('ad-interrupting')[0].querySelector('video').currentTime = document.getElementsByClassName('ad-interrupting')[0].querySelector('video').duration;
}
catch{}
try {
document.getElementsByClassName('ytp-ad-overlay-slot')[0].style.display = 'none'}

catch{}

document.getElementsByClassName('ytp-ad-skip-button')[0].click()
