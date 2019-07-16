pragma solidity ^0.5.10;

contract SuryToken {
    //name
    string public name = "Sury Token";
    string public symbol = "SURY";
    string public standard = "Sury Token V1.0";
    uint256 public totalSupply;

    event Transfer(
     address indexed _from,
    address indexed _to,
    uint256 _value
    );

    event Approval(
    address indexed _owner,
address indexed _spender,
uint256 _value
    );

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowance;

    function SuryToken (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        // allocate the initial supply
    }
// transfer
    function transfer(address _to, uint256 _value) public returns (bool success) {
// exception if account doesnt have money
require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {

        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
require(_value <= balanceOf[_from]);
require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][]msg.sender] -= _value;

        Transfer(_from, _to, _value);
        return true;
    }
}