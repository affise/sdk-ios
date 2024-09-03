import Foundation

@objc
public protocol InternalResult {
    func success(_ result: Any?)
    func error(_ error: String)
    func notImplemented()
}
