require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');

// Routes
const productRoutes = require('./routes/products');
const orderRoutes = require('./routes/orders');
const saleRoutes = require('./routes/sales');
const invoiceRoutes = require('./routes/invoices');
const paymentRoutes = require('./routes/payments');
const stockRoutes = require('./routes/stocks');
const warehouseRoutes = require('./routes/warehouses');
const customerRoutes = require('./routes/customers');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(cors());

// MongoDB connection
mongoose.connect(process.env.DATABASE_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch((error) => console.log('Error connecting to MongoDB:', error));

// Routes
app.use('/products', productRoutes);
app.use('/orders', orderRoutes);
app.use('/sales', saleRoutes);
app.use('/invoices', invoiceRoutes);
app.use('/payments', paymentRoutes);
app.use('/stocks', stockRoutes);
app.use('/warehouses', warehouseRoutes);
app.use('/customers', customerRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
const logger = require('./utils/logger');

// Use logger in your application
logger.info('Server started on port 3000');
const logger = require('./utils/logger');

// Use logger in your application
logger.info('Server started on port 3000');
