@objc
internal enum InternalEventName: Int {
    case SESSION_START
    
    var eventName: String {
        switch self {
        case .SESSION_START: return "SessionStart"
        }
    }
}

extension InternalEventName: CaseIterable {
    static func from(_ name: String) -> InternalEventName? {
        return allCases.first { name == $0.eventName }
    }
}
