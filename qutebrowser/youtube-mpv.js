try{
document.getElementsByClassName('ad-interrupting')[0].querySelector('video').currentTime = document.getElementsByClassName('ad-interrupting')[0].querySelector('video').duration;
}
catch{}
try {
document.getElementsByClassName('ytp-ad-overlay-slot')[0].style.display = 'none'}

catch{}
try{
document.getElementsByClassName('ytp-ad-skip-button')[0].click()
} catch {}
function getOffset(el) {
  const rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.scrollX,
    top: rect.top + window.scrollY,
    right: rect.right + window.scrollX,
    bottom: rect.bottom + window.scrollY
  };
}
var elem = document.getElementsByClassName('html5-video-container')[0]
var rect = getOffset(elem)
return(rect.left +" "+rect.top+" "+rect.right+" "+rect.bottom);

