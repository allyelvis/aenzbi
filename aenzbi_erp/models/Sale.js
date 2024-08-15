const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const saleSchema = new Schema({
  order: { type: mongoose.Schema.Types.ObjectId, ref: 'Order', required: true },
  totalAmount: { type: Number, required: true },
  saleDate: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Sale', saleSchema);
