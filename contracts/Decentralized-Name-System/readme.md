# Decentralized Name System V1.0

This simple smart contract allows user to know the real value of a key.
A simple example is for identity: If someone wants peopl to be able to know its name, this someone can link its ethereum address to it:

`0x0000000...000 => John Smith`

# Gas consumption:
Note: For this test, we use:
- For keys: "florian"
- For values: "castelain"

Gas cost may very depending on the size of the parameters.

| Function  | Gas consumption (Remix) | Gas consumption (Rinkeby) |
| ------------- | ------------- | ------------- |
| DecentralizedNameSystem  | 820 494 | | 
| addSystem | 73 092 |   |
| removeSystem | 21 883 |  |