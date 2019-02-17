import Foundation


let a = String(String(13, radix: 2, uppercase: false).reversed()).map { "\($0) " }
print(a.joined())
