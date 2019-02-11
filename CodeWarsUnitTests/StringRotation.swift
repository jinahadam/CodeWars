//
//  StringRotation.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 11/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class StringRotation: XCTestCase {

    func shiftedDiff(_ s1: String, _ s2: String) -> Int? {
        let start = (s2 + s2).range(of: s1)?.lowerBound
        return start?.encodedOffset
    }

    func testShiftedDiff() {
        XCTAssertEqual(shiftedDiff("coffee","eecoff"), 2, "expected 2")
        XCTAssertEqual(shiftedDiff("eecoff","coffee"), 4, "expected 4")
        XCTAssertEqual(shiftedDiff("isn't","'tisn"), 2, "expected 2")
        XCTAssertEqual(shiftedDiff("Esham","Esham"), 0, "expected 0")
        XCTAssertNil(shiftedDiff("moose","Moose"), "expected nil")
        XCTAssertNil(shiftedDiff("dog","god"), "expected nil")
    }

}
