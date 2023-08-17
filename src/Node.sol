// SPDX-License-Identifier: MIT
pragma solidity =0.8.20;

contract Node {
    address parent;

    address[] children;

    // frozen boolean (so nobody can change it)
    bool frozen;

    constructor(address _parent) {
        parent = _parent;
    }

    modifier freezable() {
        require(!frozen, 'Node is frozen');
        _;
    }

    function getChild(uint256 _index) external view returns (address) {
        return children[_index];
    }

    // nobody is stealing these trees, so don't worry about access
    function addChild(address _child) external freezable {
        children.push(_child);
    }

    function removeChild(uint256 _index) external freezable {
        uint256 lastChildIndex = children.length - 1;

        // replace the last child if necessary
        if (_index < lastChildIndex) {
            children[_index] = children[_index];
        }

        // pop the array
        children.pop();
    }

    // irreversible function: freeze
    function freeze() external {
        frozen = true;
    }
}
