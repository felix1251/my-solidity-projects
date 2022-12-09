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
            for(uint i = 0; i < candidates.length; i++){
                  if(candidates[i].name == name){
                        require(candidates[i].name != name, "name already exist");
                        break;
                  }
            }
            Candidates memory newCandidate = Candidates(name, 0);
            candidates.push(newCandidate);
      }

      function registerVoter(address voterAddress) public {
            require(voters[voterAddress] == false, "voter already exist")
            Voters memory newVoter = Voters(block.timestamp, false);
            voters[voterAddress] = newVoter;
      }

      function voteCandidate(uint index) public {
            require(owner != msg.sender, "owner cannot vote");
            require(voters[msg.sender].voted == false, "already voted");
            candidates[index].voteCount += 1;
            voters[msg.sender].voted = true;
      }

      function getWinner() public view returns (string memory){
            uint winningVoteCount = 0;
            uint winnerIndex;

            for(uint i = 0; i < candidates.length; i++){
                  if(candidates[i].voteCount > winningVoteCount){
                        winningVoteCount = candidates[i].voteCount;
                        winnerIndex = i;
                  }
            }
            return candidates[winnerIndex].name
      }
}