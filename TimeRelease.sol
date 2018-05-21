pragma solidity ^0.4.0;

contract TimeRelease{
    
    mapping( address => uint) balance;
    mapping( address => uint) timer;
    mapping( address => uint) created;

    event BalanceEvent(uint); 
    event TransferEvent(uint);
    event EtherLocked(address,uint);
    
    function addEtherToAddress(address _adr, uint _timer) public payable returns(bool)
    {
        if(balance[_adr] == 0 && msg.value > 0 )
        {
            balance[_adr] = msg.value;
            created[_adr] = now;
            timer[_adr] = _timer;
            
            EtherLocked(_adr,msg.value);
            return true;
        }
     
        return false;           
    }
    
    
    function retrieveEther() public returns(bool)
    {
     
       if(balance[msg.sender]>0)
        {
            if((now - created[msg.sender]) > timer[msg.sender])
            {
                TransferEvent(balance[msg.sender]);
                (msg.sender).transfer(balance[msg.sender]);
                delete balance[msg.sender];
                delete timer[msg.sender];
                delete created[msg.sender];
                
                return true;
            }
        }
        
        return false;
    }
    
    function getBalance() public returns(uint)
    {
        BalanceEvent(balance[msg.sender]);
        return balance[msg.sender];
    }
    
    event LogTime (uint);
    function getRemainingTime() public returns(uint)
    {
        LogTime(now);
        if(balance[msg.sender]>0 && now - (created[msg.sender]+timer[msg.sender])>0)
         {
             return now - (created[msg.sender]+timer[msg.sender]);
         }
         
         return 0;
    }
}
