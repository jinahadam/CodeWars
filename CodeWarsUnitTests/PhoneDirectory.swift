//
//  PhoneDirectory.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 7/3/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class PhoneDirectory: XCTestCase {

    func regexMatch(pattern: String, str: String, _ capture: Int = 0, seperator: String = "") -> String {
        return try! NSRegularExpression(pattern: pattern, options: [])
            .matches(in: str, options: [], range: NSRange(location: 0, length: str.utf16.count))
            .map { NSString(string: str).substring(with: $0.range(at: capture)) as String }
            .joined(separator: seperator)
    }

    struct Address: CustomStringConvertible {
        var name: String
        var number: String
        var address: String

        var description: String {
            return "Phone => \(number), Name => \(name), Address => \(address)"
        }
    }

    func parseLine(_ dr: String) -> [Address] {
        var returnValue = [Address]()
        let pattern = "((\\w|\\s|-|<|>|_|'|\\.)+)"
        let numPattern = "(\\d{1,2}-\\d{3}-\\d{3}-\\d{4})"
        let namePattern = "<((.)+)>"
        let spacePattern = "\\S+((?!\\s{2}).)+"
        let lines = dr.components(separatedBy:"\n").map { String($0) }
        for line in lines {
            let cleanedStr = regexMatch(pattern: pattern, str: line)
            let number = regexMatch(pattern: numPattern, str: cleanedStr)
            let nameExtra = regexMatch(pattern: namePattern, str: cleanedStr)
            let name = regexMatch(pattern: namePattern, str: cleanedStr, 1)
            var address = cleanedStr.replacingOccurrences(of: number, with: "")
                                    .replacingOccurrences(of: nameExtra, with: "")
                                    .replacingOccurrences(of: "_", with: " ")
                                    .trimmingCharacters(in: .whitespacesAndNewlines)

            address = regexMatch(pattern: spacePattern, str: address, 0, seperator: " ")
            returnValue.append(Address(name: name, number: number, address: address))
        }
        return returnValue
    }

    func phone(_ strng: String, _ num: String) -> String {
        let addresses = parseLine(strng).filter { $0.number == num }
        if addresses.count == 0 { return "Error => Not found: \(num)" }
        if addresses.count > 1 { return "Error => Too many people: \(num)" }
        return addresses.first!.description
    }

    let dr = "/+1-541-754-3010 156 Alphand_St. <J Steeve>\n 133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010\n"
        + "+1-541-984-3012 <P Reed> /PO Box 530; Pollocksville, NC-28573\n :+1-321-512-2222 <Paul Dive> Sequoia Alley PQ-67209\n"
        + "+1-741-984-3090 <Peter Reedgrave> _Chicago\n :+1-921-333-2222 <Anna Stevens> Haramburu_Street AA-67209\n"
        + "+1-111-544-8973 <Peter Pan> LA\n +1-921-512-2222 <Wilfrid Stevens> Wild Street AA-67209\n"
        + "<Peter Gone> LA ?+1-121-544-8974 \n <R Steell> Quora Street AB-47209 +1-481-512-2222\n"
        + "<Arthur Clarke> San Antonio $+1-121-504-8974 TT-45120\n <Ray Chandler> Teliman Pk. !+1-681-512-2222! AB-47209,\n"
        + "<Sophia Loren> +1-421-674-8974 Bern TP-46017\n <Peter O'Brien> High Street +1-908-512-2222; CC-47209\n"
        + "<Anastasia> +48-421-674-8974 Via    Quirinal   Roma\n <P Salinger>   Main Street, +1-098-512-2222, Denver\n"
        + "<C Powel> *+19-421-674-8974 Chateau des Fosses Strasbourg F-68000\n <Bernard Deltheil> +1-498-512-2222; Mount Av.  Eldorado\n"
        + "+1-099-500-8000 <Peter Crush> Labrador Bd.\n +1-931-512-4855 <William Saurin> Bison Street CQ-23071\n"
        + "<P Salinge> Main Street, +1-098-512-2222, Denve\n"
        + "/+5-541-754-3010 156 Alphandria_Street. <Jr Part>\n 1333, Green, Road <F Fulgur> NW-46423 ;+6-541-914-3010!\n"
        + "+5-541-984-3012 <Peter Reeves> /PO Box 5300; Albertville, SC-28573\n :+5-321-512-2222 <Paulo Divino> Boulder Alley ZQ-87209\n"
        + "+3-741-984-3090 <F Flanaghan> _Chicago Av.\n :+3-921-333-2222 <Roland Scorsini> Bellevue_Street DA-67209\n"
        + "+8-111-544-8973 <Laurence Pantow> SA\n +8-921-512-2222 <Raymond Stevenson> Joly Street EE-67209\n"
        + "<John Freeland> Mantow ?+2-121-544-8974 \n <Robert Mitch> Eleonore Street QB-87209 +2-481-512-2222?\n"
        + "<Arthur Paternos> San Antonio $+7-121-504-8974 TT-45121\n <Ray Charles> Stevenson Pk. !+7-681-512-2222! CB-47209,\n"
        + "<JP Gorce> +9-421-674-8974 New-Bern TP-16017\n <P McDon> Revolution Street +2-908-512-2222; PP-47209\n"
        + "<Elizabeth Corber> +8-421-674-8974 Via Papa Roma\n <C Saborn> Main Street, +15-098-512-2222, Boulder\n"
        + "<Colin Marshall> *+9-421-674-8974 Edinburgh UK\n <Bernard Povit> +3-498-512-2222; Hill Av.  Cameron\n"
        + "+12-099-500-8000 <Pete Highman> Ontario Bd.\n +8-931-512-4855 <W Mount> Oxford Street CQ-23071\n"
        + "<Donald Drinkaw> Moon Street, +3-098-512-2222, Peterville\n"

    let s1 = """
                /+1-541-754-3010 156 Alphand_St. <J Steeve>
                133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010
                +1-541-984-3012 <P Reed> /PO Box 530; Pollocksville, NC-28573
                :+1-321-512-2222 <Paul Dive> Sequoia Alley PQ-67209
                +1-741-984-3090 <Peter Reedgrave> _Chicago
                :+1-921-333-2222 <Anna Stevens> Haramburu_Street AA-67209
                +1-111-544-8973 <Peter Pan> LA
                +1-921-512-2222 <Wilfrid Stevens> Wild Street AA-67209
                <Peter Gone> LA ?+1-121-544-8974
                <R Steell> Quora Street AB-47209 +1-481-512-2222
                <Arthur Clarke> San Antonio $+1-121-504-8974 TT-45120
                <Ray Chandler> Teliman Pk. !+1-681-512-2222! AB-47209,
                <Sophia Loren> +1-421-674-8974 Bern TP-46017
                <Peter O'Brien> High Street +1-908-512-2222; CC-47209
                <Anastasia> +48-421-674-8974 Via Quirinal Roma
                <P Salinger> Main Street, +1-098-512-2222, Denver
                <C Powel> *+19-421-674-8974 Chateau des Fosses Strasbourg F-68000
                <Bernard Deltheil> +1-498-512-2222; Mount Av.  Eldorado
                +1-099-500-8000 <Peter Crush> Labrador Bd.
                +1-931-512-4855 <William Saurin> Bison Street CQ-23071
                <P Salinge> Main Street, +1-098-512-2222, Denve
                /+5-541-754-3010 156 Alphandria_Street. <Jr Part>
                1333, Green, Road <F Fulgur> NW-46423 ;+6-541-914-3010!
                +5-541-984-3012 <Peter Reeves> /PO Box 5300; Albertville, SC-28573
                :+5-321-512-2222 <Paulo Divino> Boulder Alley ZQ-87209
                +3-741-984-3090 <F Flanaghan> _Chicago Av.
                :+3-921-333-2222 <Roland Scorsini> Bellevue_Street DA-67209
                +8-111-544-8973 <Laurence Pantow> SA
                +8-921-512-2222 <Raymond Stevenson> Joly Street EE-67209
                <John Freeland> Mantow ?+2-121-544-8974
                <Robert Mitch> Eleonore Street QB-87209 +2-481-512-2222?
                <Arthur Paternos> San Antonio $+7-121-504-8974 TT-45121
                <Ray Charles> Stevenson Pk. !+7-681-512-2222! CB-47209,
                <JP Gorce> +9-421-674-8974 New-Bern TP-16017
                <P McDon> Revolution Street +2-908-512-2222; PP-47209
                <Elizabeth Corber> +8-421-674-8974 Via Papa Roma
                <C Saborn> Main Street, +15-098-512-2222, Boulder
                <Colin Marshall> *+9-421-674-8974 Edinburgh UK
                <Bernard Povit> +3-498-512-2222; Hill Av.  Cameron
                +12-099-500-8000 <Pete Highman> Ontario Bd.
                +8-931-512-4855 <W Mount> Oxford Street CQ-23071
                <Donald Drinkaw> Moon Street, +3-098-512-2222, Peterville
"""

    func testing(_ dr: String, _ num: String, _ expected: String) {
        XCTAssertEqual(phone(dr, num), expected, "should return \(expected)")
    }

    func testExample() {
        testing(dr, "48-421-674-8974", "Phone => 48-421-674-8974, Name => Anastasia, Address => Via Quirinal Roma")
        testing(dr, "19-421-674-8974", "Phone => 19-421-674-8974, Name => C Powel, Address => Chateau des Fosses Strasbourg F-68000")
        testing(s1, "1-908-512-2222", "Phone => 1-908-512-2222, Name => Peter O'Brien, Address => High Street CC-47209")

    }


}
