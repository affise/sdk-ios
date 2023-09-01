//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Type of touch
 */

@objc
public enum TouchType: Int, CaseIterable, CustomStringConvertible {
    case CLICK
    case WEB_TO_APP_AUTO_REDIRECT
    case IMPRESSION

    public var type: String {
        switch self {
        case .CLICK:
            return "CLICK"
        case .WEB_TO_APP_AUTO_REDIRECT:
            return "WEB_TO_APP_AUTO_REDIRECT"
        case .IMPRESSION:
            return "IMPRESSION"
        }
    }

    public var description: String { type }

    public static func from(_ name: String) -> TouchType? {
        return allCases.first { name == $0.type }
    }
}
