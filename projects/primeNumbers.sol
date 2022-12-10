//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract PrimeNumbers{

      uint[] arr = [1, 2, 4, 8, 10, 11, 14, 18];

      function check() public view returns (string memory){
            string _msg = 
            for(uint i = 0; i < arr.length; i++){
                  bool isPrime = true;
                  if(arr[i] > 1){
                        for(uint y = 0; y < arr[i]; y++){
                              if (arr[i] % y == 0){
                                    isPrime = false;
                                    break;
                              }
                        }
                  }
                  if(isPrime) _msg +=  arr[i] + "is a prime ";
                  else _msg +=  arr[i] + "is not a prime ";
            }
            return _msg;
      }
}