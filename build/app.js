var ref$, map, each, objToPairs, first, express, stylus, nib, routes, api, mongoose, app;
ref$ = require('prelude-ls'), map = ref$.map, each = ref$.each, objToPairs = ref$.objToPairs, first = ref$.first;
express = require('express');
stylus = require('stylus');
nib = require('nib');
routes = require('./server/routes/index');
api = require('./server/routes/api');
mongoose = require('./server/vendors/mongoose');
app = module.exports = express();
app.configure(function(){
  app.set("views", __dirname + "/client/views");
  app.set("view engine", "jade");
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express['static'](__dirname + "/public"));
  app.use(stylus.middleware({
    src: __dirname,
    compile: function(str, path){
      return stylus(str).set('filename', path).set('compress', true).use(nib());
    }
  }));
  return app.use(app.router);
});
app.configure('development', function(){
  return app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
});
app.configure("production", function(){
  return app.use(express.errorHandler());
});
app.get("/api/name", api.name);
app.get("/", routes.index);
app.get("/partials/:name", routes.partials);
app.get("*", routes.index);
app.listen(3000, function(){
  return console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});