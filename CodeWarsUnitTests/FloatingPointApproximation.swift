//
//  FloatingPointApproximation.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 17/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class FloatingPointApproximation: XCTestCase {

    func f(_ x: Double) -> Double {
        let decimal = NSDecimalNumber(floatLiteral: x)
        print(decimal)
        return pow(x + Double(1), 0.5) - Double(1)
    }

    func dotest(_ x: Double, _ expected: Double) {
        assertFuzzyEquals(f(x), expected)
    }

    func assertFuzzyEquals(_ actu: Double, _ expe: Double) {
        var inrange: Bool; let merr: Double = 1e-10; var e: Double;
        if expe == 0.0
        {e = abs(actu)}
        else
        {e = abs((actu - expe) / expe)}
        inrange = (e <= merr)
        if inrange == false {
            print(String(format:"Expected should be near: %.12f", expe));
            print(String(format:"but got: %.12f", actu))
        }
        else {print("..... GOOD")}
        XCTAssertEqual(inrange, true)
    }

    func testExample() {
        dotest(2.6e-08, 1.29999999155e-08)
        dotest(1.4e-09, 6.999999997549999e-10)
        dotest(5.0e-06, 2.499996875007812e-06)
    }

}
