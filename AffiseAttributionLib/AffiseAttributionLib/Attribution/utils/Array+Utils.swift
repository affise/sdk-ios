import Foundation

extension Array where Element == [String: AnyObject] {
    func toFlatList() -> [(String, Any?)] {
        return self.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
    }

    func toListOfList() -> [[(String, Any?)]]  {
        return self.map { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
    }
}

extension Array where Element: AnyObject {
    func toAnyList() -> [Any]  {
        return self.map { value in
            return  value as Any
        }
    }
}