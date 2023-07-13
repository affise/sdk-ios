@objc
public enum PredefinedListString: Int, Predefined {
    case CONTENT_IDS
    
    func value() -> String {
        switch self {
        case .CONTENT_IDS: return  "affise_p_content_ids"
        }
    }
}