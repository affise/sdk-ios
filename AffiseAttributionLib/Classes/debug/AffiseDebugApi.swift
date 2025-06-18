import Foundation

@objc
public protocol AffiseDebugApi : AnyObject {
        /**
         * Won't work on Production
         *
         * Validate credentials
         */
        func validate(_ callback: @escaping DebugOnValidateCallback)

        /**
         * Won't work on Production
         *
         * Show request-response data
         */
        func network(_ callback: @escaping DebugOnNetworkCallback)

        /**
         * Show version
         */
        func version() -> String
}