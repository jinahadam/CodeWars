//
//  SquaredCompare.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 19/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class SquaredCompare: XCTestCase {

    func comp(_ a: [Int], _ b: [Int]) -> Bool {
        if a.count == 0 && b.count == 0 { return true }
        print(b.sorted().map { Int(sqrt(Double(abs($0)))) }, "====", a.map { abs($0) }.sorted())
        return b.sorted().map { Int(sqrt(Double(abs($0)))) } == a.map { abs($0) }.sorted()
    }

    func testing(_ a: [Int], _ b: [Int], _ expected: Bool) {
        XCTAssertTrue(comp(a, b) == expected, "should return \(expected)")
    }

    func testExample() {
        var a1 = [121, 144, 19, 161, 19, 144, 19, 11];
        var a2 = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19];
        testing(a1, a2, true);
        a1 = [121, 144, 19, 161, 19, 144, 19, 11];
        a2 = [11*21, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19];
        testing(a1, a2, false);
        a1 = [-121, -144, 19, -161, 19, -144, 19, -11]
        a2 = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
        testing(a1, a2, true);
    }


}
