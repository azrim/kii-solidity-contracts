// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./KiiTypes.sol";
import "../CosmosTypes.sol";

library KiiStaking {
    address constant STAKING_PRECOMPILE_ADDRESS = 0x0000000000000000000000000000000000000800;

    function delegate(address validatorAddress, uint256 amount) internal {
        (bool success, ) = STAKING_PRECOMPILE_ADDRESS.call(
            abi.encodeWithSignature("delegate(address,address,uint256)", msg.sender, validatorAddress, amount)
        );
        require(success, "KiiStaking: delegate failed");
    }

    function undelegate(address validatorAddress, uint256 amount) internal returns (int64) {
        (bool success, bytes memory data) = STAKING_PRECOMPILE_ADDRESS.call(
            abi.encodeWithSignature("undelegate(address,address,uint256)", msg.sender, validatorAddress, amount)
        );
        require(success, "KiiStaking: undelegate failed");
        return abi.decode(data, (int64));
    }

    function redelegate(address srcValidatorAddress, address dstValidatorAddress, uint256 amount) internal returns (int64) {
        (bool success, bytes memory data) = STAKING_PRECOMPILE_ADDRESS.call(
            abi.encodeWithSignature("redelegate(address,address,address,uint256)", msg.sender, srcValidatorAddress, dstValidatorAddress, amount)
        );
        require(success, "KiiStaking: redelegate failed");
        return abi.decode(data, (int64));
    }

    function getValidator(address validatorAddress) internal view returns (KiiTypes.Validator memory) {
        (bool success, bytes memory data) = STAKING_PRECOMPILE_ADDRESS.staticcall(
            abi.encodeWithSignature("validator(address)", validatorAddress)
        );
        require(success, "KiiStaking: getValidator failed");
        return abi.decode(data, (KiiTypes.Validator));
    }

    function getDelegation(address validatorAddress) internal view returns (uint256, Cosmos.Coin memory) {
        (bool success, bytes memory data) = STAKING_PRECOMPILE_ADDRESS.staticcall(
            abi.encodeWithSignature("delegation(address,address)", msg.sender, validatorAddress)
        );
        require(success, "KiiStaking: getDelegation failed");
        return abi.decode(data, (uint256, Cosmos.Coin));
    }
}
