
require! mongoose

mongoose.connect 'mongodb://localhost/swordfish'
db = mongoose.connection
  ..on 'error', console.error.bind console, 'connection error:'
  ..once 'open', ->
    console.log "YAY!", it


