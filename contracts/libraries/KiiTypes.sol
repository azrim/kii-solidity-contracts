// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../CosmosTypes.sol";

library KiiTypes {
    struct Description {
        string moniker;
        string identity;
        string website;
        string securityContact;
        string details;
    }

    struct CommissionRates {
        string rate;
        string maxRate;
        string maxChangeRate;
    }

    struct Validator {
        string operatorAddress;
        bytes consensusPubkey;
        bool jailed;
        string status;
        string tokens;
        string delegatorShares;
        Description description;
        int64 unbondingHeight;
        int64 unbondingTime;
        CommissionRates commission;
        int64 minSelfDelegation;
    }

    struct RedelegationEntry {
        uint64 creationHeight;
        int64 completionTime;
        string initialBalance;
        string sharesDst;
    }

    struct Redelegation {
        address delegatorAddress;
        address validatorSrcAddress;
        address validatorDstAddress;
        RedelegationEntry[] entries;
    }
    
    struct UnbondingDelegationEntry {
        uint64 creationHeight;
        int64 completionTime;
        string initialBalance;
        string balance;
    }

    struct UnbondingDelegation {
        address delegatorAddress;
        address validatorAddress;
        UnbondingDelegationEntry[] entries;
    }
}
