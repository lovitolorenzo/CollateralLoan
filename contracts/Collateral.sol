pragma solidity >=0.7.0 <0.9.0;

import {ERC20} from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Loan} from "./Loan.sol";

contract LoanRequest {
    address payable public borrower = payable(msg.sender);
    ERC20 public token;
    uint256 public collateralAmount; /// @dev Amount of given token as collateral by the borrower
    uint256 public loanAmount;
    uint256 public payoffAmount; /// @dev To re-pay amount
    uint256 public loanDuration;

    constructor(
        ERC20 _token,
        uint256 _collateralAmount,
        uint256 _loanAmount,
        uint256 _payoffAmount,
        uint256 _loanDuration
    ) public {
        token = _token;
        collateralAmount = _collateralAmount;
        loanAmount = _loanAmount;
        payoffAmount = _payoffAmount;
        loanDuration = _loanDuration;
    }

    Loan public loan;

    event LoanRequestAccepted(address loan);

    function lendEther() public payable {
        require(msg.value == loanAmount);
        loan = new Loan(
            payable(msg.sender),
            borrower,
            token,
            collateralAmount,
            payoffAmount,
            loanDuration
        );
        require(token.transferFrom(borrower, address(loan), collateralAmount));
        borrower.transfer(loanAmount);
        emit LoanRequestAccepted(address(loan));
    }
}
