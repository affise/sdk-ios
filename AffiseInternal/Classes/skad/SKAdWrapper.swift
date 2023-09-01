import AffiseSKAdNetwork

internal class SKAdWrapper {

    static func register(_ result: AffiseResult?, callback: @escaping (String)->Void) {
        if #available(iOS 16.1, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, coarseValue: "medium", completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseSKAdNetwork.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in                
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else {
            result?.notImplemented()
            return
        }
        
        result?.success(nil)
    }

    static func postback(_ result: AffiseResult?, fineValue: Int, coarseValue: String?, callback: @escaping (String)->Void) {
        var coarse = coarseValue ?? "medium"
        if coarse.isEmpty {
            coarse = "medium"
        }
        if #available(iOS 16.1, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, coarseValue: coarse, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else if #available(iOS 15.4, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else if #available(iOS 14.0, *) {
            AffiseSKAdNetwork.shared()?.updateConversionValue(fineValue, completionHandler: { error in
                let errorMessage = error?.localizedDescription ?? ""
                callback(errorMessage)
            })
        } else {
            result?.notImplemented()
            return
        }
        
        result?.success(nil)
    }
}