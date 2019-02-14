//
//  Bmi.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class Bmi: XCTestCase {

    func bmi(_ weight: Int, _ height: Double) -> String {
        switch (Double(weight)/pow(height, 2)) {
            case 0...18.5: return "Underweight"
            case 18.5...25.0: return "Normal"
            case 25.0...30.0: return "Overweight"
            default: return "Obese"
        }
    }

    func testBMI() {
        XCTAssertEqual("Underweight", bmi(50, 1.80))
        XCTAssertEqual("Normal", bmi(80, 1.80))
        XCTAssertEqual("Overweight", bmi(90, 1.80))
        XCTAssertEqual("Obese", bmi(110, 1.80))
        XCTAssertEqual("Normal", bmi(50, 1.50))
    }

}
