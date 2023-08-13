# Gnosis Aave Interactor Contract

This contract is designed to interact with the Gnosis Safe and Aave lending protocol on the Goerli testnet. It provides functions for liquidation, lending, and borrowing using a Gnosis Safe contract and the Aave lending pool.

## Contract Addresses

- Gnosis Aave Interactor Contract: [0x0e239243e8b59e99f98bcbb9d9792ee179c54a7e](https://goerli.basescan.org/address/0x0e239243e8b59e99f98bcbb9d9792ee179c54a7e)
- Gnosis Safe Contract (Optimism): [0x0e239243e8b59e99f98bcbb9d9792ee179c54a7e](https://goerli-optimism.etherscan.io/address/0x0e239243e8b59e99f98bcbb9d9792ee179c54a7e)
- Aave Lending Pool Contract: [Contract Address Here](https://link-to-contract)

## Usage

1. Deploy the Gnosis Aave Interactor Contract to the Goerli testnet.
2. Add users and their associated Gnosis Safe addresses using the `addUser` function, which can only be called by the contract owner.
3. Users can call the `lend` function to deposit USDC into the Aave lending pool.
4. Users can call the `borrow` function to borrow USDC from the Aave lending pool using their Gnosis Safe and execute a Gnosis Safe transaction to transfer the borrowed funds to their address.
5. The contract owner can call the `liquidate` function to transfer all USDC from the contract to their address using a Gnosis Safe transaction.

## Prerequisites

- Make sure you have access to the Goerli testnet.
- You will need the addresses of the Gnosis Safe contract and the Aave Lending Pool contract on Goerli.

## Deployment

1. Modify the deployment script (`scripts/deploy.js`) with the correct contract addresses and network settings.
2. Run the deployment script using the following command:

   ```bash
   npx hardhat run scripts/deploy.js --network goerli
```

Development

To contribute or make modifications to the contract, follow these steps:

Clone the repository.
Install dependencies: npm install
Make your changes to the contract.
Run tests: npx hardhat test
Disclaimer

This contract is provided for educational and informational purposes only. Use it at your own risk. Be cautious when interacting with smart contracts, especially when dealing with financial transactions.

   ```bash
Please make sure to replace placeholders such as `[Contract Address Here]` with the actual contract addresses and provide more detailed instructions if needed. Additionally, update the "Deployment" section to reflect any specific steps or parameters required for deployment.
```




