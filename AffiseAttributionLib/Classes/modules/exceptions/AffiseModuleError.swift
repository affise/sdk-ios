import Foundation

enum AffiseModuleError: Error {
    case version(name: AffiseModules, module: AffiseModule)
}

extension AffiseModuleError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .version(name: let name, module: let module):
            return NSLocalizedString("AffiseModuleError.version(module [\(name.description.lowercased()):\(module.version)] version is incompatible with [attribution:\(BuildConfig.AFFISE_VERSION)], use same version as attribution)", comment: "")
        }
    }
}
