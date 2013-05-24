
# Module dependencies.
require! express:  express
require! stylus:   stylus

require! routes:   './routes'
require! api:      './routes/api'

require! mongoose: './config/mongoose'

offer = require './public/js/offer/OfferModel.js'

app = module.exports = express!

# App Configuration
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.body-parser!
  app.use express.method-override!
  app.use express.static __dirname + "/public"
  app.use app.router

app.configure "development", ->
  app.use express.error-handler {}=
    dump-exceptions: true
    show-stack: true

app.configure "production", !->
  app.use express.error-handler!


# Routes
app.get "/", routes.index
app.get "/partials/:name", routes.partials

# JSON API
app.get "/api/name", api.name

# redirect all others to the index (HTML5 history)
app.get "*", routes.index

# Start server
app.listen 3000, !->
  console.log "Express server listening on port %d in %s mode", @address().port, app.settings.env
