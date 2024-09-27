const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const bodyParser = require('body-parser');

// Load environment variables
dotenv.config();

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.get('/api/products', (req, res) => {
    res.json({ message: "List of products", products: [] });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
