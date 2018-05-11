pragma solidity ^0.4.0;


contract TransferEtherTo{
    
    function () public payable {
        
    }

    
    function getBalance() public returns(uint)
    {
        return address(this).balance;
        
    }
 
}

contract TransferEtherFrom{
    
    TransferEtherTo private _instance;
    
    function TransferEtherFrom() public
    {
        _instance = new TransferEtherTo();
    }
    
    function getBalance() public returns(uint)
    {
        return address(this).balance;
    }
    
    
    function getInstanceBalance() public returns(uint)
    {
        return address(_instance).balance;
    }
    
    function () public payable
    {
        address(_instance).send(msg.value);
    }
}
