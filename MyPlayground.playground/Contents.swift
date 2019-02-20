import Foundation


func sieve(_ numbers: [Int]) -> [Int] {
    if numbers.isEmpty { return [] }
    let p = numbers.first!
    let rest = numbers[1..<numbers.count]
    return [p] + sieve(rest.filter { $0 % p > 0 })
}

func step(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
    let primes = sieve(Array(2...n)).filter { $0 > m }
    if g > (primes[primes.count - 1] - primes[0]) { return nil }
    if primes.count > 2 {
        for i in (0..<primes.count) {
            if let first = primes.first(where: { $0 - primes[i] == g }) {
                return (primes[i], first)
            }
        }
    }
    return nil
}


 step(30000,2000,3000)
