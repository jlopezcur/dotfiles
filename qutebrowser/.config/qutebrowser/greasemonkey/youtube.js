// ==UserScript==
// @name Remove white bottom from youtube player
// @namespace https://kloder.com
// @include https://www.youtube.com/watch*
// @version 1
// ==/UserScript==

window.addEventListener('load', function () {
  document.querySelector('.ytp-gradient-bottom').style.backgroundImage = 'none';
  document.querySelector('.ytp-gradient-top').style.backgroundImage = 'none';
});
