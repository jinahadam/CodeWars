//
//  StringSquard.swift
//  CodeWarsUnitTests
//
//  Created by Jinah Adam on 14/2/19.
//  Copyright © 2019 Jinah Adam. All rights reserved.
//

import XCTest

class StringSquard: XCTestCase {

    func horMirror(_ s: String) -> String {
        return s.components(separatedBy: "\\n").reversed().joined(separator: "\\n")
    }

    func vertMirror(_ s: String) -> String {
        return s.components(separatedBy: "\\n").map{ String($0.characters.reversed()) }.joined(separator: "\\n")
    }

    func oper(_ sFunc: ((_ s: String) -> String), _ s: String) -> String {
        return sFunc(s)
    }


    func testing1(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(horMirror, s), expected)
    }

    func testing2(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(vertMirror, s), expected)
    }

    func testExample1() {
        testing1("lVHt\nJVhv\nCSbg\nyeCt", "yeCt\nCSbg\nJVhv\nlVHt")
        testing1("njMK\ndbrZ\nLPKo\ncEYz", "cEYz\nLPKo\ndbrZ\nnjMK")
        testing1("QMxo\ntmFe\nWLUG\nowoq", "owoq\nWLUG\ntmFe\nQMxo")
        testing1("FYvi\ndZQn\nuGef\nQoSy", "QoSy\nuGef\ndZQn\nFYvi")

    }
    func testExample2() {
        testing2("hSgdHQ\nHnDMao\nClNNxX\niRvxxH\nbqTVvA\nwvSyRu", "QHdgSh\noaMDnH\nXxNNlC\nHxxvRi\nAvVTqb\nuRySvw")
        testing2("IzOTWE\nkkbeCM\nWuzZxM\nvDddJw\njiJyHF\nPVHfSx", "EWTOzI\nMCebkk\nMxZzuW\nwJddDv\nFHyJij\nxSfHVP")
        testing2("cuQW\nxOuD\nfZwp\neqFx", "WQuc\nDuOx\npwZf\nxFqe")
        testing2("CDGIdolo\nUstXfrIg\ntMqjvxWL\nBEyuCnAm\nxsxaEERa\nxZsvOiZS\nLutlBRXE\ntxshhbqE",
                 "olodIGDC\ngIrfXtsU\nLWxvjqMt\nmAnCuyEB\naREEaxsx\nSZiOvsZx\nEXRBltuL\nEqbhhsxt")

    }





}
