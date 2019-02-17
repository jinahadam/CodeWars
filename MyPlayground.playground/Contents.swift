import Foundation


extension String {
    func toJadenCase() -> String {
        return self.components(separatedBy: " ").map { $0.capitalized }.joined(separator: " ")
    }
}

"This is a test".capitalized
