//
//  ChooseBestSum.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 11/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class ChooseBestSum: XCTestCase {

    

    func combinations(_ n: [Int], k: Int) -> [[Int]] {
        if k == 0 { return [n] }

        guard !n.isEmpty, k != 0 else { return [] }
        guard k != 1 else { return n.map { [$0] } }

        var returnValue = [[Int]]()

        let head = n[0]
        let tail = Array(n.suffix(from: 1))
        let subcombinations = combinations(tail, k: k - 1)

        returnValue += subcombinations.map { [head] + $0 }
        returnValue += combinations(tail, k: k)

        return returnValue
    }

    func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
        
        let townsDistances = combinations(ls, k: k).map { $0.reduce(0,+) }.sorted().reversed()
        return townsDistances.first(where: { ($0 <= t ) } ) ?? -1
    }

    func testing(_ t: Int, _ k: Int, _ ls: [Int], _ expected: Int) {
        let ans = chooseBestSum(t, k, ls)
        XCTAssertEqual(ans, expected, "should return \(expected), got \(ans)")
    }

    func testExample() {
        var ts = [50, 55, 56, 57, 58]
        testing(163, 3, ts, 163)
        ts = [50]
        testing(163, 3, ts, -1)
        ts = [91, 74, 73, 85, 73, 81, 87]
        testing(230, 3, ts, 228)
        testing(331, 2, ts, 178)
        testing(331, 4, ts, 331)
    }

}
