/**
 * UseCase store logs interface
 */
internal protocol StoreLogsUseCase {

    /**
     * Store log
     */
    func storeLog(log: AffiseLog)
}
