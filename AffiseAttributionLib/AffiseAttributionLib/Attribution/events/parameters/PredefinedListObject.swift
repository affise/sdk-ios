@objc
public enum PredefinedListObject: Int, Predefined {
    case CONTENT_LIST
    
    func value() -> String {
        switch self {
        case .CONTENT_LIST: return "affise_p_content_list"
        }
    }
}