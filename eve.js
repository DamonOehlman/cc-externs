/**
 @param {string} name
 @param {Object?} scope
 @param {...*} args
*/
function eve(name, scope, args) {}

/**
 @param {string} name
 @param {!EveHandler} handler
**/
eve.on = function(name, handler) {};

/* typedefs */

/** @typedef {function(...?):?} */
var EveHandler;