import Cocoa

let a = [161, 162, 163, 163, 164, 165, 168, 169, 170, 171]
print(a.first(where: { ( $0 <= 163 || $0 == 163 ) }))
