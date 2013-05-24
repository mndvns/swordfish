var mongoose, offerSchema, Offer, offer;
mongoose = require('mongoose');
offerSchema = mongoose.Schema({
  title: {
    type: 'string'
  },
  description: {
    type: 'string'
  },
  price: {
    type: 'number'
  }
});
Offer = mongoose.model("Offer", offerSchema);
offer = module.exports = new Offer({
  title: "Some offer",
  description: "This is a description",
  price: 20
});
offer.save();