import Cocoa

extension Int {
    func isPrime() -> Bool {
        if self == 2 || self == 3 { return true }
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {
    var returnValue = [Int]()
    for number in Array(start...stop) {
        let backwardsInt = Int(String(String(number).characters.reversed()))!
        guard number > 11, backwardsInt > 11 else { continue }
        guard number != backwardsInt else { continue }

        if number.isPrime() && backwardsInt.isPrime() {
            returnValue.append(number)
        }
    }
    return returnValue
}
print(backwardsPrime(2, 100))
