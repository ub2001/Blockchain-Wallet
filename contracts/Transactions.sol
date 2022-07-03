//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


contract Transactions {
    uint256 transactionsCount   ; // simple variable to count the number of transactions
    
    event Transfer(address from, address receiver, uint amount,string message, uint256 timestamp,string keyword);

    struct TransferStruct {
        address sender;      // type : property
        address receiver; 
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }
     // we want to store all the transactions so we create array of transactions

     TransferStruct[] transactions;  // array of objects
     
     // memory word is used for things whcih are not deafult stored value like amunt address of sender receiver
     function addToBlockchain(address payable receiver,uint amount,string memory message,string memory keyword) public {
     transactionsCount++;
     transactions.push(TransferStruct(msg.sender,receiver,amount,message,block.timestamp,keyword));
     emit Transfer(msg.sender,receiver,amount,message,block.timestamp,keyword);

     }
     function getAllTransactions() public view returns (TransferStruct[] memory){
        return transactions;
     }
     function getTransactionCount() public view returns (uint256) {
        return transactionsCount;
     }
    
}
