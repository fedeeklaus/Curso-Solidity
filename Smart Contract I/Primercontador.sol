pragma solidity ^0.4.17;

contract Contador {
    uint256 count; //uint256 especifica que tipo de dato devuelve al ser lenguaje de tipado fuerte de tipado fuerte
    
    function Contador(uint256 _count) public{ //funcion inicializadora (tambien constructora)
        count = count;
    }
    
    
    function setCount(uint256 _count) public { //public palabra reservada, que cualquiera puede ver esa function
        count = _count;
    }
    
    function incrementCount() public {
        count  ++;
    }
    
    
    function getCount() public view returns(uint256) { //view es una palabra reservada para decirle al nodo que esta function no modifica nada del estado, solo lo lee
        return count; // returns es para saber el tipo de valor que va a ser devuelto
    }
    
     function getNumber() public pure returns(uint256){ //pure especifica la funcion como pura, no lee ni modifica
        return 34
}
}
// }