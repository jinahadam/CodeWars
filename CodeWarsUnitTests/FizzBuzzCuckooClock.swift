//
//  FizzBuzzCuckooClock.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FizzBuzzCuckooClock: XCTestCase {

    func fizzBuzzCuckooClock(_ time: String) -> String {
        let parsedTime = time.split(separator: ":").flatMap { Int($0) }
        switch (parsedTime.first!, parsedTime.last!) {
        case (let hour, 0) where (1...12) ~= hour:
            return Array.init(repeating: "Cuckoo", count: hour).joined(separator: " ")
        case (let hour, 0) where (12...23) ~= hour:
            return Array.init(repeating: "Cuckoo", count: hour - 12).joined(separator: " ")
        case (_, 0):
            return Array.init(repeating: "Cuckoo", count: 12).joined(separator: " ")
        case (_, 30):
            return "Cuckoo"
        case (_, let min) where min % 3 == 0 && min % 5 == 0:
            return "Fizz Buzz"
        case (_, let min) where min % 3 == 0:
            return "Fizz"
        case (_, let min) where  min % 5 == 0:
            return "Buzz"
        default:
            return "tick"
        }
    }

    static let basicTests = [
        ("13:34", "tick"),
        ("21:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo"),
        ("11:15", "Fizz Buzz"),
        ("03:03", "Fizz"),
        ("14:30", "Cuckoo"),
        ("08:55", "Buzz"),
        ("00:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo"),
        ("12:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo")
    ]
    static var allTests = [
        ("Basic Tests", testClock),
        ]

    func testClock() {
        for test in FizzBuzzCuckooClock.basicTests {
            XCTAssertEqual(fizzBuzzCuckooClock(test.0), test.1, "Testing with time \(test.0)")
        }
    }
}
