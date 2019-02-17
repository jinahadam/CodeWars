//
//  FunctionalAddition.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FunctionalAddition: XCTestCase {
    func add(_ n: Int) -> ((Int) -> Int) {
        return { x in
            n + x
        }
    }

    func testExample() {
        XCTAssertEqual(add(1)(3), 4, "add(1)(3) does not equal 4")
        XCTAssertEqual(add(2)(2), 4, "add(2)(2) does not equal 4")
        XCTAssertEqual(add(0)(-15), -15, "add(0)(-15)")
        XCTAssertEqual(add(10)(3), 13, "add(10)(3) does not equal 13")
        XCTAssertEqual(add(100)(23), 123, "add(100)(23) does not equal 123")
    }

}
