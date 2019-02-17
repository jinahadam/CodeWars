//
//  EuclideanDistance.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class EuclideanDistance: XCTestCase {

    func euclideanDistanceBetween(_ point1: [Double], and point2: [Double]) -> Double {
        let divisor = pow(10, 2.0)
        let distance = sqrt(zip(point1, point2).map(-).map { $0 * $0 }.reduce(0,+))
        return round(distance * divisor)/divisor
    }

    func testOne() {
        XCTAssertEqual(euclideanDistanceBetween([-1], and: [2]), 3.0)
        XCTAssertEqual(euclideanDistanceBetween([-1, 2], and: [2, 4]), 3.61)
        XCTAssertEqual(euclideanDistanceBetween([-1, 2, 5], and: [2, 4, 9]), 5.39)
    }

}
