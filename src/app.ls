
{each} = require \prelude-ls
require! express:  express
require! stylus:   stylus
require! nib:      nib

require! routes:   './server/routes/index'
require! api:      './server/routes/api'

require! mongoose: './config/mongoose'

app = module.exports = express!

app.configure ->
  app.set "views", __dirname + "/client/views"
  app.set "view engine", "jade"

  each (-> app.use it), []=
    * express.body-parser!
    * express.method-override!
    * express.static __dirname + "/public"

    * stylus.middleware {}=
        src:     __dirname
        compile: (str, path)->
          stylus str
            .set 'filename', path
            .set 'compress', true
            .use nib!

    * app.router

app.configure "development", ->
  app.use express.error-handler {}=
    dump-exceptions: true
    show-stack: true

app.configure "production", !->
  app.use express.error-handler!

# JSON API
app.get "/api/name", api.name

# ROUTES
app.get "/", routes.index
app.get "/partials/:name", routes.partials
app.get "*", routes.index


app.listen 3000, !->
  console.log "Express server listening on port %d in %s mode", @address().port, app.settings.env
