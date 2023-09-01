@objc
public protocol AffiseResult {
    func success(_ result: Any?)
    func error(_ error: String)
    func notImplemented()
}
