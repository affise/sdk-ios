import AffiseAttributionLib

internal extension Array where Element == AffiseKeyValue {
    func toListOfMap() -> [[String:Any?]] {
        var result: [[String:Any?]] = []
        for item in self {
            result.append(
                [
                    "key": item.key,
                    "value": item.value
                ]
            )
        }
        return result
    }
}
