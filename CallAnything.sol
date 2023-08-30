
// SPDX-License-Identifier: MIT


//In order to call  a function using only the data field of call, we need to encode:
//The function name
//The parameters we want to add
//Down to the binary level

pragma solidity 0.8.19;

contract CallAnything {

    address public s_someAddress;
    uint256 public s_amount;


    function transfer(address someAddress, uint256 amount) public {
        s_someAddress = someAddress;
        s_amount = amount;
    }


    function getSelector1() public pure returns(bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getdataToCallTransfer(address someAddress, uint256 amount) public pure returns(bytes memory) {
        return abi.encodeWithSelector(getSelector1(), someAddress, amount);
    }


    function callFunctionWithBinary(address someAddress, uint256 amount) public returns(bytes4, bool) {
    (bool success, bytes memory returnData) =   address(this).call(
            abi.encodeWithSelector(getSelector1(), someAddress, amount)
        );
        return(bytes4(returnData), success);
    }

}