//
//  AthleticsStats.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 9/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

extension Collection where Iterator.Element == Int {
    func median() -> Element {
        let sortedArray = self.sorted()
        guard count % 2 == 0 else { return sortedArray[count/2] }
        return (sortedArray[count/2] + sortedArray[count/2 - 1]) / 2
    }
}

func parseTime(_ str: String) -> Int {
    let array = str.components(separatedBy: "|").compactMap { Int($0) }
    return array[0] * 60 * 60 + array[1] * 60 + array[2]
}

func stringTime(_ seconds: Int) -> String {
    let format =  "%02d"
    let h = seconds/60/60
    let m = (seconds - (h * 60 * 60)) / 60
    let s = (seconds - (h * 60 * 60)) % 60
    return "\(String(format: format, h))|\(String(format: format, m))|\(String(format: format, s))".trimmingCharacters(in: .whitespacesAndNewlines)
}

func stat(_ strg: String) -> String {
    let secondArray = strg.components(separatedBy: ",").map { parseTime($0) }
    let range = secondArray.max()! - secondArray.min()!
    let average = secondArray.reduce(0,+)/secondArray.count
    let med = secondArray.median()
    return "Range: \(stringTime(range)) Average: \(stringTime(average)) Median: \(stringTime(med))"
}

class AthleticsStats: XCTestCase {
    static var allTests = [
        ("stat", testExample),
        ]

    func dotest(_ s: String, _ expected: String) {
        XCTAssertEqual(stat(s), expected, "should return \(expected)")
    }

    func testExample() {

        var l = "01|15|59,01|47|16,01|17|20,01|32|34,02|17|17";
        var sol = "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34"
        dotest(l,sol);

        l = "02|15|59,02|47|16,02|17|20,02|32|34,02|17|17,02|22|00,02|31|41"
        sol = "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00"
        dotest(l,sol);

        l = "02|15|59,02|47|16,02|17|20,02|32|34,02|32|34,02|17|17"
        sol = "Range: 00|31|17 Average: 02|27|10 Median: 02|24|57"
        dotest(l,sol);

    }

}
