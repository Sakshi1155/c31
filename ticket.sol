// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {
        // The Ownable constructor automatically sets the deployer as the owner
    }

    // Function to mint new tokens. Only the owner can call this function.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's account.
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
