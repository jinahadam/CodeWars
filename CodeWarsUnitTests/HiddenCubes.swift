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
        let patter = "(\\d+)"
        var numbers = [String]()
        do {
            let regex = try NSRegularExpression(pattern: patter, options: NSRegularExpression.Options.caseInsensitive)
            let matches = regex.matches(in: s, options: [], range: NSRange(location: 0, length: s.utf16.count))

            for match in matches {
                let name = NSString(string: s).substring(with: match.range) as String
                let prefixIndex = name.index(name.startIndex, offsetBy: name.utf16.count <= 3 ? name.utf16.count : 3)
                let prefix = String(name.prefix(upTo: prefixIndex)) // Hello
                numbers.append(prefix)
            }
        } catch {}

        let cubes = numbers.map { $0.characters.map { Int(String($0))! * Int(String($0))! * Int(String($0))! }.reduce(0,+) }

        var results = [Int]()
        for i in 0..<cubes.count {
            if String(cubes[i]) == numbers[i] {
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
    }



}
