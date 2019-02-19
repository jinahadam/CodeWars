//
//  RevRot.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 18/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class RevRot: XCTestCase {

    func revRot(_ s: String, _ c: Int) -> String {
        guard !s.isEmpty, c != 0, c <= s.characters.count else { return "" }
        var chunks = [[Int]]()
        var start = 0
        var end = c

        var intArray = s.characters.flatMap { Int(String($0)) }

        while end <= s.characters.count {
            let chunk = intArray[start..<end]
            if chunk.count == c {
                chunks.append(Array(chunk))
            }
            start = end
            end += c
        }

        func rot(_ chunk: [Int]) -> String {
            let sum = chunk.map { $0 * $0 * $0 }.reduce(0,+)
            if sum % 2 == 0 {
                return chunk.reversed().map { String($0) }.joined()
            } else {
                return (chunk.suffix(chunk.count - 1) + chunk.prefix(1)).map { String($0) }.joined()
            }
        }

        return chunks.map { rot($0) }.joined()

    }

    func testing(_ s: String, _ c: Int, _ expected: String) {
        XCTAssertEqual(revRot(s, c), expected)
    }

    func testExample() {
        testing("1234", 0, "");
        testing("", 0, "");
        testing("1234", 5, "");
        var s = "733049910872815764";
        testing(s, 5, "330479108928157");
        s = "73304991087281576455176044327690580265896";
        testing(s, 8, "1994033775182780067155464327690480265895");
        s = "73304991087281576455176044327690580265896896028";
        testing(s, 8, "1994033775182780067155464327690480265895");
    }
}
