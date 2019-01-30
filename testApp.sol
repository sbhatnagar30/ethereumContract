pragma solidity ^0.4.23;

contract CrudApp {
    
   struct state{
      string name;
      string largestCity;
      uint256 gdp;
      uint256 population;
   }
  
   state[] public states; 

   uint256 public totalStates;
  
  
    constructor() public {
       totalStates = 0;
   }

   event stateEvent(string stateName , string city, uint256 gpd, uint256 population);
   
   event cityUpdated(string stateName , string city);

   event gdpUpdated(string stateName, uint256 currentGDP);

   event populationUpdated(string stateName, uint256 currentPopulation)

   event stateDelete(string stateName);

    
   function insert( string stateName, string city, uint256 gdp, uint256 population) public returns (uint256 totalStates){
        state memory stateCountry = state(stateName, city, gdp, population);
        states.push(newState);
        totalStates++;
        //emit event
        emit stateEvent (stateName, city, gdp, population);
        return totalStates;
   }
   
   function updateCity(string stateName, string city) public returns (bool success){
       for(uint256 i =0; i< totalStates; i++){
           if(compareStrings(states[i].name ,stateName)){
              states[i].largestCity = city;
              emit cityUpdated(stateName, city);
              return true;
           }
       }
       return false;
   }

   function updateGDP(string stateName, uint256 currentGDP) public returns (bool success) {
       for(uint256 i =0; i< totalStates; i++) {
           if(compareStrings(states[i].name , stateName)){
              states[i].gdp = currentGDP;
              emit gdpUpdated(countryName, currentGDP);
              return true;
           }
       }
       return false;
   }

   function updatePopulation(string stateName, uint256 currentPopulation) public returns (bool success){
       for(uint256 i =0; i< totalStates; i++){
           if(compareStrings(states[i].name ,stateName)){
              states[i].population = currentPopulation;
              emit populationUpdated(stateName, currentPopulation);
              return true;
           }
       }
       return false;
   }
   
   function deleteCountry(string stateName) public returns(bool success){
        require(totalStates > 0);
        for(uint256 i =0; i< totalStates; i++){
           if(compareStrings(states[i].name , stateName)){
              states[i] = states[totalstates-1];
              delete states[totalCountries-1];
              totalStates--;    
              states.length--;  
              emit CountryDelete(stateName);
              return true;
           }
       }
       return false;
   }
   
     
   function getState(string stateName) public view returns(string name, string city, uint256 gdp, uint256 population){
        for(uint256 i=0; i< totalStates; i++){
           if(compareStrings(states[i].name, stateName)){
              //emit event
              return (states[i].name, states[i].largestCity, states[i].gdp, countries[i].population);
           }
       }
       revert('state not found');
   }     
   
  function compareStrings (string a, string b)  internal pure returns (bool){
       return keccak256(a) == keccak256(b);
   }
   
   
   function getTotalStates() public view returns (uint256 length){
      return states.length;
   }
}
