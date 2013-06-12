

exports.index = (req, res)->
  res.render 'index'
  # res.render 'index.html'

exports.partials = (req, res)->
  name = req.params.name
  res.render 'partials/' + name
  # res.render 'partials/' + name + '.html'
