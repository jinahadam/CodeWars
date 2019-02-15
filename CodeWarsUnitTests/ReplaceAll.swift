//
//  ReplaceAll.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 15/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class ReplaceAll: XCTestCase {

    func replaceAll<T: Equatable>(array: [T], old: T, new: T) -> [T] {
        var returnArray = array
        for i in 0..<array.count {
            if returnArray[i] == old {
                returnArray[i] = new
            }
        }
        return returnArray
    }

    func testExample() {
        XCTAssertEqual(replaceAll(array: [1,2,2], old: 1, new: 2), [2,2,2])
        XCTAssertEqual(replaceAll(array: ["ooh", "la", "la"], old: "la", new: "baby"), ["ooh", "baby", "baby"])
    }


}
