import Foundation

/**
 * Implementation of [Converter]
 *
 * Converts uri string to [Uri], extracting deeplink from uri parameter
 */
class InstallReferrerToDeeplinkUriConverter : Converter {
    
    private static let DEEPLINK_PARAM_NAME = "deeplink"
    
    typealias T = String
    typealias R = URL?
    
    func convert(from: String) -> URL? {
        return extractDeeplinkFromAbsolute(from) ?? extractDeeplinkFromRelative(from)
    }

    private func extractDeeplinkFromRelative(_ from: String) -> URL? {
        return extractDeeplinkFromAbsolute("?\(from)")
    }

    private func extractDeeplinkFromAbsolute(_ from: String) -> URL? {
        let url = URLComponents(string: from)
        if let deeplink = url?.queryItems?
            .filter({ $0.name == InstallReferrerToDeeplinkUriConverter.DEEPLINK_PARAM_NAME })
            .first?.value {
            return URL(string: deeplink)
        } else {
            return nil
        }
    }
}
