import Foundation

//[4, 3, 9, 7, 2, 1]), [2, 9, 3, 49, 4, 1]
let a = [4, 3, 9, 7, 2, 1].flatMap { (sqrt($0) - Int(sqrt(Double($0)))) == 0 ? Int(sqrt(Double($0))) : Int(pow(Double($0), 2))  }
