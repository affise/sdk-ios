import Foundation


@objc
public class AffiseKeyValue: NSObject {
    
    public override var description: String { "key=\(key), value=\(value ?? "")" }
    
    public let key: String
    public let value: String?

    init(_ key: String, _ value: String?) {
        self.key = key
        self.value = value
    }
}
