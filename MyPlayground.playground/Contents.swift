import Foundation

func rationalAddition(_ a: (a: Int, b: Int),_ b: (c: Int, d: Int)) -> (Int, Int) {
    return ((a.a * b.d) + (a.b * b.c), a.b * b.d)
}

func irreducibleForm(_ frac: (Int, Int)) -> (Int, Int) {
    for i in (1...min(frac.0, frac.1)/2).reversed() {
        if frac.0 % i == 0 && frac.1 % i == 0 {
            return (frac.0/i, frac.1/i)
        }
    }
    return frac
}

let a = [(1, 2), (1, 3), (1, 4)]// , (13, 12))

//rationalAddition(rationalAddition(a[0], b: a[1]), b: a[2])


let sum = a.dropFirst().reduce(a[0]) { rationalAddition($0, $1) }
print(irreducibleForm(sum))


