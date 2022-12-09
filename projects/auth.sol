pragma solidity >=0.7.0 <0.9.0;

contract Auth{

      struct Users {
            uint id;
            string name;
            string username;
            string password;
      }

      mapping (uint => Users) users;
      uint[] userIds;

      constructor() {
            owner = msg.sender;
      }

      function createUser(name, username, password) public{
            for(uint i = 0; i < userIds.length; i++){
                  if(users[userIds[i]].username == username){
                        require(users[userIds[i]].username != username, "username already exist")
                        break;
                  }
            }

            uint randomId;

            while (true) {
                  randomId = block.timestamp;
                  if(userIds[randomId].exists == false) break;
            }

            Users memory newUser = Users(randomId, name, username, password);

            users[randomId] = newUser
            userIds.push(randomId)
      }

      function findUser(string username) public view returns(Users) {
            Users memory _user = new Users;
            for(uint i = 0; i < userIds.length; i++){
                  if(users[userIds[i]].username == username){
                        _user = users[userIds[i]];
                        break;
                  }
            }
            return _user;
      }
}