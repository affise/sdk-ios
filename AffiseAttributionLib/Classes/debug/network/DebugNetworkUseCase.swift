protocol DebugNetworkUseCase {
    func onRequest(_ onComplete: @escaping DebugOnNetworkCallback)
}
