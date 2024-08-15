const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const invoiceSchema = new Schema({
  sale: { type: mongoose.Schema.Types.ObjectId, ref: 'Sale', required: true },
  invoiceNumber: { type: String, required: true },
  totalAmount: { type: Number, required: true },
  invoiceDate: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Invoice', invoiceSchema);
