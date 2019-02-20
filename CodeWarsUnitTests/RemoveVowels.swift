//
//  RemoveVowels.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 20/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class RemoveVowels: XCTestCase {

    func disemvowel(_ s: String) -> String {
        let vowels = ["a","e","i","o", "u"]
        return String(s.characters.filter { !vowels.contains(String($0).lowercased()) })
    }

    func testBsasicTests() {
        XCTAssertEqual("Ths wbst s fr lsrs LL!", disemvowel("This website is for losers LOL!"))
        XCTAssertEqual("N ffns bt,\nYr wrtng s mng th wrst 'v vr rd", disemvowel("No offense but,\nYour writing is among the worst I've ever read"))
        XCTAssertEqual("Wht r y,  cmmnst?", disemvowel("What are you, a communist?"))
    }

}
