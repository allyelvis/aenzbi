const axios = require('axios');

const POS_API_URL = "https://your-pos-api.com/v1/charge";
const API_KEY = "your_pos_api_key";

const makeCharge = async (amount, customer) => {
  try {
    const response = await axios.post(
      POS_API_URL,
      {
        amount: amount,
        customer: customer
      },
      {
        headers: {
          "Authorization": `Bearer ${API_KEY}`,
          "Content-Type": "application/json"
        }
      }
    );
    console.log("POS charge successful:", response.data);
  } catch (error) {
    console.error("Error making POS charge:", error);
  }
};

makeCharge(100, "guest123");
