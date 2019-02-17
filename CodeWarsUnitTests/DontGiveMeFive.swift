//
//  DontGiveMeFive.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class DontGiveMeFive: XCTestCase {

    func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
        return (start...end).filter { !"\($0)".contains(String(5)) }.count
    }

    func testExample() {
        XCTAssertEqual(8, dontGiveMeFive(1,9));
        XCTAssertEqual(12, dontGiveMeFive(4,17));
    }
}
