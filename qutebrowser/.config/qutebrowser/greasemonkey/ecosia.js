// ==UserScript==
// @name Ecosia dark mode
// @description Adds the dark mode to ecosia
// @namespace https://kloder.com
// @copyright Javier López Úbeda
// @version 1.0.0
// ==/UserScript==

var style = document.createElement('style');
style.innerHTML = `
/* ************************************************************************** */
/* general                                                                    */
/* ************************************************************************** */

body {
  background-color: #222 !important;
}
.layout {
  background-color: #222 !important;
}
a.link--color-result {
  color: #999 !important;
}
a.link--color-result:visited {
  color: #999 !important;
}
a.result__source {
  color: #0F0 !important;
}
.web-result__description {
  color: #999 !important;
}
.deep-links__description {
  color: #999 !important;
}
.videos-snippet__source {
  color: #0F0 !important;
}
.filter__button, .input__element {
  background-color: #222 !important;
  color: #999 !important;
}

/* ************************************************************************** */
/* header                                                                     */
/* ************************************************************************** */

.main-header {
  background-color: #222 !important;
}
.main-header__content {
  border-bottom: 0 !important;
  background-color: #222 !important;
}

/* ************************************************************************** */
/* search                                                                     */
/* ************************************************************************** */

.search-form {
  background-color: #222 !important;
  border: 1px solid #999 !important;
}
.search-form__input {
  background-color: #222 !important;
  color: #999 !important;
}

/* ************************************************************************** */
/* pills & chips                                                              */
/* ************************************************************************** */

.pill, .chip {
  border-color: #999 !important;
  background-color: #222 !important;
}
.personal-counter__text, .chip__text, .chip__text > mark {
  color: #999 !important;
}
.main-nav__button {
  border-color: #999 !important;
  background-color: #222 !important;
  color: #999 !important;
}
.query-expansions__control--next {
  background: linear-gradient(90deg, hsla(0,0%,100%,0), rgba(22,22,22,.8) 42%,#222 74%) !important;
  color: #999 !important;
}
.query-expansions__control--previous {
  background: linear-gradient(270deg, hsla(0,0%,100%,0), rgba(22,22,22,.8) 42%, #222 74%) !important;
  color: #999 !important;
}

/* ************************************************************************** */
/* menu                                                                       */
/* ************************************************************************** */

.dropdown {
  border: 1px solid #999 !important;
  background-color: #222 !important;
  color: #999 !important;
}
.main-nav-menu__group {
  border-bottom: 1px solid #999 !important;
}
.list-item:hover {
  color: #eee !important;
  background-color: #444 !important;
}

/* ************************************************************************** */
/* card                                                                       */
/* ************************************************************************** */

.card {
  box-shadow: 0 0 2px 0 #999,0 1px 3px 0 #999 !important;
}
.entity-titles__title {
  color: #999 !important;
}
.entity__description {
  color: #999 !important;
}
.snippet-card__title {
  color: #999 !important;
}

/* ************************************************************************** */
/* footer                                                                     */
/* ************************************************************************** */

.main-footer, .layout-footer {
  background-color: #222 !important;
}

/* ************************************************************************** */
/* remove install button since in qutebrowser it can't be installed           */
/* ************************************************************************** */

.main-header__install-cta {
  display: none !important;
}

/* ************************************************************************** */
/* banner                                                                     */
/* ************************************************************************** */

.banner {
  background-color: #222 !important;
  color: #999 !important;
}
.extension-section {
  background-color: #222 !important;
}
`;
document.head.appendChild(style);
