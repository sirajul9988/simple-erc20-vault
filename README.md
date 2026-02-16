# Simple ERC20 Vault

An educational and production-ready implementation of a basic token vault. This repository demonstrates how to manage user deposits and issue "shares" representing a portion of the total pool, a fundamental building block of DeFi protocols.

## Overview
The Vault allows users to deposit a specific ERC20 token and receive Vault Shares in return. These shares can later be burned to withdraw the original tokens.

## Features
* **ERC20 Compatibility:** Works with any standard OpenZeppelin-based token.
* **Share Calculation:** Transparent logic for minting and burning shares based on total assets.
* **Security:** Built using industry-standard libraries to prevent common vulnerabilities.

## Getting Started
1. Deploy an ERC20 token (or use an existing one).
2. Deploy the `Vault.sol` contract, passing the token address to the constructor.
3. Approve the Vault to spend your tokens.
4. Call `deposit()` to start using the vault.

## Tech Stack
* **Language:** Solidity 0.8.20
* **Framework:** Hardhat / Foundry compatible
