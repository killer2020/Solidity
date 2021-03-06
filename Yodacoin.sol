
pragma solidity ^0.4.0;

import "browser/ERC20.sol";

contract Yodacoin is ERC20{
    
    string public constant symbol = "YDC";
    string public constant name = "Yodacoin";
    uint8 public constant decimals =18;
    
    uint private constant __totalSupply=1000;
    mapping (address => uint) private __balanceOf;
    mapping (address => mapping(address => uint)) private __allowances;
    
    
    function Yodacoin(){
        __balanceOf[msg.sender]=__totalSupply;
    }
    
    
     function totalSupply() constant returns(uint _totalSupply){
         
         _totalSupply=__totalSupply;
         
     }
     
    function balanceOf(address addr) constant returns(uint balance){
        
        balance = __balanceOf[addr];
        
    }
    
    function transfer(address to,uint amount) returns(bool success){
        
        if(amount>0 && __balanceOf[msg.sender]>=amount)
        {
            __balanceOf[to] += amount;
            __balanceOf[msg.sender] -= amount;
            return true;
        }
        
        return false;
    }
    function transferFrom(address from,address to,uint _amount) returns(bool success){
        
        if( _amount>0 && __allowances[from][msg.sender]>0 
            && __allowances[from][msg.sender]>= _amount 
            && __balanceOf[from]>= _amount) 
        {
            __balanceOf[from] -= _amount;
            __balanceOf[to] += _amount;
            __allowances[from][msg.sender] -= _amount;
            
            return true;
        }
        
        return false;
    }
    function approve(address _spender,uint _value) returns(bool success){
        
        __allowances[msg.sender][_spender] = _value;
        
    }
    function allowance(address owner,address spender) returns(uint remaining){
        
        return __allowances[owner][spender];
    }
    
    
    
}
