### dependencies

{map, each, obj-to-pairs, first} = require 'prelude-ls'

require! express:    express
require! stylus:     stylus
require! nib:        nib
require! routes:   './server/routes/index'
require! api:      './server/routes/api'
require! mongoose: './server/vendors/mongoose'

app = module.exports = express!

### config

app.configure ->
  app.set "views", __dirname + "/client/views"
  app.set "view engine", "jade"

  app.use express.body-parser!
  app.use express.method-override!
  app.use express.static __dirname + "/public"

  app.use stylus.middleware {}=
    src:     __dirname
    compile: (str, path)->
      stylus(str)
        .set 'filename', path
        .set 'compress', true
        .use nib!

  app.use app.router

app.configure \development ,  ->
  app.use express.error-handler {}=
    dump-exceptions: true
    show-stack: true

app.configure "production", ->
  app.use express.error-handler!


### json api

app.get "/api/name", api.name
app.get "/", routes.index
app.get "/partials/:name", routes.partials
app.get "*", routes.index

### routes

app.listen 3000, ->
  console.log "Express server listening on port %d in %s mode", @address().port, app.settings.env
