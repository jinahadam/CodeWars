//
//  WieghtForWeight.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 20/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class WieghtForWeight: XCTestCase {

    func orderWeight(_ s: String) -> String {
        return s.components(separatedBy: " ").sorted { (s1, s2) -> Bool in
            let w1 = s1.flatMap { Int(String($0)) }.reduce(0,+)
            let w2 = s2.flatMap { Int(String($0)) }.reduce(0,+)
            if w1 == w2 { return s1 < s2 }
            return w1 < w2
        }.joined(separator: " ")
    }

    func testing(_ s: String, _ expected: String) {
        XCTAssertEqual(orderWeight(s), expected)
    }

    func testExample() {
        testing("103 123 4444 99 2000", "2000 103 123 4444 99")
        testing("2000 10003 1234000 44444444 9999 11 11 22 123",
                "11 11 2000 10003 22 123 1234000 44444444 9999")
        testing("", "")
        testing("10003 1234000 44444444 9999 2000 123456789",
                "2000 10003 1234000 44444444 9999 123456789")
    }
}
