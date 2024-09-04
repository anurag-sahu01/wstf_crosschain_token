# OmniERC20 Contract Documentation

## Overview

The `OmniERC20` contract is an implementation of an ERC20 token with additional features for cross-chain communication using the Omni protocol. This contract allows tokens to be transferred across different chains and manages token balances, allowances, and minting.

## Features
  Standard ERC20 Token Functionality: Implements IERC20 and IERC20Metadata for basic token operations.
  Cross-Chain Transfers: Uses the Omni framework to support locking tokens on the current chain and initiating transfers to other chains.
 Cross-Chain Communication: Handles incoming cross-chain messages to release tokens on the target chain.
  

## Contract Inheritance
The OmniERC20 contract inherits from:

 Context: Provides information about the current execution context.
 
 IERC20: Defines the ERC20 standard methods and events.
 
IERC20Metadata: Extends IERC20 to include metadata functions.

IERC20Errors: Provides error definitions for the ERC20 operations.

XApp: Part of the Omni framework for cross-chain communication.

ConfLevel: Used for configuration settings in the Omni framework.


### Constructor

    constructor(string memory name_, string memory symbol_, address omniPortal)
    
`name_: `The name of the token.

`symbol_:` The symbol of the token.

`omniPortal:` Address of the Omni portal contract.


## Functions
ERC20 Standard Functions

`name():` Returns the name of the token.

`symbol():` Returns the symbol of the token.

`decimals():` Returns the number of decimal places for the token (18 by default).

`totalSupply(): `Returns the total supply of the token.

`balanceOf(address account):` Returns the balance of the specified account.

`allowance(address owner, address spender):` Returns the amount of tokens that spender is allowed to spend on behalf of owner.

`approve(address spender, uint256 value):` Allows spender to spend up to value tokens on behalf of the caller.

`transfer(address to, uint256 value):` Transfers value tokens to to.

`transferFrom(address from, address to, uint256 value): `Transfers value tokens from from to to using the caller's allowance.

## Cross-Chain Functions

`transfer(uint64 destChain, address to, uint256 value):` Locks value tokens in the contract and initiates a cross-chain transfer to destChain with the specified to address.

`receiveTransfer(address from, address to, uint256 value): `Receives a cross-chain transfer and updates balances accordingly.

## Internal Functions

`_transfer(address from, address to, uint256 value):` Internal function to handle the transfer of tokens.
`_update(address from, address to, uint256 value):` Internal function to update token balances and total supply.
`_approve(address owner, address spender, uint256 value): `Internal function to set or update the allowance of spender by owner.   
`_spendAllowance(address owner, address spender, uint256 value): `Internal function to spend tokens from owner's allowance.  

## Events
`Transfer(address indexed from, address indexed to, uint256 value):` Emitted when tokens are transferred.   
`Approval(address indexed owner, address indexed spender, uint256 value):` Emitted when an approval is set or updated.

## Usage

- Deploy the OmniERC20 contract with the desired token name, symbol, and Omni portal address.
- Use standard ERC20 functions for token operations.
- To transfer tokens to another chain, call the transfer function with the destination chain ID, recipient address, and amount.
- The receiveTransfer function will be called automatically on the target chain to complete the token transfer.



#