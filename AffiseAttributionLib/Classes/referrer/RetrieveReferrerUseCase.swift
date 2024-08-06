import Foundation

class RetrieveReferrerUseCase {

    private var referrerURL: URL?
    
    /**
     * Set referrerURL
     */
    func setReferrer(_ url: URL?) {
        referrerURL = url
    }
    
    func getReferrer() -> String? {
        return referrerURL?.absoluteString
    }
    
    /**
     * Return referrer URL
     */
    func getReferrerUrl(_ callback: @escaping OnReferrerCallback) {
        callback(referrerURL?.absoluteString)
    }
    
    /**
     * Return referrer URL parameter by key
     */
    func getReferrerUrlValue(_ key: ReferrerKey, _ callback: @escaping OnReferrerCallback) {
        callback(referrerURL?.absoluteString.getQueryStringParameter(key.value()))
    }
} 
