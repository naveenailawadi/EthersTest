// SPDX-License-Identifier: MIT
pragma solidity =0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Node is Ownable {
    address parent;

    mapping(uint256 => address) children;

    constructor(address _parent) Ownable(msg.sender) {
        parent = parent;
    }

    function getChild(uint256 _index) external view returns (address) {
        return children[_index]
    }

    //function setChild()
}
