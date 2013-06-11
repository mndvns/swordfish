exports.name = function(req, res){
  return res.json({
    name: 'Bob'
  });
};
exports.index = function(req, res){
  return res.render('index');
};
exports.partials = function(req, res){
  var name;
  name = req.params.name;
  return res.render('partials/' + name);
};