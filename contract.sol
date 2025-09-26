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

    event TransactionMade(address indexed buyer, address indexed seller, uint256 amount, uint256 price);

    function makeTransaction(address _seller, uint256 _amount, uint256 _price) public {
        require(_amount > 0, "Amount must be greater than zero.");
        require(_price > 0, "Price must be greater than zero.");
        transactionCount++;
        transactions[transactionCount] = Transaction(msg.sender, _seller, _amount, _price);
        emit TransactionMade(msg.sender, _seller, _amount, _price);
    }

    function getTransaction(uint256 _transactionId) public view returns (Transaction memory) {
        return transactions[_transactionId];
    }
}