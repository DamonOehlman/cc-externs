/* Mousetrap Constructor and Instance Methods */

/**
  @constructor
  @param {!Element} targetElement
*/
function Mousetrap(targetElement) {}

/**
  @param {!MousetrapKeySpec} keys
  @param {!MousetrapKeyHandler} callback
  @param {string=} action
*/
Mousetrap.prototype.bind = function(keys, callback, action) {};

/* Mousetrap Static Functions */

/**
  @param {!MousetrapKeySpec} keys
  @param {!MousetrapKeyHandler} callback
  @param {string=} action
*/
Mousetrap.bind = function(keys, callback, action) {};

/**
  @param {!MousetrapKeySpec} keys
**/
Mousetrap.unbind = function(keys) {};

/* TYPEDEFS */

/** @typedef (string|!Array.<string>) */
var MousetrapKeySpec;

/** @typedef function(!Object) */
var MousetrapKeyHandler;