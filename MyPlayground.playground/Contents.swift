import Foundation

let str = "123 Main Street St. Louisville OH 43071"

print(str.components(separatedBy: " ").dropFirst().dropLast(2).joined(separator: " "))

