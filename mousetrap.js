/* Mousetrap Constructor and Instance Methods */

/**
  @constructor
  @param {!HtmlElement} targetElement
*/
function Mousetrap(targetElement) {}

/**
  @param {!MousetrapKeys} keys
  @param {!MousetrapKeyHandler} callback
  @param {string=} action
*/
Mousetrap.prototype.bind = function(keys, callback, action) {};

/* Mousetrap Static Functions */

/**
  @param {!MousetrapKeys} keys
  @param {!MousetrapKeyHandler} callback
  @param {string=} action
*/
Mousetrap.bind = function(keys, callback, action) {};

/**
  @param {!MousetrapKeys} keys
**/
Mousetrap.unbind = function(keys) {};

/* TYPEDEFS */

/** @typedef (string|!Array.<string>) */
var MousetrapKeys;

/** @typedef function(!Object) */
var MousetrapKeyHandler;