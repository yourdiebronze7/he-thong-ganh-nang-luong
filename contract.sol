pragma solidity ^0.8.0;

contract EnergyExchange {
    struct Transaction {
        address buyer;
        address seller;
        uint256 amount;
        uint256 price;
    }

    mapping(uint256 => Transaction) public transactions;
    uint256 public transactionCount;

    function makeTransaction(address _seller, uint256 _amount, uint256 _price) public {
        transactionCount++;
        transactions[transactionCount] = Transaction(msg.sender, _seller, _amount, _price);
    }

    function getTransaction(uint256 _transactionId) public view returns (Transaction memory) {
        return transactions[_transactionId];
    }
}