const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const { sendTx } = require("../bot/tradingBot");

function startAPI() {
  const app = express();
  app.use(cors());
  app.use(bodyParser.json());

  app.get("/", (req, res) => {
    res.send("Aenzbi Bot Running 🚀");
  });

  app.post("/send", async (req, res) => {
    const { to, amount } = req.body;

    try {
      await sendTx(to, amount);
      res.json({ status: "sent" });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  app.listen(process.env.PORT, () =>
    console.log("🌐 API running on " + process.env.PORT)
  );
}

module.exports = startAPI;
