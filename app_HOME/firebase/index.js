const functions = require('firebase-functions');
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());

app.get('/api/products', (req, res) => {
    res.json({ message: "List of products", products: [] });
});

exports.api = functions.https.onRequest(app);
