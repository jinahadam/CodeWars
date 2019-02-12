//
//  nbDig.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 12/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class nbDig: XCTestCase {

    func nbDig(_ n: Int, _ d: Int) -> Int {
        let kk = (0...n).map { $0 * $0 }
        return kk.flatMap { Array(String($0)) }.filter { $0 == Character(String(d)) }.count

    }

    func testExample() {
        XCTAssertEqual(nbDig(5750, 0), 4700)
        XCTAssertEqual(nbDig(11011, 2), 9481)
        XCTAssertEqual(nbDig(12224, 8), 7733)
        XCTAssertEqual(nbDig(11549, 1), 11905)
    }

}
