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
