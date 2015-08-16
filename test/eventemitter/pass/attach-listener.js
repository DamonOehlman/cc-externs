var emitter = new EventEmitter();

emitter.on('test', function(a) {});
emitter.on('test', function(a) { return true });
emitter.on('test', function(a) { return {} });
emitter.on('test', function(a) { return [] });

emitter.on('test', function(a, b) {});
emitter.on('test', function(a, b) { return true });