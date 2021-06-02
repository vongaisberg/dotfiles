function skip() {
  try {
    let vid = document
      .getElementsByClassName("ytp-ad-player-overlay")[0]
      .parentElement.parentElement.getElementsByClassName(
        "html5-video-container"
      )[0]
      .querySelector("video");
    vid.currentTime = vid.duration;
    document.getElementsByClassName("ytp-ad-skip-button")[0].click();
  } catch {}
  try {
    document.getElementById("player-ads").remove();
  } catch {}
}

skip();
setInterval(function () {
  skip();
}, 250);
