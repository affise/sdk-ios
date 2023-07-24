import Foundation

extension String {
    public func toSnakeCase() -> String? {
        let pattern = "(?<=.)([A-Z]|\\d+)"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: self.count)
        return regex?.stringByReplacingMatches(in: self, range: range, withTemplate: "_$1").lowercased()
    }
}
