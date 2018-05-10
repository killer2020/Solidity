pragma solidity ^0.4.0;

interface ERC20 {
    
    function totalSupply() constant returns(uint _totalSupply);
    function balanceOf( address addr) constant returns(uint balance);
    function transfer(address to,uint amount) returns(bool success);
    function transferFrom(address from,address to,uint amount) returns(bool success);
    function approve(address _spender,uint value) returns(bool success);
    function allowance(address owner,address spender) returns(uint remaining);
    
    event Transfer(address indexed _from,address indexed _value,uint value);
    event Approve(address indexed _owner,address indexed _spender,uint value);
}
