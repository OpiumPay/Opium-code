// index.js
require("dotenv").config(); // Load environment variables from .env file
const express = require("express");
const app = express();

// Define routes
app.use("/razorpayx", require("./routes/razorpayx"));
app.use("/gnosis", require("./routes/gnosis"));
app.use("/worldcoin", require("./routes/worldcoin"));

// ...

// Use environment variables
const RAZORPAYX_API_KEY = process.env.RAZORPAYX_API_KEY;
const RAZORPAYX_API_SECRET = process.env.RAZORPAYX_API_SECRET;

// ...

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
