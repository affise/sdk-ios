@objc
public enum PredefinedObject: Int, Predefined {
    case CONTENT
    
    func value() -> String {
        switch self {
        case .CONTENT: return "affise_p_content"
        }
    }
}