// routes/gnosis.js
const express = require("express");
const { SafeFactory, getSafeInfo } = require("@gnosis.pm/safe-core-sdk");
const router = express.Router();

router.post("/deploy-safe", async (req, res) => {
  try {
    const owners = [process.env.OWNER_ADDRESS_1, process.env.OWNER_ADDRESS_2];
    const threshold = 2;

    // Create a Gnosis Safe using the SafeFactory
    const safeFactory = await SafeFactory.create({ ethOptions: { gasPrice: "1000000000" } });
    const safe = await safeFactory.deploy({ owners, threshold });

    // Get Safe information
    const safeInfo = await getSafeInfo(safe.getAddress());

    res.json(safeInfo);
  } catch (error) {
    console.error("Error deploying Gnosis Safe:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
