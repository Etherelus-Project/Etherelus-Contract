// Written by Florian Castelain <castelainflorian44@gmail.com> for the Etherelus-Project
// Version WIP
pragma solidity ^0.4.18;
contract ChainStarter {

    address public administrator;

    mapping(uint256=>Starter) private starters;
    uint256 private startersCounter;

    struct Starter {
        address owner;
        uint256 targetFounds;
        uint256 currentFounds;
        uint256 minimumFounds;
        string description;
        uint256 deadLine;
        bool active;
        uint256 participantsCounter;
        mapping(address=>uint256) participants;
    }

    modifier isActive(uint _id) {
        require(starters[_id].active == true);
        _;
    }

    modifier beforeDeadline(uint256 _id) {
        require(starters[_id].deadLine >= block.timestamp);
        _;
    }

    modifier afterDeadline(uint256 _id) {
        require(starters[_id].deadLine <= block.timestamp);
        _;
    }
    
    modifier isOwner(uint256 _id) {
        require(starters[_id].owner == msg.sender);
        _;
    }

    function ChainStarter() public {
        administrator = msg.sender;
        startersCounter = 0;
    }

    function createStarter(address _owner, uint256 _target, uint256 _minimum, string _desc, uint256 _deadline, bool _active) public {
        Starter memory starter = Starter(_owner, _target, 0, _minimum, _desc, _deadline, _active, 0);
        starters[startersCounter] = starter;
        startersCounter++;
    }

    function participate(uint256 _id) payable public isActive(_id) beforeDeadline(_id) {
        starters[_id].currentFounds += msg.value;
        starters[_id].participants[msg.sender] += msg.value;
        starters[_id].participantsCounter++;
    }

    function setActivity(uint256 _id, bool _active) public beforeDeadline(_id) {
        starters[_id].active = _active;
    }

    function withdraw(uint256 _id) public isOwner(_id) afterDeadline(_id) {
        msg.sender.transfer(starters[_id].currentFounds);
        starters[_id].active = false;
    }


}