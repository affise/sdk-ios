internal enum InternalProperty: Int {
   
    case NONE
   
    var type: String {
        switch self {
        case .NONE: return ""
        }
    }
}
