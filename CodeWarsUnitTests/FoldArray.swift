//
//  FoldArray.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 11/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FoldArray: XCTestCase {

    func foldArray(_ arr: [Int], times: Int) -> [Int] {
        if times == 0 { return arr }
        var folded = zip(arr[0..<arr.count/2], arr[arr.count/2..<arr.count].reversed()).map { $0 + $1 }
        if arr.count % 2 != 0 {
            folded.append(arr[arr.count/2])
        }
        return foldArray(folded, times: times - 1)
    }

    func testFolding() {
        assert(foldArray([2], times: 1) == [2])
        assert(foldArray([1,2,3,4,5], times: 2) == [9,6])
        XCTAssertEqual(foldArray([1,2,3,4,5], times: 1), [6,6,3], "\(foldArray([1,2,3,4,5], times: 1)) != \([6,6,3])")
        XCTAssertEqual(foldArray([6,6,3], times: 1), [9,6], "\(foldArray([6,6,3], times: 1)) != \([9,6])")
        XCTAssertEqual(foldArray([9,6], times: 1), [15], "\(foldArray([9,6], times: 1)) != \([15])")
        XCTAssertEqual(foldArray([-9,9,-8,8,66,23], times: 1), [14,75,0], "\(foldArray([1,2,3,4,5], times: 1)) != \([6,6,3])")

    }

}
