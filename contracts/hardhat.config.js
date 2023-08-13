require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    goerli: {
      url: process.env.GOERLI_URL || "",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    baseGoerli: {
      url: process.env.BASE_GOERLI_URL || "",
      gasPrice: 1000000000, // Set a higher gas price here
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
    opGoerli: {
      url: process.env.OP_GOERLI_URL || "",
      gasPrice: 10000000000, // Set a higher gas price here
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: {
     "base-goerli": "PLACEHOLDER_STRING",
     "opGoerli": process.env.ETHERSCAN_API_KEY || "",
     "optimisticGoerli": process.env.ETHERSCAN_API_KEY || ""

    },
    customChains: [
      {
        network: "base-goerli",
        chainId: 84531,
        urls: {
         apiURL: "https://api-goerli.basescan.org/api",
         browserURL: "https://goerli.basescan.org"
        }
      }
    ]
  },
};
