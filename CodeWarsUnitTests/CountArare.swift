//
//  CountArare.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class CountArare: XCTestCase {

    func countArare(_ n: Int) -> String {
        if n == 1 { return "anane" }
        return (Array(repeating: "adak", count: Int(n/2)) + Array(repeating: "anane", count: Int(n % 2))).joined(separator: " ")
    }

    func testExample() {
        XCTAssertEqual(countArare(1), "anane")
        XCTAssertEqual(countArare(2), "adak")
        XCTAssertEqual(countArare(3), "adak anane")
        XCTAssertEqual(countArare(4), "adak adak")
        XCTAssertEqual(countArare(5), "adak adak anane")
    }

}
