const express = require('express');
const router = express.Router();

router.get('/products', (req, res) => {
    res.json({ message: "List of products", products: [] });
});

router.post('/order', (req, res) => {
    const order = req.body;
    res.json({ message: "Order received", order });
});

module.exports = router;
