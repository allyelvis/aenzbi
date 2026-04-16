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
