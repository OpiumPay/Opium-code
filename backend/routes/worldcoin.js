// routes/worldcoin.js
const express = require("express");
const axios = require("axios");
const router = express.Router();

// Worldcoin API base URL and API key
const WORLD_COIN_API_BASE_URL = "https://api.worldcoin.global";
const WORLD_COIN_API_KEY = process.env.WORLD_COIN_API_KEY;

// Endpoint to perform identity verification
router.post("/verify-identity", async (req, res) => {
  try {
    const { firstName, lastName, email, idDocument, selfie } = req.body;

    // Make a request to Worldcoin's identity verification API
    const response = await axios.post(
      `${WORLD_COIN_API_BASE_URL}/verify-identity`,
      {
        firstName,
        lastName,
        email,
        idDocument,
        selfie,
      },
      {
        headers: {
          "Authorization": `Bearer ${WORLD_COIN_API_KEY}`,
          "Content-Type": "application/json",
        },
      }
    );

    // Process the verification response from Worldcoin
    const verificationResult = response.data;

    if (verificationResult.passed) {
      // Identity verification successful
      res.json({ success: true, message: "Identity verified successfully" });
    } else {
      // Identity verification failed
      res.status(400).json({ success: false, message: "Identity verification failed" });
    }
  } catch (error) {
    console.error("Error verifying identity:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
