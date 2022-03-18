// ==UserScript==
// @name Udemy customization
// @description Adds some customizations to udemy
// @include https://www.udemy.com/*
// @copyright Javier López Úbeda
// @version 1.0.0
// ==/UserScript==

var style = document.createElement('style');
style.innerHTML = `
/* ************************************************************************** */
/* banner                                                                     */
/* ************************************************************************** */

[class*="billboard-banner--image"] {
  display: none !important;
}
`;
document.head.appendChild(style);
