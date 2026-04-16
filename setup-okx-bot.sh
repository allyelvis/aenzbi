#!/bin/bash

echo "🚀 Creating Aenzbi OKX Bot..."

PROJECT="aenzbi-okx-bot"

mkdir $PROJECT && cd $PROJECT

# init node project
npm init -y

# install dependencies
npm install ethers express dotenv cors body-parser

# create structure
mkdir -p config wallet bot/services bot/strategies api logs

# create env
cat <<EOT > .env
RPC_URL=https://rpc.sentio.xyz/your-key
PRIVATE_KEY=your_private_key_here
PORT=3000
MAX_TRADE=0.05
EOT

# index.js
cat <<EOT > index.js
require("dotenv").config();

const { sendTx } = require("./bot/tradingBot");
const { startWatcher } = require("./bot/watcher");
const startAPI = require("./api/server");

async function main() {
  console.log("🚀 Bot starting...");
  startWatcher();
  startAPI();
}

main();
EOT

# signer
cat <<EOT > wallet/signer.js
const { ethers } = require("ethers");

const provider = new ethers.JsonRpcProvider(process.env.RPC_URL);
const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

module.exports = { wallet, provider };
EOT

# trading bot
cat <<EOT > bot/tradingBot.js
const { wallet } = require("../wallet/signer");
const { checkRisk } = require("./services/risk");
const { ethers } = require("ethers");

async function sendTx(to, amount) {
  const tx = {
    to,
    value: ethers.parseEther(amount),
  };

  if (!checkRisk(tx)) {
    console.log("❌ Risk check failed");
    return;
  }

  const res = await wallet.sendTransaction(tx);
  console.log("📤 TX:", res.hash);

  await res.wait();
  console.log("✅ Confirmed");
}

module.exports = { sendTx };
EOT

# watcher
cat <<EOT > bot/watcher.js
const { provider } = require("../wallet/signer");

function startWatcher() {
  console.log("👀 Watching mempool...");

  provider.on("pending", async (txHash) => {
    try {
      const tx = await provider.getTransaction(txHash);
      if (!tx) return;

      if (tx.data && tx.data.includes("swap")) {
        console.log("🔄 Swap detected:", txHash);
      }
    } catch {}
  });
}

module.exports = { startWatcher };
EOT

# risk
cat <<EOT > bot/services/risk.js
function checkRisk(tx) {
  const max = parseFloat(process.env.MAX_TRADE);
  if (!tx.value) return false;

  const eth = Number(tx.value) / 1e18;
  if (eth > max) return false;

  return true;
}

module.exports = { checkRisk };
EOT

# swap
cat <<EOT > bot/services/swap.js
const { wallet } = require("../../wallet/signer");
const { ethers } = require("ethers");

async function swap(routerAddr, abi, path, amount) {
  const router = new ethers.Contract(routerAddr, abi, wallet);

  return router.swapExactETHForTokens(
    0,
    path,
    wallet.address,
    Math.floor(Date.now() / 1000) + 60,
    { value: ethers.parseEther(amount) }
  );
}

module.exports = { swap };
EOT

# API
cat <<EOT > api/server.js
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
EOT

# make zip
cd ..
zip -r $PROJECT.zip $PROJECT

echo "✅ Project created and zipped: $PROJECT.zip"
