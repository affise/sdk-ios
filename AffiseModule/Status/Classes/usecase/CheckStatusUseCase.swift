import AffiseAttributionLib


protocol CheckStatusUseCase {

    func send(_ onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void)
}
