//
//  SumFractions.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 19/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class SumFractions: XCTestCase {

    func rationalAddition(_ a: (a: Int, b: Int),_ b: (c: Int, d: Int)) -> (Int, Int) {
        return ((a.a * b.d) + (a.b * b.c), a.b * b.d)
    }

    func gcd(_ frac: (Int, Int)) -> Int {
        return frac.1 == 0 ? frac.0 : gcd((frac.1, frac.0 % frac.1))
    }

    func sumFracts(_ l: [(Int, Int)]) -> (Int, Int)? {
       if l.count == 0 { return nil }
       let rational = l.dropFirst().reduce(l[0]) { rationalAddition($0, $1) }
       let factor = gcd(rational)
       return (rational.0/factor, rational.1/factor)
    }

    func testing(_ l: [(Int, Int)], _ expected: (Int, Int)?) {
        XCTAssert(sumFracts(l)! == expected!, "should return \(expected!)")
    }
    func testingNil(_ l: [(Int, Int)]) {
        XCTAssertTrue(sumFracts(l) == nil, "Should return nil")
    }

    func testExample() {
        testing([(1, 2), (1, 3), (1, 4)], (13, 12))
        testing([(1, 3), (5, 3)], (2, 1))
        testingNil([])
        testing([(1, 8), (1, 9)], (17, 72))
    }

}
