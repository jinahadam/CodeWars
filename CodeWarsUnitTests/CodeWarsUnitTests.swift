//
//  BackwardsPrime.swift
//  CodeWars
//
//  Created by Jinah Adam on 9/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

extension Int {
    func isPrime() -> Bool {
        if self == 2 || self == 3 { return true }
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {
    return (start...stop).filter { number in
        let backwardsInt = Int(String(String(number).characters.reversed()))!
        guard number > 11, backwardsInt > 11, number != backwardsInt else {
            return false
        }

        return number.isPrime() && backwardsInt.isPrime()
    }
}

class SolutionTest: XCTestCase {
    static var allTests = [
        ("backwardsPrime", testExample),
        ]

    func testing(_ start: Int, _ stop: Int, _ expected: [Int]) {
        XCTAssertTrue(backwardsPrime(start, stop) == expected)
    }

    func testExample() {
        var a = [13, 17, 31, 37, 71, 73, 79, 97];
        testing(1, 100, a)
        a = [13, 17, 31];
        testing(1, 31, a)
        a = [107, 113, 149, 157, 167, 179, 199];
        testing(101, 199, a)
        a = [311, 337, 347, 359, 389];
        testing(301, 399, a)
    }
}
