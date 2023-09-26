internal class SdkPlatform {
    static let IOS = "ios"
    static private let REACT = "react"
    static private let FLUTTER = "flutter"
    static private let UNITY = "unity"
    static private var data: String = IOS

    static var info: String {
        get {
            return data
        }
    }

    static func react() {
        data = "\(REACT) \(IOS)"
    }

    static func flutter() {
        data = "\(FLUTTER) \(IOS)"
    }

    static func unity() {
        data = "\(UNITY) \(IOS)"
    }
}
