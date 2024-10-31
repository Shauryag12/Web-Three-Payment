# Web3 Payment

This project is a decentralized payment system built on the Ethereum blockchain using Solidity and Hardhat. It allows users to create payment requests, pay requests, and keep a transaction history, similar to PayPal but on a decentralized platform.

## Features
Add Name to Wallet Address: Users can associate their wallet address with a name.
Create Payment Requests: Users can request payments from other users.
Pay Requests: Users can pay requests made to them.
Transaction History: Users can view their transaction history.


## Installation
1. Clone the repository:


`git clone https://github.com/LakGar/web3-payment.git`
 `cd web3-payment`
 
2. Install Dependencies:


`npm install`


## Usage

1. Compile the Smart Contract:

`npx hardhat compile`

2. Deploy the Smart Contract:


`npx hardhat run scripts/deploy.js --network localhost`

3. Run Tests:

`npx hardhat test`

4. Start Hardhat Node:

`npx hardhat node`


## Contract Overview

### Functions
- **addName(string memory _name)**: Adds a name to the sender's wallet address.
- **createRequest(address user, uint256 _amount, string memory _message)**: Creates a payment request to a specified user.
- **payRequest(uint256 _request) public payable**: Pays a specified request.
- **getMyRequests(address _user) public view returns (address[], uint256[], string[], string[])**: Retrieves all requests sent to a user.
- **getMyHistory(address _user) public view returns (sendReceive[])**: Retrieves the transaction history of a user.
- **getMyName(address _user) public view returns (userName)**: Retrieves the name associated with a user's wallet address.

## Contributing

1. Fork the repository
2. Create your feature branch (git checkout -b feature/your-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/your-feature)
5. Create a new Pull Request

### License
This project is licensed under the MIT License.
