//
//  FindTheSmallest.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 23/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FindTheSmallest: XCTestCase {

    func smallest(_ n: Int) -> (Int, Int, Int) {
        var intArray = "\(n)".characters.flatMap { Int(String($0)) }
        var smallest = Int.max
        var i = -1
        var j = 0
        for k in (0..<intArray.count) {
            if intArray[k] <= smallest {
                smallest = intArray[k]
                i = k
            }
        }
        
        for m in (0..<intArray.count) {
            if m == i { continue }
            if intArray[m] < smallest {
                j = m + 1
            }
        }
        intArray.remove(at: i)
        intArray.insert(smallest, at: j)
        if i == 1 && j == 0 { (i,j) = (j, i) }

        return (Int(intArray.map { "\($0)" }.joined())!,i,j)
    }

    func dotest(_ n: Int, _ expected: (Int, Int, Int)) {
        let ans = smallest(n)
        XCTAssertTrue(ans == expected, "should return \(expected) but got \(ans)")
    }

    func testExample() {
        dotest(935855753, (358557539, 0, 8))
        dotest(187863002809, (18786300289, 10, 0))
        dotest(209917, (29917, 0, 1))
        dotest(261235, (126235, 2, 0))
        dotest(209917, (29917, 0, 1))
        dotest(285365, (238565, 3, 1))
        dotest(269045, (26945, 3, 0))
        dotest(296837, (239687, 4, 1))
    }


}
