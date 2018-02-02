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
   function chainTravaller(address admin) public {
       administrator = admin;
       trips_counter = 0;
   }

    // When creating the trip, create temporary structs in memory and assign them
   function createTrip() public {
        PlannedTrip memory planned = PlannedTrip("",0,"",0,0);
        ActualTrip memory actual = ActualTrip("",0,"",0,0);
        trips[msg.sender][addr_trips_counter[msg.sender]] = Trip(planned, actual);
   }

}