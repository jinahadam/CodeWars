//
//  HowManyPizzas.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 20/3/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class HowManyPizzas: XCTestCase {

    func howManyPizzas(_ n: Int) -> String {
        let area8 = Double.pi * pow((8/2), 2)
        let areaN = Double.pi * pow((Double(n)/2), 2)
        let slices = areaN/area8 == floor(areaN/area8) ? 0 : round(areaN.truncatingRemainder(dividingBy: area8)/area8 * 8)
        return "pizzas: \(Int(floor(areaN / area8))), slices: \(Int(slices))"
    }

    func testPizzas() {
        XCTAssertEqual(howManyPizzas(7592), "pizzas: 900601, slices: 0")
        XCTAssertEqual(howManyPizzas(16), "pizzas: 4, slices: 0")
        XCTAssertEqual(howManyPizzas(12), "pizzas: 2, slices: 2")
        XCTAssertEqual(howManyPizzas(8), "pizzas: 1, slices: 0")
        XCTAssertEqual(howManyPizzas(6), "pizzas: 0, slices: 5")
        XCTAssertEqual(howManyPizzas(0), "pizzas: 0, slices: 0")
    }

}
