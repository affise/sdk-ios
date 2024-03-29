import Foundation
#if canImport(UIKit)
import UIKit
#endif

#if canImport(AffiseInternalWrapperObjC)
import AffiseInternalWrapperObjC
#endif

@objc
public class AffiseSKAd: NSObject {

    @objc(registerWithCompletionHandler:)
    public static func register(_ completionHandler: @escaping (String)->Void) {
        if #available(iOS 16.1, *) {
            AffiseStoreKitWrapper.shared()?.updatePostbackConversionValue(0, coarseValue: CoarseConversionValue.medium.value, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseStoreKitWrapper.shared()?.updatePostbackConversionValue(0, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseStoreKitWrapper.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in
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
            AffiseStoreKitWrapper.shared()?.updatePostbackConversionValue(fineValue, coarseValue: coarse, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseStoreKitWrapper.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseStoreKitWrapper.shared()?.updateConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                completionHandler(errorMessage)
            })
        } else {
            completionHandler(notSupported())
        }
    }
    
    private static func notSupported() -> String {
        return "\(self.systemName()) \(self.systemVersion()) Not supported"
    }
    
    private static func systemName() -> String {
        #if canImport(UIKit)
        return UIDevice.current.systemName
        #else
        return Host.current().name ?? ""
        #endif
    }
    
    
    private static func systemVersion() -> String {
        #if canImport(UIKit)
        return UIDevice.current.systemVersion
        #else
        return ProcessInfo.processInfo.operatingSystemVersionString
        #endif
    }
}
