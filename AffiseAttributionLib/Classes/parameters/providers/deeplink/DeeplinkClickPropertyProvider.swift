/**
 * Provider for property [ProviderType.DEEPLINK_CLICK]
 *
 * @property deeplinkClickRepository to retrieve network is deeplink
 */
class DeeplinkClickPropertyProvider : BooleanPropertyProvider {
   private let deeplinkClickRepository: DeeplinkClickRepository
   
   init(deeplinkClickRepository: DeeplinkClickRepository) {
       self.deeplinkClickRepository = deeplinkClickRepository
   }
   
   override func provide() -> Bool? {
       return deeplinkClickRepository.isDeeplinkClick()
   }
   
    public override func getOrder() -> Float {
        25.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.DEEPLINK_CLICK
    }
}
