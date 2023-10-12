import AffiseAttributionLib


protocol CheckStatusUseCase {

    func send(_ onComplete: @escaping OnKeyValueCallback)
}
