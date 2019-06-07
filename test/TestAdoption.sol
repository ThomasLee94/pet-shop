pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
 // The address of the adoption contract to be tested
 Adoption adoption = Adoption(DeployedAddresses.Adoption());

 function testUserCanAdoptPet() public {
   uint returnedId = adoption.adopt(expectedPetId);
   
   Assert.equal(returnedId, expectedPetId, "Adoption of expected pet should match what is returned.");
 }

 function testGetAdopterAddressByPetId() public {
   address adopter = adoption.adopters(expectedPetId);

   Assert.equal(adopter, expectedAdopter, "Owner od the expected pet should be this contract");
 }

 // The id of the pet that will be used for testing
 uint expectedPetId = 8;

 //The expected owner of adopted pet is this contract
 address expectedAdopter = address(this);

}