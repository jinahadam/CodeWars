//
//  NDigit.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class NDigit: XCTestCase {

    func findDigit(_ num:Int, _ nth: Int) -> Int {
        let numbers = String(num).reversed().compactMap { Int(String($0)) }
        guard nth < numbers.count + 1 else { return 0 }
        guard nth > 0 else { return -1 }
        return numbers[nth - 1]
    }

    func testNormalValues() {
        XCTAssertEqual(findDigit(6429, 3), 4);
    }

    func testNumIsNegative() {
        XCTAssertEqual(findDigit(-1234, 2), 3);
    }

    func testNthNotPositive() {
        XCTAssertEqual(findDigit(678998, 0), -1);
    }

}
