//
//  DigPow.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 18/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class DigPow: XCTestCase {

    func digPow(for number: Int, using power: Int) -> Int {
        var i = power - 1
        let powerSum = "\(number)".characters.flatMap { Int(String($0)) }.map {
            i += 1;
            return Int(pow(Double($0), Double(i)))
            }.reduce(0,+)
        if powerSum < number { return -1 }
        for i in 1..<number * 2 {
            if i * number == Int(powerSum) {
                return i
            }
        }
        return -1
    }

    func testExample() {
        XCTAssertEqual(digPow(for: 89, using: 1), 1)
        XCTAssertEqual(digPow(for: 92, using: 1), -1)
        XCTAssertEqual(digPow(for: 46288, using: 3), 51)
    }

}
