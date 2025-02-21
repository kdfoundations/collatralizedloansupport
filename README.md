# collatralizedloansupport
# Collateralized Loan Contract

## Project Description

The **Collateralized Loan Contract** is a smart contract written in **Solidity** that enables secure **peer-to-peer lending** using **collateralized loans**. Borrowers deposit collateral (e.g., ETH) to receive a loan with a fixed interest rate and repayment period. If the borrower fails to repay on time, the lender can seize the collateral.

### Features:
- **Collateralized Lending** – Borrowers deposit **1 ETH** to receive a **0.5 ETH** loan.
- **Fixed Interest Rate** – **5%** interest applied to the loan amount.
- **Loan Duration** – **30 days** for repayment before liquidation.
- **Secure Transactions** – Smart contract ensures repayment or collateral seizure.
- **Event Logging** – Tracks deposits, repayments, and liquidations on the blockchain.

## Smart Contract Address

🔗 **Contract Address:** `0xXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`  
*(Replace with actual deployed address)*

## How It Works

1. **Deposit Collateral**: The borrower sends **1 ETH** to initiate the loan.
2. **Receive Loan**: The lender provides **0.5 ETH** as a loan.
3. **Repay Loan + Interest**: The borrower repays **0.525 ETH (loan + interest)** within **30 days**.
4. **Retrieve Collateral**: On successful repayment, the borrower gets back their **1 ETH collateral**.
5. **Liquidation**: If the loan is not repaid on time, the lender **claims the collateral**.

## Smart Contract Code

You can find the Solidity smart contract in [`CollateralizedLoan.sol`](./CollateralizedLoan.sol).

## Deployment & Testing

To deploy and interact with the smart contract, use:

```sh
npx hardhat compile
npx hardhat run scripts/deploy.js --network goerli
