function checkRisk(tx) {
  const max = parseFloat(process.env.MAX_TRADE);
  if (!tx.value) return false;

  const eth = Number(tx.value) / 1e18;
  if (eth > max) return false;

  return true;
}

module.exports = { checkRisk };
