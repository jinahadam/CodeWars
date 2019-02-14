//
//  StringyStrings.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class StringyStrings: XCTestCase {

    func stringy(_ size: Int) -> String {
        return Array(0..<size).map { String(($0 % 2 == 0) ? "1" : "0") }.joined()
    }


    func testExample() {
        XCTAssertEqual(stringy(1), "1")
        XCTAssertEqual(stringy(2), "10")
        XCTAssertEqual(stringy(3), "101")
    }

}
