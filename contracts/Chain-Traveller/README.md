# Chain Traveller Contract V1.0

This smart contract allows to track trips in time. Moreover, it allows users to specify what is the planned trip and what is the actual trip performed.

# Gas consumption:
Note: For this test, we use:
- For values representing time: 0
- For strings: "x"

Gas cost may very depending on the size of the parameters.

| Function  | Gas consumption (Remix) | Gas consumption (Rinkeby) |
| ------------- | ------------- | ------------- |
| ChainTraveller  | 2 570 179 | 1 299 167 (0xb8b1f48a3559cb6695df2753f23b24d27b27faef8cf646195db36955e85281d2)| 
| createTrip | 125 696 | 125 585 (0xf975ad412a716680e2b6c3a0bb4497deea9c7617c211e0cc920e4cd711128542) |
| createPlannedTrip  | 60 555 | 60 465 (0xf66ae324f8e9c54f11edd80e3548573e33171085ad53625efc1124508a3b9b62) |
| addStageToPlannedTrip  | 96 809 | 96 256 (0x652adc8c6e9606b24817eed8ac7fe9f9632c505c586dce18feb43c7b914dd38b) |
| createActualTrip  | 60 599 | 60 512 (0xd938028788299f22808004945882b512f8c16b5b8b95c3e1a607c82afda75cf3) |
| addStageToActualTrip  | 96 721 | 96 168 (0x2645e5b439b1415b7a14ae1d32258e15ced2e2f5f3783fa90c42f505ad5232ad) |