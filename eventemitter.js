/**
 * @constructor
 */
function EventEmitter() {}

/**
 * @param  {string} name
 * @param  {function(...):?} handler
 * @return {!EventEmitter}
 */
EventEmitter.prototype.on =
EventEmitter.prototype.addListener = function (name, handler) {};

/**
 * @param  {string} name
 * @param  {function(...):?} handler
 * @return {!EventEmitter}
 */
EventEmitter.prototype.once = function (name, handler) {};

/**
 * @param  {string} name
 * @param  {function(...):?} handler
 * @return {!EventEmitter}
 */
EventEmitter.prototype.removeListener = function (name, handler) {};

/**
 * @param  {string} name
 * @return {!EventEmitter}
 */
EventEmitter.prototype.removeAllListeners = function (name) {};

/**
 * @param  {string} name
 * @param  {...} args
 * @return {!EventEmitter}
 */
EventEmitter.prototype.emit = function (name, args) {};
