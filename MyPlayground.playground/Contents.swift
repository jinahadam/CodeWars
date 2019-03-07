import Foundation

let s = "&z371 upon 407298a --- dreary, ###100.153 I thought, 9926315strong and weary -127&() 1"
s.replacingOccurrences(of: "(\\d{3})", with: "", options: [.regularExpression, .caseInsensitive], range: nil)

let patter = "(\\d+)"
var numbers = [String]()
do {
    let regex = try NSRegularExpression(pattern: patter, options: NSRegularExpression.Options.caseInsensitive)
    let matches = regex.matches(in: s, options: [], range: NSRange(location: 0, length: s.utf16.count))

    for match in matches {
        let range = match.range(at:1)
        if let swiftRange = Range(range, in: s) {
            let name = s[swiftRange]
            print(name.prefix(3))
            numbers.append(String(name.prefix(3)))
        }
    }
} catch {}

let cubes = numbers.map { $0.characters.map { Int(String($0))! * Int(String($0))! * Int(String($0))! }.reduce(0,+) }

var results = [Int]()
for i in 0..<cubes.count {
    if String(cubes[i]) == numbers[i] {
        results.append(cubes[i])
    }
}
print(results)

