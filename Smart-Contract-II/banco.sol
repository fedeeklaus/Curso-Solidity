pragma solidity ^0.4.17;

contract Banco {
    function Banco() payable public { // constructor, funcion inicializadoa
     }
     
     
     
     function incrementBalance (uint256 amount) payable public {
         require(msg.value == amount);  //especifica la cantidad exacta a enviar
     }
     
     function getBalance () public {
         msg.sender.transfer(address(this).balance);
     }
     
     
}