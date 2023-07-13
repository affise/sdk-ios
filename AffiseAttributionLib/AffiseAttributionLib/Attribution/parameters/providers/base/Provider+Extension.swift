internal extension Array where Element == Provider {
    func getProvider<T>() -> T? where T : Provider {
        self.first(where: {$0 is T}) as? T
    }

    func mapProviders() -> [(String, Any?)] {
        var result: [(String, Any?)] = []
        let createdTimeProvider: CreatedTimeProvider? = self.getProvider()
        let createdTime  = createdTimeProvider?.provideWithDefault()
        let sortedArray = self.filter{ $0.getKey() != nil}.sorted(by: {$0.getOrder() < $1.getOrder()})
        
        for provider in sortedArray {
            guard let key = provider.getKey() else {
                continue
            }
            let value = provider.getValue(createdTime:createdTime)
            result += [(key, value)]
        }
        return result
    }
}

internal extension Provider {
    func getValue(createdTime: Int64?) -> Any? {
        switch self {
        case is CreatedTimeProvider:
            return createdTime
        case is AffAppTokenPropertyProvider:
            return (self as? AffAppTokenPropertyProvider)?.provideWithParamAndDefault(param: "\(createdTime)")

        case is StringPropertyProvider:
            return (self as? StringPropertyProvider)?.provideWithDefault()
        case is BooleanPropertyProvider:
            return (self as? BooleanPropertyProvider)?.provideWithDefault()
        case is LongPropertyProvider:
            return (self as? LongPropertyProvider)?.provideWithDefault()
        default:
            return nil
        }
    }
}
