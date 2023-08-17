// SPDX-License-Identifier: MIT
pragma solidity =0.8.20;

import {Node} from "./Node.sol";

contract TreeDeployer {
    constructor() {}

    // deploy a new tree
    function deployTree() external returns (address) {
        // create a root node
        Node root = new Node(address(0));

        // add 3 children
        _addChildren(root, 3);

        // add 2 children to the second child
        Node secondChild = Node(root.getChild(1));
        _addChildren(secondChild, 2);

        // add a child to the second child's first
        Node firstGrandchild = Node(secondChild.getChild(0));
        _addChildren(firstGrandchild, 1);

        // return the root address
        return address(root);
    }

    function _addChildren(Node _parentNode, uint256 _amount) internal {
        for (uint256 i = 0; i < _amount;) {
            // add the new node as a child
            _parentNode.addChild(address(new Node(address(_parentNode))));

            unchecked {
                ++i;
            }
        }
    }
}
