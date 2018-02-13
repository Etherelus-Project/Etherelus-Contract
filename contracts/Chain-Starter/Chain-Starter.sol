// Written by Florian Castelain <castelainflorian44@gmail.com> for the Etherelus-Project
// Version WIP
pragma solidity ^0.4.18;
contract ChainStarter {

    address public administrator;

    function ChainStarter() public {
        administrator = msg.sender;
    }

}