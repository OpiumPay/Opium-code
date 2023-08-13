# Opium Pay - UPI credit line for your crypto

## Overview

This project aims to revolutionize crypto finance by integrating UPI credit lines with the Gnosis Safe platform. Users can leverage their crypto assets as collateral to secure a credit line. This credit line can be accessed through the Gnosis Safe multisig, offering a secure and user-friendly interface. It enables instant fund access without liquidating assets, providing financial flexibility while maintaining control. The integration seamlessly blends traditional and crypto finance, allowing users to manage and utilize their funds efficiently. Through this innovation, the project empowers users to bridge the gap between their digital and financial worlds, paving the way for a new era of accessible and flexible crypto-backed lending.

### What other projects were used?:

To facilitate payments, the project harnesses RazorPayX, streamlining the UPI transactional aspect of the system.
Metamask SDK, a well-established tool for wallet integration, and Chainlink Price Feeds to retrieve INR/USD rates, and BASE and Optimism chains for Gnosis Multisig deployments.

### User Interface:

The user-facing side of the project is materialized through an iOS app built with SwiftUI. This choice of framework ensures a modern, intuitive, and responsive user experience, aligned with the standards of the iOS platform.

### Smart Contracts and Asset Management:

Underlying the project are Gnosis contracts, deployed both on the Base and Optimism chains. It also used Chainlink Price Feeds for INR/USD rates. These contracts are pivotal in enabling non-custodial asset management, ensuring that users maintain control over their crypto holdings throughout the lending process.

### Technical Backbone:

The project's backend infrastructure is constructed using NodeJS, a programming language known for its performance, security, and reliability.

In this project, integration of RazorPayX, Metamask SDK, SwiftUI, Gnosis Safe, Chainlink Price Feed contracts creates a cohesive and dynamic ecosystem. The integration of these elements forms the backbone of a revolutionary approach to crypto-backed lending, fostering financial flexibility while maintaining user control.

## Project Structure

```
|-- Opium/
| |-- [iOS app code and resources]
|
|-- contracts/
| |-- [Solidity smart contract files]
|
|-- backend/
| |-- [Node.js server code and configurations]
|
|-- README.md
```

## Getting Started

To get started with the Opium Protocol iOS App, follow these steps:

1. **Clone the Repository:** Begin by cloning this repository to your local machine.

2. **iOS App Setup:** Navigate to the `iOS SwiftUI App` folder and follow the instructions in the app's README to set up and run the iOS app on your device or simulator.

3. **Solidity Contracts:** If you need to interact with the Solidity contracts directly, head to the `Hardhat Solidity Contracts` folder for deployment and usage instructions.

4. **Backend Server:** To understand and configure the Node.js Express Backend Server, refer to the `Node.js Express Backend Server` folder's README.

## Contribution

We welcome contributions from the community! If you're interested in improving the Opium Pay project, feel free to submit pull requests or open issues.



