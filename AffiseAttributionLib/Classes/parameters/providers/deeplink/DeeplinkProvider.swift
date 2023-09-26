
/**
 * Provider for parameter [ProviderType.AFFISE_DEEPLINK]
 *
 * @property deeplinkClickRepository to retrieve deeplink
 */
class DeeplinkProvider : StringPropertyProvider {
    private let deeplinkClickRepository: DeeplinkClickRepository
    
    init(deeplinkClickRepository: DeeplinkClickRepository) {
        self.deeplinkClickRepository = deeplinkClickRepository
    }
    
    override func provide() -> String? {
        return deeplinkClickRepository.getDeeplink()
    }
    
    public override func getOrder() -> Float {
        58.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_DEEPLINK
    }
}
