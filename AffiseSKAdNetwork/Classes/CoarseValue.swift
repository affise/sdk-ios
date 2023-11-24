import Foundation

@objc
public class CoarseValue: NSObject {

    private(set) var value: String
    
    public init(_ value: String) {
        self.value = value
    }
}
