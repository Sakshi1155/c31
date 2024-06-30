// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EventTickets is ERC20, Ownable {

    constructor() ERC20("Event Tickets", "ETK") Ownable(msg.sender) {}

    /// @dev Function to mint new tokens. Only the contract owner can call this function.
    /// @param to Address to which tokens will be minted.
    /// @param amount Number of tokens to mint.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    /// @dev Function to burn tokens from the caller's account.
    /// @param amount Number of tokens to burn.
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    /// @dev Function to redeem tokens by burning them from the caller's account.
    /// @param amount Number of tokens to redeem.
    function redeem(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to redeem");
        _burn(msg.sender, amount);
        // Add additional logic for redeeming items or rewards here
    }

    /// @dev Overridden transfer function to transfer tokens to a specified address.
    /// @param to Address to receive the tokens.
    /// @param amount Number of tokens to transfer.
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    /// @dev Overridden transferFrom function to transfer tokens on behalf of another address.
    /// @param sender Address from which tokens are transferred.
    /// @param recipient Address to which tokens are transferred.
    /// @param amount Number of tokens to transfer.
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
        return true;
    }

    /// @dev Overridden approve function to approve another address to spend tokens on your behalf.
    /// @param spender Address to approve for spending tokens.
    /// @param amount Number of tokens to approve.
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
}
