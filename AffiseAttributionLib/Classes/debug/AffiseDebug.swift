import Foundation

internal class AffiseDebug : AffiseDebugApi {
        private var api: AffiseApi? {
            get {
                Affise.api
            }
        }

        /**
         * Won't work on Production
         *
         * Validate credentials
         */
        func validate(_ callback: @escaping DebugOnValidateCallback) {
            api?.debugValidateUseCase.validate(callback)
        }

        /**
         * Won't work on Production
         *
         * Show request-response data
         */
        func network(_ callback: @escaping DebugOnNetworkCallback) {
            api?.debugNetworkUseCase.onRequest(callback)
        }

        /**
         * Show version
         */
        func version() -> String {
            return BuildConfig.AFFISE_VERSION
        }
}