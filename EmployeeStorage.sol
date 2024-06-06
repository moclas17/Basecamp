// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract EmployeeStorage{
   
    uint private shares;
    string public name;
    uint private salary;
    uint public idNumber;
    
    error TooManyShares(uint _share);
    
    constructor(uint _shares, string memory _name, uint _salary, uint _idNumber){
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _idNumber;

    }

    function viewSalary() public view returns(uint){
        return salary;
    }
    function viewShares() public view returns(uint){
        return shares;
    }

    function grantShares(uint _newShare) public{
        if(_newShare > 5000 ){
            revert("Too many shares");
        }

        if( _newShare+shares > 5000 ){
            revert TooManyShares(_newShare+shares);
        }
        shares += _newShare;
    }
    
    /**
    * Do not modify this function.  It is used to enable the unit test for this pin
    * to check whether or not you have configured your storage variables to make
    * use of packing.
    *
    * If you wish to cheat, simply modify this function to always return `0`
    * I'm not your boss ¯\_(ツ)_/¯
    *
    * Fair warning though, if you do cheat, it will be on the blockchain having been
    * deployed by your wallet....FOREVER!
    */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
        shares = 1000;
    }
}

