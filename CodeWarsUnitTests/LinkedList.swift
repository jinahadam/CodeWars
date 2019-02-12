//
//  LinkedList.swift
//  codalityTests
//
//  Created by Jinah Adam on 12/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class LinkedList: XCTestCase {

    class Node {
        var data: Int
        var next: Node?

        init(_ data: Int) {
            self.data = data;
        }
    }

    func push(_ head:Node?, _ data:Int) -> Node {
        let node = Node(data)
        node.next = head
        return node
    }

    func buildOneTwoThree() -> Node {
        return push(push(push(nil, 3), 2), 1)
    }

    func testInsertNode() {
        XCTAssertEqual(push(nil, 1).data, 1, "Should be able to create a new linked list with push().");
        XCTAssertNil(push(nil, 1).next, "Should be able to create a new linked list with push().");
        XCTAssertEqual(push(Node(1), 2).data, 2, "Should be able to prepend a node to an existing node.");
        XCTAssertEqual(push(Node(1), 2).next!.data, 1, "Should be able to prepend a node to an existing node.");
    }

    func testBuildLinkedList() {
        XCTAssertEqual(buildOneTwoThree().data, 1, "Value at index 0 should be 1.");
        XCTAssertEqual(buildOneTwoThree().next!.data, 2, "Value at index 1 should be 2.");
        XCTAssertEqual(buildOneTwoThree().next!.next!.data, 3, "Value at index 2 should be 3.");
        XCTAssertNil(buildOneTwoThree().next!.next!.next, "Value at index 3 should be null.");
    }


}
