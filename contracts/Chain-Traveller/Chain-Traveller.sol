// Written by Florian Castelain <castelainflorian44@gmail.com> for the Etherelus-Project
pragma solidity ^0.4.18;
contract ChainTraveller {
   

   address public administrator;

    struct Trip {
        PlannedTrip planned;
        ActualTrip actual;
    }
    struct PlannedTrip {
        string origin;
        uint originTime;
        string destination;
        uint destinationTime;
        uint stagesCounter;
        mapping(uint=>Stage) stages;
    }
    struct ActualTrip {
        string origin;
        uint originTime;
        string destination;
        uint destinationTime;
        uint stagesCounter;
        mapping(uint=>Stage) stages;
    }
    struct Stage {
        string origin;
        uint originTime;
        string destination;
        uint destinationTime;
    }
    mapping(address=>mapping(uint=>Trip)) private trips;
    //Count the number of trips of an address
    mapping(address=>uint) private addr_trips_counter; 
    //Count the number of addresses having one or more trips
    uint trips_counter;
   function ChainTraveller() public {
       administrator = msg.sender;
       trips_counter = 0;
   }

    // When creating the trip, create temporary structs in memory and assign them
   function createTrip() public {
        PlannedTrip memory planned = PlannedTrip("",0,"",0,0);
        ActualTrip memory actual = ActualTrip("",0,"",0,0);
        trips[msg.sender][addr_trips_counter[msg.sender]] = Trip(planned, actual);
        trips_counter++;
   }

   function createPlannedTrip(uint tripNumber, string orn, uint oTime, string dest, uint dTime) public {
       require(tripNumber <= addr_trips_counter[msg.sender]);
       trips[msg.sender][tripNumber].planned.origin = orn;
       trips[msg.sender][tripNumber].planned.originTime = oTime;
       trips[msg.sender][tripNumber].planned.destination = dest;
       trips[msg.sender][tripNumber].planned.destinationTime = dTime;
   }

   function getPlannedTripInfo(uint tripNumber) public constant returns (string, uint, string, uint, uint) {
        require(tripNumber <= addr_trips_counter[msg.sender]);
        return (trips[msg.sender][tripNumber].planned.origin, 
        trips[msg.sender][tripNumber].planned.originTime, 
        trips[msg.sender][tripNumber].planned.destination,
        trips[msg.sender][tripNumber].planned.destinationTime,
        trips[msg.sender][tripNumber].planned.stagesCounter);
   }

   function addStageToPlannedTrip(uint tripNumber, string orn, uint oTime, string dest, uint dTime) public {
       require(tripNumber <= addr_trips_counter[msg.sender]);
       uint tempStagesCounter = trips[msg.sender][tripNumber].planned.stagesCounter;
        trips[msg.sender][tripNumber].planned.stages[tempStagesCounter].origin = orn;
        trips[msg.sender][tripNumber].planned.stages[tempStagesCounter].originTime = oTime;
        trips[msg.sender][tripNumber].planned.stages[tempStagesCounter].destination = dest;
        trips[msg.sender][tripNumber].planned.stages[tempStagesCounter].destinationTime = dTime;
        trips[msg.sender][tripNumber].planned.stagesCounter++;
   }

   function getStageFromPlannedTrip(uint tripNumber, uint stageNumber) public constant returns(string, uint, string, uint) {
        require(tripNumber <= addr_trips_counter[msg.sender]);
        require(stageNumber <= trips[msg.sender][tripNumber].planned.stagesCounter);
        return (trips[msg.sender][tripNumber].planned.stages[stageNumber].origin,
        trips[msg.sender][tripNumber].planned.stages[stageNumber].originTime,
        trips[msg.sender][tripNumber].planned.stages[stageNumber].destination,
        trips[msg.sender][tripNumber].planned.stages[stageNumber].destinationTime);
   }

    function createActualTrip(uint tripNumber, string orn, uint oTime, string dest, uint dTime) public {
       require(tripNumber <= addr_trips_counter[msg.sender]);
       trips[msg.sender][tripNumber].actual.origin = orn;
       trips[msg.sender][tripNumber].actual.originTime = oTime;
       trips[msg.sender][tripNumber].actual.destination = dest;
       trips[msg.sender][tripNumber].actual.destinationTime = dTime;
   }

   function getActualTripInfo(uint tripNumber) public constant returns (string, uint, string, uint, uint) {
        require(tripNumber <= addr_trips_counter[msg.sender]);
        return (trips[msg.sender][tripNumber].actual.origin, 
        trips[msg.sender][tripNumber].actual.originTime, 
        trips[msg.sender][tripNumber].actual.destination,
        trips[msg.sender][tripNumber].actual.destinationTime,
        trips[msg.sender][tripNumber].actual.stagesCounter);
   }

   function addStageToActualTrip(uint tripNumber, string orn, uint oTime, string dest, uint dTime) public {
       require(tripNumber <= addr_trips_counter[msg.sender]);
       uint tempStagesCounter = trips[msg.sender][tripNumber].actual.stagesCounter;
        trips[msg.sender][tripNumber].actual.stages[tempStagesCounter].origin = orn;
        trips[msg.sender][tripNumber].actual.stages[tempStagesCounter].originTime = oTime;
        trips[msg.sender][tripNumber].actual.stages[tempStagesCounter].destination = dest;
        trips[msg.sender][tripNumber].actual.stages[tempStagesCounter].destinationTime = dTime;
        trips[msg.sender][tripNumber].actual.stagesCounter++;
   }

   function getStageFromActualTrip(uint tripNumber, uint stageNumber) public constant returns(string, uint, string, uint) {
        require(tripNumber <= addr_trips_counter[msg.sender]);
        require(stageNumber <= trips[msg.sender][tripNumber].actual.stagesCounter);
        return (trips[msg.sender][tripNumber].actual.stages[stageNumber].origin,
        trips[msg.sender][tripNumber].actual.stages[stageNumber].originTime,
        trips[msg.sender][tripNumber].actual.stages[stageNumber].destination,
        trips[msg.sender][tripNumber].actual.stages[stageNumber].destinationTime);
   }

}