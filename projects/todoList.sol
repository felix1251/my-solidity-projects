//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TodoList{

      struct Todos {
            string description;
            uint timestamp;
      }

      address public owner;
      Todos[] private toDo;

      constructor() {
            owner = msg.sender;
      }

      function addToList(string memory desc) public {
            Todos memory todo = Todos(desc, block.timestamp);
            toDo.push(todo);
      }

      function viewTodoList() public view returns (Todos[] memory){
            return toDo;
      }

      function see(uint index) public view returns(Todos memory){
            return toDo[index];
      }
}