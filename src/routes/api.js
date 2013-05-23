var mongoose, x$, y$;
mongoose = require('mongoose');
x$ = mongoose;
x$.connect('mongodb://localhost/swordfish');
y$ = x$.connection;
y$.on('error', console.error.bind(console, 'connection error:'));
y$.once('open', function(it){
  return console.log("YAY!", it);
});
if (typeof window != 'undefined' && window !== null) {
  window.derp = mongoose.Schema({
    title: 'string',
    text: 'string'
  });
}
exports.name = function(req, res){
  return res.json({
    name: 'Bob'
  });
};