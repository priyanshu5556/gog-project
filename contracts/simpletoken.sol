
pragma solidity ^0.8.0;

contract SimpleToken {
    // Mapping to store balances of each address
    mapping(address => uint256) public balanceOf;

    // Total supply of the tokens
    uint256 public totalSupply = 10000; // initial token supply

    constructor() payable {
        // Set initial balance for deployer (owner)
        balanceOf[msg.sender] = totalSupply;
    }

    function transferTokens(address _to, uint256 _amount) public {
        require(balanceOf[msg.sender] >= _amount);
        
        balanceOf[_to] += _amount;  // Add amount to recipient's balance
        balanceOf[msg.sender] -= _amount;  // Subtract from sender's balance
        
        emit Transfer(msg.sender, _to, _amount); 
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}
