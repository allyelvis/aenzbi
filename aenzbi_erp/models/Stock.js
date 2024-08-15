const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const stockSchema = new Schema({
  product: { type: mongoose.Schema.Types.ObjectId, ref: 'Product', required: true },
  quantity: { type: Number, required: true },
  lastUpdated: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Stock', stockSchema);
