// ==UserScript==
// @name Amazon dark mode
// @description Adds the dark mode to amazon
// @include https://www.amazon.es/*
// @copyright Javier López Úbeda
// @version 1.0.0
// ==/UserScript==

var style = document.createElement('style');
style.innerHTML = `
/* ************************************************************************** */
/* general                                                                    */
/* ************************************************************************** */

body, #dp {
  background-color: #222 !important;
  color: #999 !important;
}

.s-desktop-content {
  background-color: #222 !important;
  color: #999 !important;
}

.a-color-base {
  color: #999 !important;
}

/* ************************************************************************** */
/* search                                                                    */
/* ************************************************************************** */

.nav-search-field {
  background-color: #222 !important;
  color: #999 !important;
}

.nav-input {
  color: #999 !important;
}

/* ************************************************************************** */
/* subnav                                                                    */
/* ************************************************************************** */

#nav-subnav {
  background-color: #222 !important;
}

.s-desktop-toolbar {
  background-color: #222 !important;
}

.nav-a, .nav-b {
  color: #999 !important;
}

/* ************************************************************************** */
/* cart                                                                    */
/* ************************************************************************** */

#ewc-active-cart {
  background-color: #222 !important;
}

/* ************************************************************************** */
/* cards                                                                    */
/* ************************************************************************** */

.s-card-border {
  border: 1px soild #999 !important;
}

.a-price {
  color: #999 !important;
}

`;
document.head.appendChild(style);
