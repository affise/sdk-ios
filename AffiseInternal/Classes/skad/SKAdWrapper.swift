import AffiseSKAdNetwork

internal class SKAdWrapper {

    static func register(_ result: AffiseResult?, callback: @escaping (String)->Void) {
        AffiseSKAd.register { error in
            callback(error)
        }
        
        result?.success(nil)
    }

    static func postback(_ result: AffiseResult?, fineValue: Int, coarseValue: String?, callback: @escaping (String)->Void) {
        AffiseSKAd.updatePostbackConversionValue(fineValue: fineValue, coarseValue: CoarseValue(coarseValue ?? "")) { error in
            callback(error)
        }
        
        result?.success(nil)
    }
}
