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
try{
var elem = document.getElementsByClassName('html5-main-video')[0]
var rect = getOffset(elem)
alert(rect.top+" "+rect.bottom)
httpGetAsync('https://start.mpv/start?url='+window.location.href+'&left='+rect.left+'&top='+rect.top+'&right='+rect.right+'&bottom='+rect.bottom, alert)

new ResizeObserver(updatesize).observe(elem)
} catch{}
function httpGetAsync(theUrl, callback)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous
    xmlHttp.send(null);
}
function updatesize() {
 rect = getOffset(elem)
httpGetAsync('https://move.mpv/start?url='+window.location.href+'&left='+rect.left+'&top='+rect.top+'&right='+rect.right+'&bottom='+rect.bottom, alert)
}
