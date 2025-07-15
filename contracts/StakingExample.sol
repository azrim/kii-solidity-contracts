// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/KiiStaking.sol";

contract StakingExample {
    function delegateToValidator(address validatorAddress, uint256 amount) public {
        KiiStaking.delegate(validatorAddress, amount);
    }
}
