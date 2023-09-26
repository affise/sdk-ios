public func timestamp() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}
