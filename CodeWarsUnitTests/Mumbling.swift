//
//  Mumbling.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 11/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class Mumbling: XCTestCase {

    func accum(_ s: String) -> String {
        var returnValue = [String]()
        for i in 0..<s.characters.count {
            let section = String(Array(repeating: Array(s.characters)[i], count: i + 1))
            returnValue.append(section.capitalized)

        }
        return returnValue.joined(separator: "-")
    }
    func testAccum1() {
        XCTAssertEqual(accum("RqaEzty"), "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy")
         XCTAssertEqual(accum("cwAt"), "C-Ww-Aaa-Tttt")
         XCTAssertEqual(accum("abcd"), "A-Bb-Ccc-Dddd")
    }




}
