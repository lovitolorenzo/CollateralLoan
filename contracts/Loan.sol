pragma solidity >=0.7.0 <0.9.0;

import {ERC20} from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Loan {
    address payable public lender;
    address public borrower;
    ERC20[] public token;
    uint256 public collateralAmount;
    uint256 public payoffAmount;
    uint256 public dueDate;

    constructor(
        address payable _lender,
        address _borrower,
        ERC20[] memory _token,
        uint256 _collateralAmount,
        uint256 _payoffAmount,
        uint256 loanDuration
    ) {
        lender = _lender;
        borrower = _borrower;
        token = _token;
        collateralAmount = _collateralAmount;
        payoffAmount = _payoffAmount;
        dueDate = block.timestamp + loanDuration;
    }

    event LoanPaid();

    function payLoan() public payable {
        require(block.timestamp <= dueDate, "Expiration time has passed.");
        require(
            msg.value == payoffAmount,
            "Not enough money sent to repay the loan."
        ); /// @notice ensuring that the loan has been correctly repaid

        for (uint256 i = 0; i < token.length; i++) {
            require(
                token[i].transfer(borrower, collateralAmount),
                "Transaction to give back collateral to the borrower has gone wrong."
            ); /// @notice send back collateral to the borrower
        }

        emit LoanPaid();
        selfdestruct(lender);
    }

    function repossess() public {
        require(block.timestamp > dueDate);

        for (uint256 i = 0; i < token.length; i++) {
            require(
                token[i].transfer(lender, collateralAmount),
                "Transaction to give collateral to the lender has gone wrong."
            ); /// @notice give collateral to the lender because time terms has not been respected
        }
        selfdestruct(lender);
    }
}
