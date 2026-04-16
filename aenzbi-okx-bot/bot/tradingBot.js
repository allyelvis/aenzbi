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
