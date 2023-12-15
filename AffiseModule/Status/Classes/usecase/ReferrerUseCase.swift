import AffiseAttributionLib


protocol ReferrerUseCase {

    func getReferrer(_ onComplete: @escaping OnReferrerCallback)
    
    func parseStatus(_ status: [AffiseKeyValue]) -> String?
}
