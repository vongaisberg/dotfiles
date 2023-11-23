// ==UserScript==
// @name         YouTube Adblock
// @version      1.0.0
// @description  Skip ads automatically
// @author 	     vongaisberg
// @match        *://*.youtube.com/*
// @exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==

function skip() {
  try {
    let vid = document
      .getElementsByClassName("ytp-ad-player-overlay")[0]
      .parentElement.parentElement.getElementsByClassName(
        "html5-video-container"
      )[0]
      .querySelector("video");
    vid.currentTime = vid.duration;
    document.getElementsByClassName("ytp-ad-skip-button-modern")[0].click();
  } catch {}
  try {
    document.getElementById("player-ads").remove();
  } catch {}
}

skip();

if (!window.skipAdsIntervalID) {
  window.skipAdsIntervalID = setInterval(skip, 100);
}
