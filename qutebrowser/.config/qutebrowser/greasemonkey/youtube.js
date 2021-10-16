// ==UserScript==
// @name Remove white bottom from youtube player
// @namespace https://kloder.com
// @include https://www.youtube.com/watch*
// @version 1
// ==/UserScript==

window.addEventListener('load', function () {
  document.querySelector('.ytp-gradient-bottom').remove();
  document.querySelector('.ytp-gradient-top').remove();
});
