#Chain Traveller Contract V1.0

This smart contract allows to to track trips in time. Moreover, it allows users to specify what is the planned trip and what is the actual trip performed.

#Gas consumption:
Note: For this test, we use:
- For values representing time: 0
- For strings: "x"

Gas cost may very depending on the size of the parameters.

| Function  | Gas consumption (Remix) | Gas consumption (Rinkeby) |
| ------------- | ------------- | ------------- |
| ChainTraveller  | 2 570 179 (tx cost) ~ 1 900 051 (execution cost)  | Not tested yet | 
| createPlannedTrip  | 75 555 (tx cost) ~ 52 747 (execution cost)  | Not tested yet |
| addStageToPlannedTrip  | 96 809 (tx cost) ~ 74 001 (execution cost)  | Not tested yet |
| createActualTrip  | 75 599 (tx cost) ~ 52 791 (execution cost)  | Not tested yet |
| addStageToActualTrip  | 96 721 (tx cost) ~ 73 913 (execution cost)  | Not tested yet |