//
//  TimeStringCorrection.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 15/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class TimeStringCorrection: XCTestCase {

    func correct(_ timeString: String?) -> String? {
        guard let string = timeString else { return nil }
        guard string != "" else { return "" }
        var timeSplits = string.split(separator: ":").flatMap { Int($0) }
        if timeSplits.count != 3 { return nil }

        if timeSplits[2] > 59 {
            timeSplits[1] += Int(ceil(Double(timeSplits[2] - 60)/60.0))
            timeSplits[2] = timeSplits[2] - 60
        }
        if timeSplits[1] > 59 {
            timeSplits[0] += Int(ceil(Double(timeSplits[1] - 60)/60.0))
            timeSplits[1] = timeSplits[1] - 60
        }
        while timeSplits[0] >= 23 {
            timeSplits[0] -= 24
        }
        return timeSplits.flatMap { String(format: "%02d", $0) }.joined(separator: ":")
    }

    func testNil() {
        XCTAssertNil(correct(nil))
    }

    func testEmpty() {
        XCTAssertEqual("", correct(""))
    }

    func testInvalid() {
        XCTAssertNil(correct("001122"))
        XCTAssertNil(correct("00;11;22"))
        XCTAssertNil(correct("0a:1c:22"))
    }

    func testValid() {
        XCTAssertEqual("09:10:01", correct("09:10:01"))
        XCTAssertEqual("12:10:10", correct("11:70:10"))
        XCTAssertEqual("20:40:39", correct("19:99:99"))
        XCTAssertEqual("00:01:01", correct("24:01:01"))
        XCTAssertEqual("04:01:01", correct("52:01:01"))
        XCTAssertEqual("00:00:00", correct("00:00:00"))
        XCTAssertEqual("01:01:01", correct("01:01:01"))
    }

}
