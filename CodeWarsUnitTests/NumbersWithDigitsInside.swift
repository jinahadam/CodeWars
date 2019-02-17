//
//  NumbersWithDigitsInside.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class NumbersWithDigitsInside: XCTestCase {

    func numbersWithDigitInside(_ x: Int, _ d: Int) -> [Int] {
         let range = (1...x).map { String($0) }.filter { $0.contains(String(d)) }.flatMap { Int($0) }
         guard range.count > 0 else { return [0,0,0] }
         return [range.count, range.reduce(0,+), range.reduce(1,*)]
    }

    func testExample() {
        XCTAssertEqual(numbersWithDigitInside(5,6), [0, 0, 0])
        XCTAssertEqual(numbersWithDigitInside(7,6), [1, 6, 6])
        XCTAssertEqual(numbersWithDigitInside(11,1), [3, 22, 110])
        XCTAssertEqual(numbersWithDigitInside(20,0), [2, 30, 200])
        XCTAssertEqual(numbersWithDigitInside(44,4), [9, 286, 5955146588160])
    }

}
