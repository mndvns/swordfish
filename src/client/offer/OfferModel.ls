
require! mongoose

offer-schema = mongoose.Schema {}=
  title:
    type: 'string'
  description:
    type: 'string'
  price:
    type: 'number'

Offer = mongoose.model "Offer", offer-schema

offer = module.exports = new Offer {}=
  title: "Some offer"
  description: "This is a description"
  price: 20

offer.save!

# console.log Offer.find({})
# console.log \QWE, Offer.find-one {}
# console.log \HERE, offer.title
# console.log "HERE", derp
