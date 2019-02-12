//
//  LinkedList.swift
//  codalityTests
//
//  Created by Jinah Adam on 12/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

extension String: Error {}

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

    func length(_ head: Node?) -> Int {
        guard var current = head else { return 0 }
        var length = 1

        while let nextNode = current.next {
            length += 1
            current = nextNode
        }

        return length
    }

    func count(_ head: Node?, _ data: Int) -> Int {
        guard var current = head else { return 0 }
        var length = current.data == data ? 1 : 0

        while let nextNode = current.next {
            length += nextNode.data == data ? 1: 0
            current = nextNode
        }

        return length
    }

    func getNth(_ head: Node?, _ index: Int) throws -> Node? {
        guard var current = head else { throw "Linked List no set" }
        guard index != 0 else { return current }

        var idx = 0
        while let nextNode = current.next {
            idx += 1
            if idx == index { return nextNode }
            current = nextNode
        }

        throw "Index not Found"
    }

    func testNode() {

        let list:Node? = buildOneTwoThree()

        XCTAssertEqual(try! getNth(list, 0)?.data, 1)
        XCTAssertEqual(try! getNth(list, 1)?.data, 2)
        XCTAssertEqual(try! getNth(list, 2)?.data, 3)
        XCTAssertThrowsError(try getNth(list, 3))
        XCTAssertThrowsError(try getNth(list, 10))
        XCTAssertThrowsError(try getNth(list, -1))
    }


    func testLength() {

        let list:Node? = buildOneTwoThree()

        XCTAssertEqual(length(nil), 0)
        XCTAssertEqual(length(Node(1)), 1)
        XCTAssertEqual(length(list), 3)
    }

    func testCountWith3ItemList() {
        let list:Node? = buildOneTwoThree()

        XCTAssertEqual(count(list, 1), 1)
        XCTAssertEqual(count(list, 2), 1)
        XCTAssertEqual(count(list, 3), 1)
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
