//
//  Wallpaper.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class Wallpaper: XCTestCase {

    func wallpaper(_ l: Double, _  w: Double,_  h: Double) -> String {
        let numbers = ["zero", "one", "two", "three", "four", "five",
                       "six", "seven", "eight", "nine", "ten",
                       "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                       "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
        guard l != 0, w != 0, h != 0 else { return numbers[0] }
        let roomArea = ((l * h) * 2.0) + ((h * w) * 2.0)
        let rollArea = 10.0*(52/100.0)
        return numbers[Int(ceil(roomArea/rollArea * 1.15))]

    }

    func testWallpaper() {
        XCTAssertEqual(wallpaper(4, 3.5, 3), "ten")
        XCTAssertEqual(wallpaper(6.3, 4.5, 3.29), "sixteen")
        XCTAssertEqual(wallpaper(0.0, 2.9, 3.29), "zero")
        XCTAssertEqual(wallpaper(6.3, 5.8, 3.13), "seventeen")
        XCTAssertEqual(wallpaper(0.0, 6.7, 2.81), "zero")
    }

}
