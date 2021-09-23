pragma solidity ^0.4.17;

contract Banco {
   
   
   address owner; // direccion, dueño
   modifier onlyOwner{
        require(msg.sender == owner);
        _; //ejecuta la funcion que le sigue de ser true
   }
   
   function newOwner(address _newOwner) public onlyOwner{
       owner = _newOwner;  //funcion para cambiar dueño del SmartContract
   }
   
   function getOwner() view public returns(address) {
       return owner; //devuelve quien es el dueño
   }
   
   function getBalance() view public returns(uint256){
       return address(this).balance;// saldo del SmartContract
   }
   
    function Banco() payable public { // constructor, funcion inicializadoa
    owner = msg.sender; //le estamos diciendo que el dueño es "sender", el q envio
     }
     
     
     
     function incrementBalance (uint256 amount) payable public {
         require(msg.value == amount);  //especifica la cantidad exacta a enviar, medida de seguriddd
     }
     
     function withdrawBalance () public onlyOwner{
        //  require(msg.sender == owner); esta el modifier ya configurado
         msg.sender.transfer(address(this).balance);
     }
     
     
}