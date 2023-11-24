import Foundation

public enum AffiseError: Error {
    case cloud(url: String, error: Error, attempts: Int, retry: Bool)
    case network(status: Int, message: String?)
    case offlineModeEnabled
    case trackingDisabledException
    case backgroundTrackingDisabledException
}

extension AffiseError : LocalizedError {

    private var localized: String? {
        switch self {
        case .cloud(url: let url, error: let error, attempts: let attempts, retry: let retry):
            return NSLocalizedString("AffiseError.cloud(url=\(url), error=\(error.localizedDescription), attempts=\(attempts), retry=\(retry))", comment: "")
        case .network(status: let status, message: let message):
            return NSLocalizedString("AffiseError.network(status=\(status), message=\(message ?? ""))", comment: "")
        case .offlineModeEnabled:
            return NSLocalizedString("AffiseError.offlineModeEnabled", comment: "")
        case .trackingDisabledException:
            return NSLocalizedString("AffiseError.trackingDisabledException", comment: "")
        case .backgroundTrackingDisabledException:
            return NSLocalizedString("AffiseError.backgroundTrackingDisabledException", comment: "")
        }
    }

    public var errorDescription: String? {
        return localized?.toJsonGuardString()
    }
}
