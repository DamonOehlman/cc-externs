var events = new EventEmitter();
events.emit('test', 1);
events.emit('test', 1, 2);
events.emit('test', 1, 2, 3);
events.emit('test', 1, 2, 3, 4);