protocol ImmediateSendToServerUseCase {
    func sendNow(
        event: Event,
        success: @escaping OnSendSuccessCallback,
        failed: @escaping OnSendFailedCallback
    )
}