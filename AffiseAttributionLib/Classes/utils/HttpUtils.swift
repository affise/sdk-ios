public func isHttpValid(_ responseCode: Int) -> Bool {
    return (200...399).contains(responseCode)
}
