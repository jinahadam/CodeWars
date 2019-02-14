//
//  SumOfMultiples.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class SumOfMultiples: XCTestCase {

    func findSum(_ n: Int) -> Int {
        //3 and 5
        return (0...n).filter { $0 % 3 == 0 || $0 % 5 == 0 }.reduce(0,+)
    }

    func testSum() {
        XCTAssertEqual(findSum(5), 8)
        XCTAssertEqual(findSum(10), 33)
        XCTAssertEqual(findSum(100), 2418)
        XCTAssertEqual(findSum(1000), 234168)
    }

}
