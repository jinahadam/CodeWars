import Foundation

let area8 = Double.pi * pow((8/2), 2)
let areaN = Double.pi * pow((Double(7592)/2), 2)
areaN/area8
floor(areaN/area8)
let slices = areaN/area8 == floor(areaN/area8) ? 0 : round(areaN.truncatingRemainder(dividingBy: area8)/area8 * 8)
print(slices)

