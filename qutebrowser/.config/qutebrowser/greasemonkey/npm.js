// ==UserScript==
// @name NPM registry dark mode
// @description Adds the dark mode to npm registry
// @include https://www.npmjs.com/*
// @copyright Javier López Úbeda
// @version 1.0.0
// ==/UserScript==

var style = document.createElement('style');
style.innerHTML = `
/* ************************************************************************** */
/* general                                                                    */
/* ************************************************************************** */

pre, code {
  background-color: #222 !important;
  border: 1px solid #999 !important;
  border-radius: 5px !important;
}
html, body, .bg-white, .b--black-10, .flex-column, .flex, main, .ph2 {
  background-color: #222 !important;
  color: #999 !important;
}
span, label, p, h1, h2, h3, h4, div, .black-50, .black-80 {
  color: #999 !important;
}
a, a:hover {
  color: #B55 !important;
}

/* ************************************************************************** */
/* form                                                                        */
/* ************************************************************************** */

.ph2.pv1, form[id="search"] > div {
  border: 1px solid #999 !important;
}
nav > div > a, button, .button {
  background-color: #222 !important;
  background-image: none;
  border: 1px solid #999 !important;
  color: #B55 !important;
}
input {
  color: #999 !important;
}

/* ************************************************************************** */
/* svg                                                                        */
/* ************************************************************************** */

g {
  fill: #999 !important;
}
`;
document.head.appendChild(style);
