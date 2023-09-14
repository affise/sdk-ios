@objc
public class AffiseSKAd: NSObject {

    @objc(registerWithCompletionHandler:)
    public static func register(_ completionHandler: @escaping (String)->Void) {
        if #available(iOS 16.1, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, coarseValue: CoarseConversionValue.medium.value, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseSKAdNetwork.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in                
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else {
            completionHandler(notSupported())
        }
    }

    @objc(updatePostbackWithFineValue:coarseValue:completionHandler:)
    public static func updatePostbackConversionValue(fineValue: Int, coarseValue: CoarseValue?, _ completionHandler: @escaping (String) -> Void) {
        let coarse = coarseValue?.value ?? CoarseConversionValue.medium.value
 
        if #available(iOS 16.1, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, coarseValue: coarse, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseSKAdNetwork.shared()?.updateConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else {
            completionHandler(notSupported())
        }
    }
    
    private static func notSupported() -> String {
        return "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion) Not supported"
    }
}
