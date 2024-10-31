// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Paypal {

    //Define the owner of the smart contract

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    //Create struct and mapping for request, transaction and name

    struct request {
        address requestor;
        uint256 amount;
        string message;
        string name;
    }
    struct sendRecieve {
        string action;
        uint256 amount;
        string message;
        address otherPartyAddress;
        string otherPartyName;
    }

    struct userName {
        string name;
        bool hasName;
    }

    mapping(address => userName) names;
    mapping(address => request[]) requests;
    mapping(address => sendRecieve[]) history;

    //Add a name to walet address

    function addName(string memory _name) public {
        userName storage  newUserName = names[msg.sender];
        newUserName.name = _name;
        newUserName.hasName = true;
    }

    //Create a request

    function createRequest(address user, uint256 _amount, string memory _message) public {
        request memory newRequest;
        newRequest.requestor = msg.sender;
        newRequest.amount = _amount;
        newRequest.message = _message;
        if(names[msg.sender].hasName){
            newRequest.name = names[msg.sender].name;
        }
        requests[user].push(newRequest);
    }

    //Pay a request
    function payRequest(uint256 _request) public payable{
        require(_request < request[msg.sender].length,  "No such Request");
        request[] storage myRequests = request[msg.sender];
        request storage payableRequest = myRequests[_request ];

        uint256 toPay = payableRequest.amount *1000000000000000000;
        require(msg.value == (toPay), "pay Correct Amount");

        payable(payableRequest.requestor).transfer(msg.value);

        addHistory(msg.sender, payableRequest.requestor, payableRequest.amount, payableRequest.message);

        myRequests[_request] = myRequests[myRequests.lenght-1];
        myRequests.pop();

    }
    function addHistory(address sender, address receiver, uint256 _amount, string memory _message) private {

        sendRecieve memory newSend;
        newSend.action = "-";
        newSend.amount = _amount;
        newSend.message = _message;
        newSend.otherPartyAddress= receiver;
        if(names[receiver].hasName){
            newSend.otherPartyName = names[receiver].name;
        }
        history[sender].push(newSend);

        sendRecieve memory newReceive;
        newSend.action = "+";
        newSend.amount = _amount;
        newSend.message = _message;
        newSend.otherPartyAddress= sender;
        if(names[sender].hasName){
            newSend.otherPartyName = names[sender].name;
        }
        history[receiver].push(newReceive);
    }


    //Get all request sent to a user

    //Get all history transactions for a user
}


