pragma solidity ^0.5.0;

//Probando pseudoaleatoriedad en Ethereum

contract Loteria {
    address internal owner;
    uint256 internal num;
    uint256 public numGanador;
    uint256 public precio;
    bool public juego;      //el juego esta activo o no, sirve para darle de baja al Smart Contract
    address public ganador;
    
    
    constructor(uint256 _numGanador, uint256 _precio) public payable { //este constructor da el owner
        owner = msg.sender;
        num = 0;
        numGanador = _numGanador; //argumento pasado al constructor
        precio = _precio; //argumento pasado al constructor
        juego = true;
    }
    function comprobarAcierto(uint256 _num) private view returns(bool) {
        if(_num == numGanador) {
            return true;
        } else {
            return false;
        }
    }
    
    function numeroRandom()private view returns(uint256){
        return uint256( keccak256(abi.encode(now, msg.sender, num))) %10; //pasa un tipo de variable a otra, keccak es un algoritmo de hash(cryptografia); abi.encode junta los 3 parametros y los codifica;
    }
    
    function participar() external payable returns(bool resultado, uint256 numero) { //llamada por los participantes
        require(juego == true); //el juego esta activo mientras no haya un ganador
        require(msg.value == precio); //asegura que el participante pague el precio especificado
        uint256 numUsuario = numeroRandom(); //numero aleatorio que se va a generar para el usuario y llama a la funcion numeroRandom
        bool acierto = comprobarAcierto(numUsuario); //dice si el numero es ganador
        if(acierto == true){
            juego = false;
            msg.sender.transfer(address(this).balance - (num* (precio/2))); //transfiere al ganador el monto acumulado
            ganador = msg.sender;
            resultado = true;
            numero = numUsuario;
        } else {
            num++;
            resultado = false;
            numero = numUsuario;
        }
    }
    
    function verPremio()public view returns(uint256){
        return address(this).balance + (num * (precio/2));
    }
    
    function retirarFondosContrato()external returns(uint256){
        require(msg.sender == owner);
        require(juego == false);
        msg.sender.transfer(address(this).balance);
        return address(this).balance;
    }
    
    
    
}