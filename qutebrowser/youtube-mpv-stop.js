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
try{
httpGetAsync('https://stop.mpv/')
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
