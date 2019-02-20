//
//  StepsInPrime.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 20/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class StepsInPrime: XCTestCase {

    func sieve(_ numbers: [Int]) -> [Int] {
        if numbers.isEmpty { return [] }
        let p = numbers.first!
        let rest = numbers[1..<numbers.count]
        return [p] + sieve(rest.filter { $0 % p > 0 })
    }

    func step(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
        let primes = sieve(Array(2...n)).filter { $0 > m }
        if primes.count > 2 {
            for i in (0..<primes.count) {
                if let first = primes.first(where: { $0 - primes[i] == g }) {
                    return (primes[i], first)
                }
            }
        }
        return nil
    }

    func testing(_ g: Int, _ m: Int, _ n: Int, _ expected: (Int, Int)?) {
        XCTAssert(step(g, m, n)! == expected!, "should return \(expected!)")
    }
    func testingNil(_ g: Int, _ m: Int, _ n: Int) {
        XCTAssert(step(g, m, n) == nil, "Should return nil")
    }

    func testExample() {
        testing(2,100,110, (101, 103))
        testing(4,100,110, (103, 107))
        testing(6,100,110, (101, 107))
        testing(8,300,400, (359, 367))
        testingNil(2,4900,4919)
    }

}
