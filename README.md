#Event Tickets ERC20 Token (ETK)
##Overview
This Solidity smart contract implements "Event Tickets" (ETK), an ERC20 token. It supports functionalities for minting new tokens, burning tokens, and allowing token holders to redeem their tokens. Ownership management is implemented using OpenZeppelin's Ownable pattern.

##Contract Details
Token Name: Event tickets (ETK)
Token Symbol: ETK
Decimals: 18
##Functions
Mint Tokens

Mints new tokens and assigns them to the designated address.
Access: Only the contract owner can call this function.
Burn Tokens

Burns (destroys) tokens from the caller's account.
Access: Any token holder can call this function.
Redeem Tokens

Redeems tokens by burning them from the caller's account.
Access: Any token holder can call this function, provided they have enough tokens.
##Usage
###Interacting with the Contract
Deploy the Contract

Deploy the contract on a compatible Ethereum development environment like Remix.

Mint Tokens

As the contract owner, call the function to mint new tokens.

Burn Tokens

Any token holder can burn their tokens by calling the function.

Redeem Tokens

Token holders can redeem their tokens by calling the function.

Transfer Tokens
To transfer tokens, use the transfer function.

Approve Token Spending
Use approve to authorize another address to spend tokens on your behalf.
Use transferFrom to transfer tokens from the approved address.
##Error Handling
Insufficient Balance: The redeem function will revert if the caller does not have enough tokens to redeem.
##Deployment
Ensure Solidity version ^0.8.20 is used for contract compilation. Deploy the contract on a suitable Ethereum network, considering gas costs and transaction fees.

