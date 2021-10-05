// ==UserScript==
// @name Remove white bottom from youtube player
// @namespace https://kloder.com
// @include https://*.youtube.*
// @version 1
// ==/UserScript==

document.querySelector('.ytp-gradient-bottom').style.backgroundImage = 'none';
document.querySelector('.ytp-gradient-top').style.backgroundImage = 'none';
