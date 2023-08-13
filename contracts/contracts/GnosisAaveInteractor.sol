// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IGnosisSafe {
    function execTransaction(
        address to,
        uint256 value,
        bytes calldata data,
        uint8 operation,
        uint256 safeTxGas,
        uint256 baseGas,
        uint256 gasPrice,
        address gasToken,
        address refundReceiver,
        bool reimburseGasFee
    ) external returns (bool success);
}

interface IAaveLendingPool {
    function deposit(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external;
    function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode) external;
}

contract GnosisAaveInteractor {
    address private owner;
    address private usdcToken;  // Address of the USDC token contract
    IAaveLendingPool private aaveLendingPool;
    IGnosisSafe private gnosisSafe;

    mapping(address => address) public userToGnosisSafe; // Maps users to their Gnosis Safe addresses

    event Liquidation(address indexed user, uint256 amount);
    event Lending(address indexed user, uint256 amount);
    event Borrowing(address indexed user, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyUser() {
        require(userToGnosisSafe[msg.sender] != address(0), "User has not been added");
        _;
    }

    constructor(address _usdcToken, address _aaveLendingPool, address _gnosisSafe) {
        owner = msg.sender;
        usdcToken = _usdcToken;
        aaveLendingPool = IAaveLendingPool(_aaveLendingPool);
        gnosisSafe = IGnosisSafe(_gnosisSafe);
    }

    function addUser(address user, address safeAddress) external onlyOwner {
        require(user != address(0), "Invalid user address");
        require(safeAddress != address(0), "Invalid Safe address");
        userToGnosisSafe[user] = safeAddress;
    }

    function liquidate() external onlyOwner {
        // Retrieve USDC balance from the contract
        uint256 usdcBalance = IERC20(usdcToken).balanceOf(address(this));

        // Prepare data for Gnosis Safe transaction to transfer USDC
        bytes memory data = abi.encodeWithSignature("transfer(address,uint256)", owner, usdcBalance);

        // Execute Gnosis Safe transaction
        require(IGnosisSafe(userToGnosisSafe[msg.sender]).execTransaction(
            usdcToken,
            0,
            data,
            0, // Operation: Call
            0, // SafeTxGas
            0, // BaseGas
            0, // GasPrice
            address(0), // GasToken
            address(0), // RefundReceiver
            false // ReimburseGasFee
        ), "Failed to execute Gnosis Safe transaction");

        emit Liquidation(msg.sender, usdcBalance);
    }

    function lend(uint256 amount) external onlyUser {
        // Deposit USDC into Aave lending pool
        IERC20(usdcToken).approve(address(aaveLendingPool), amount);
        aaveLendingPool.deposit(usdcToken, amount, address(this), 0);

        // For demonstration purposes, emit an event
        emit Lending(msg.sender, amount);
    }

    function borrow(uint256 amount) external onlyUser {
        // Borrow USDC from Aave lending pool
        aaveLendingPool.borrow(usdcToken, amount, 1, 0);

        // Prepare data for Gnosis Safe transaction to transfer borrowed USDC to user
        bytes memory data = abi.encodeWithSignature("transfer(address,uint256)", msg.sender, amount);

        // Execute Gnosis Safe transaction to transfer borrowed USDC
        require(IGnosisSafe(userToGnosisSafe[msg.sender]).execTransaction(
            usdcToken,
            0,
            data,
            0, // Operation: Call
            0, // SafeTxGas
            0, // BaseGas
            0, // GasPrice
            address(0), // GasToken
            address(0), // RefundReceiver
            false // ReimburseGasFee
        ), "Failed to execute Gnosis Safe transaction");

        emit Borrowing(msg.sender, amount);
    }

    // Additional functions and events can be added as needed
}
