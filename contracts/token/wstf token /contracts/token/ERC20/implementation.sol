// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./OmniERC20.sol";  // Import the abstract OmniERC20 contract

contract MyOmniToken is OmniERC20 {
address omniPortal=0xcB60A0451831E4865bC49f41F9C67665Fc9b75C3;
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply,
        address initialMinterAddress,
        bool ismainChain
    ) OmniERC20(name_, symbol_, omniPortal) {
        // Mint initial supply to the deployer (you can change this as needed)
        if(ismainChain== true){
        _mint(initialMinterAddress, initialSupply);
        }
        else {
              _mint(address(this), initialSupply);
        }
    }

    // Public mint function, callable by the owner (if you wish to allow minting after deployment)
    function mint(address account, uint256 value) public {
        // Add your own access control here, e.g., onlyOwner modifier
        _mint(account, value);
    }

    // Internal mint function
    function _mint(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), account, value);
    }
}
