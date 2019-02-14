//
//  FunctionTest.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FunctionTest: XCTestCase {

    func always(_ n: Int) -> (() -> Int) {
        return { return n }
    }

    func testAlways() {
        XCTAssertEqual(always(3)(), 3)
    }

    func testRandom() {
        for _ in 0..<10 {
            let num = Int.random(in: 0...100_000)
            XCTAssertEqual(always(num)(), num)
        }
    }
}
