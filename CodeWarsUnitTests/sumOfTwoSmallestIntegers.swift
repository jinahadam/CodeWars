//
//  sumOfTwoSmallestIntegers.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 11/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class sumOfTwoSmallestIntegers: XCTestCase {

    func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
       var sortedArray = array.sorted()
       return sortedArray[0] + sortedArray[1]

    }

    func testSums() {
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([5, 8, 12, 18, 22]), 13)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([7, 15, 12, 18, 22]), 19)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([25, 42, 12, 18, 22]), 30)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([1, 8, 12, 18, 5]), 6)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([13, 12, 5, 61, 22]), 17)


        XCTAssertEqual(sumOfTwoSmallestIntegersIn([10, 343445353, 3453445, 3453545353453]), 3453445 + 10)

        XCTAssertEqual(sumOfTwoSmallestIntegersIn([12,12,12,12,12]), 24)



    }

}
