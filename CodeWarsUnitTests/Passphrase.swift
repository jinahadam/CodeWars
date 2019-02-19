//
//  Passphrase.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 19/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class Passphrase: XCTestCase {

    func playPass(_ s: String, _ n: Int) -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)

        func shitLetter(str: String, _ n: Int) -> String {
            var idx = alphabet.index(of: Character(str))!
            if idx + n >= alphabet.count {
                idx = abs(alphabet.count - (idx + n))
            } else { idx += n }
            return "\(alphabet[idx])"
        }

        func parseletter(_ c: String) -> String {
            var result = c
            if alphabet.contains(Character(c)) {
                result = shitLetter(str: c, n)
            }
            if let num = Int(c) {
                result = "\(abs(num - 9))"
            }

            return result
        }

        var step1To3 = s.characters.map { parseletter("\($0)") }

        for (idx, val) in step1To3.enumerated() {
            if idx % 2 == 0 {
                step1To3[idx] = val.uppercased()
            } else {
                step1To3[idx] = val.lowercased()
            }
        }

        return step1To3.reversed().joined()
    }

    func dotest(_ s: String, _ n: Int, _ expected: String) {
        XCTAssertEqual(playPass(s, n), expected, "should return \(expected)")
    }

    func testExample() {
        dotest("I LOVE YOU!!!", 1, "!!!vPz fWpM J");
        dotest("I LOVE YOU!!!", 0, "!!!uOy eVoL I");
        dotest("AAABBCCY", 1, "zDdCcBbB");
        dotest("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2,
               "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO");
    }

}
