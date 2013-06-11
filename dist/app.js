var express, stylus, routes, api, mongoose, app;
express = require('express');
stylus = require('stylus');
routes = require('./routes');
api = require('./routes/api');
mongoose = require('./config/mongoose');
app = module.exports = express();
app.configure(function(){
  app.set("views", __dirname + "/client/views");
  app.set("view engine", "jade");
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express['static'](__dirname + "/public"));
  return app.use(app.router);
});
app.configure("development", function(){
  return app.use(express.errorHandler({
    dumpExceptions: true,
    showStack: true
  }));
});
app.configure("production", function(){
  app.use(express.errorHandler());
});
app.get("/", routes.index);
app.get("/partials/:name", routes.partials);
app.get("/api/name", api.name);
app.get("*", routes.index);
app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});