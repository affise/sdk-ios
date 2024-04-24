import Foundation


internal extension String {
    func toJsonMap() -> [String: Any?]? {
        do {
            //Create json
            return try JSONSerialization.jsonObject(with: (self).data(using: .utf8)!, options: .mutableContainers) as? [String: Any?]
        } catch {
            debugPrint(error)
            return nil
        }
    }
}

