//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Type of touch
 */

@objc
public enum TouchType: Int, CustomStringConvertible {
    case CLICK
    case WEB_TO_APP_AUTO_REDIRECT
    case IMPRESSION

    public var description: String {
        switch self {
        case .CLICK:
            return "CLICK"
        case .WEB_TO_APP_AUTO_REDIRECT:
            return "WEB_TO_APP_AUTO_REDIRECT"
        case .IMPRESSION:
            return "IMPRESSION"
        }
    }
}
