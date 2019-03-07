//
//  HiddenCubes.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 3/3/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class HiddenCubes: XCTestCase {

    func isSumOfCubes(_ s: String) -> String {
        let patter = "(\\d{1,3})"
        let regex = try! NSRegularExpression(pattern: patter, options: NSRegularExpression.Options.caseInsensitive)
        let matches = regex.matches(in: s, options: [], range: NSRange(location: 0, length: s.utf16.count))
        let numbers = matches.map {  NSString(string: s).substring(with: $0.range) as String }
        let cubes = numbers.map { $0.characters.map { Int(String($0))! * Int(String($0))! * Int(String($0))! }.reduce(0,+) }

        var results = [Int]()
        for i in 0..<cubes.count {
            if cubes[i] == Int(numbers[i])! {
                results.append(cubes[i])
            }
        }
        guard results.count != 0 else { return "Unlucky" }
        let cubeNumStrings = results.map { String($0) }.joined(separator: " ")
        let cubeNumSum = results.reduce(0,+)
        return "\(cubeNumStrings) \(cubeNumSum) Lucky"
    }

    func testing(_ s: String, _ expected: String) {
        XCTAssertEqual(isSumOfCubes(s), expected, "should return \(expected)")
    }

    func testExample() {
        testing("Once upon a midnight dreary, while100 I pondered, 9026315weak and weary -827&()", "Unlucky")
        testing("&z _upon 407298a --- ???ry, ww/100 I thought, 631str*ng and w===y -721&()", "407 407 Lucky")
        testing("&z371 upon 407298a --- dreary, ###100.153 I thought, 9926315strong and weary -127&() 1", "371 407 153 1 932 Lucky")
        testing("Once 1000upon a midnight 110dreary, while100 I pondered, 9026315weak and weary -827&()", "0 0 Lucky")
        testing("153000153407000407", "153 0 153 407 0 407 1120 Lucky")
    }



}
