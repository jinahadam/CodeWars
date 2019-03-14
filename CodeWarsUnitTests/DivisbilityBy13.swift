//
//  DivisbilityBy13.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/3/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class DivisbilityBy13: XCTestCase {

    func reminder(_ n: Int) -> Int {
        let sequence = [1, 10, 9, 12, 3, 4, 1, 10, 9, 12, 3, 4, 1, 10, 9, 12, 3, 4, 1, 10, 9, 12, 3, 4]
        var numbers = [Int]()
        var num = n
        while num != 0 {
            numbers.append(num % 10)
            num /= 10
        }
        return zip(numbers, sequence).map(*).reduce(0,+)
    }

    func thirt(_ n: Int) -> Int {
        var r = reminder(n)
        while r != reminder(r) {
            r = reminder(r)
        }
        return r
    }

    func testequal(_ n: Int, _ expected: Int) {
        XCTAssertEqual(thirt(n), expected)
    }

    func testExample() {
        testequal(8529, 79);
        testequal(85299258, 31)
        testequal(5634, 57)
    }

}

