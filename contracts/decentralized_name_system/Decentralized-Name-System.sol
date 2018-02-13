// Written by Florian Castelain <castelainflorian44@gmail.com> for the Etherelus-Project
// Version 1.0
pragma solidity ^0.4.18;
contract DecentralizedNameSystem {

    address public administrator;

    struct System {
        string value;
        address owner;
    }

    mapping (string=>System) private domains;
    uint256 private domainsCounter;

    event AddSystem(string indexed key, string indexed value, address indexed sender);
    event RemoveSystem(string indexed key, string indexed value, address indexed sender);

    function DecentralizedNameSystem() public {
        administrator = msg.sender;
        domainsCounter = 0;
    }

    function addSystem(string key, string value, address owner) public {
        AddSystem(key, value, owner);
        System memory system = System(value, owner);
        domains[key] = system;
        domainsCounter++; 
    }

    modifier canDeleteSystem(string key) {
        require((msg.sender == administrator) || (msg.sender == domains[key].owner));
        _;
    }

    function removeSystem(string key) public canDeleteSystem(key) {
        RemoveSystem(key, domains[key].value, msg.sender);
        delete domains[key];
    }

    function resolve(string key) public constant returns(string) {
        return(domains[key].value);
    }

}