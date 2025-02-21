pragma solidity ^0.8.0;

contract CollateralizedLoan {
    address public lender;
    address public borrower;
    uint256 public collateralAmount = 1 ether; // Fixed collateral amount
    uint256 public loanAmount = 0.5 ether; // Fixed loan amount
    uint256 public interestRate = 5; // 5% interest
    uint256 public loanDuration = 30 days;
    uint256 public loanStartTime;
    bool public isLoanActive;
    
    function depositCollateral() public payable {
        require(msg.sender != lender, "Lender cannot deposit collateral");
        require(msg.value == collateralAmount, "Incorrect collateral amount");
        require(!isLoanActive, "Loan is already active");
        
        borrower = msg.sender;
        isLoanActive = true;
        loanStartTime = block.timestamp;
        payable(lender).transfer(loanAmount); // Transfer loan to borrower
    }

    function calculateRepaymentAmount() public view returns (uint256) {
        if (!isLoanActive) {
            return 0;
        }
        uint256 interest = (loanAmount * interestRate) / 100;
        return loanAmount + interest;
    }

    function repayLoan() public payable {
        require(isLoanActive, "No active loan");
        require(msg.sender == borrower, "Only borrower can repay");
        require(msg.value == calculateRepaymentAmount(), "Incorrect repayment amount");

        isLoanActive = false;
        payable(borrower).transfer(collateralAmount); // Return collateral
        payable(lender).transfer(msg.value); // Transfer repayment to lender
    }

    function liquidate() public {
        require(isLoanActive, "No active loan");
        require(block.timestamp > loanStartTime + loanDuration, "Loan duration not exceeded");

        isLoanActive = false;
        payable(lender).transfer(collateralAmount); // Lender seizes collateral
    }
}
