import Cocoa


var b = [1,2,3,4]

//let count = a.count - 1
//for i in 0..<a.count - 1 {
//    if i == a.count/2 { break }
//    print(i, count - i)
//}

let a = [1,2,3,4]
let a1 = zip(a[0..<a.count/2], a[a.count/2..<a.count].reversed())
var folded = a1.map { $0 + $1 }
print(folded)
if a.count % 2 != 0 {
    let extra = a[a.count/2]
    folded.append(extra)
    print(folded)
}
