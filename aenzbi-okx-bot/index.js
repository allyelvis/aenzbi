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
