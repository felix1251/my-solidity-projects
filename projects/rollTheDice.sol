//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract RollTheDice{

      address public owner;
      uint[] private dice;

      constructor() {
            owner = msg.sender;
            for(uint i = 0; i < 8; i++){
                  dice.push(i+1)
            }
      }

      function roller() public view returns(uint){
            uint randomIndex = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % dice.length;
            return dice[randomIndex]
      }

}