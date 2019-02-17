import Foundation


let a = NSDecimalNumber(floatLiteral: 14.5123123123123123)
let scale = NSDecimalNumberHandler(roundingMode: .plain, scale: 5, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
a.rounding(accordingToBehavior: scale)

