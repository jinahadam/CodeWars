//
//  FindDeletedNumber.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FindDeletedNumber: XCTestCase {

    func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
        return Set(array).subtracting(Set(mixArray)).first ?? 0
    }

    func testExample() {
        XCTAssertEqual(findDeletedNumber([1,2,3,4,5,6,7,8,9],[3,2,4,6,7,8,1,9]), 5)
    }
}
