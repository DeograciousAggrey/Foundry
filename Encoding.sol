
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Encoding {

    function encodeNumber() public pure returns(bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns(bytes memory) {
        bytes memory sString = abi.encode("Some string");
        return sString;
    }


     function encodeStringPacked() public pure returns(bytes memory) {
        bytes memory sString = abi.encodePacked("Some string");
        return sString;
    }

    function encodeStringBytes() public pure returns(bytes memory) {
        bytes memory sString = bytes("Some string");
        return sString;
    }

    function decodeString() public pure returns(string memory) {
        string memory someString = abi.decode(encodeString(),(string));
        return someString;
    }

}