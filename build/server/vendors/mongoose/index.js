var mongoose, x$, db;
mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/swordfish');
x$ = db = mongoose.connection;
x$.on('error', console.error.bind(console, 'connection error:'));
x$.once('open', function(it){
  return console.log("YAY!", it);
});