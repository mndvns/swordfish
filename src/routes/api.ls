
require! mongoose

mongoose
  ..connect 'mongodb://localhost/swordfish'
  ..connection
    ..on 'error', console.error.bind console, 'connection error:'
    ..once 'open', ->
      console.log "YAY!", it

window?.derp = mongoose.Schema {}=
  title: 'string'
  text: 'string'


exports.name = (req, res)->
  res.json name: 'Bob'
