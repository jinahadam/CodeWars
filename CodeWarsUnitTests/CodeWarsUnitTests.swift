//
//  BackwardsPrime.swift
//  CodeWars
//
//  Created by Jinah Adam on 9/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {

    func isPrime(_ n: Int) -> Bool {
        for j in Array(2..<n) {
            if n % j == 0  {
                return false
            }
        }
        return true
    }

    func reverseInt(_ n: Int) -> Int {
        return Int(String(String(n).characters.reversed()))!
    }

    func backPrime(_ n: Int) -> Bool {
        let b = reverseInt(n)
        guard n != b else { return false }
        return isPrime(n) && isPrime(b)
    }

    return Array(start...stop).filter { backPrime($0) }
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
