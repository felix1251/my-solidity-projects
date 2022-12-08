pragma solidity >=0.7.0 <0.9.0;

contract Vote{

      struct Voters {
            uint timestamp;
            bool voted;
      }

      struct Candidates {
            string name;
            uint voteCount;
      }

      address public owner;

      mapping(address => Voters) public voters;
      Candidates[] public candidates;

      constructor() {
            owner = msg.sender;
      }

      function addCandidate(string memory name) public {
            Candidates memory newCandidate = Candidates(name, 0);
            candidates.push(newCandidate);
      }

      function registerVoter(address voterAddress) public {
            Voters memory newVoter = Voters(block.timestamp, false);
            voters[voterAddress] = newVoter;
      }

      function voteCandidate(uint index) public {
            
      }

}