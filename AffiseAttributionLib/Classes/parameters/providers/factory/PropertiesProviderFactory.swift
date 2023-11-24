import Foundation
import UIKit

/**
 * Factory for [PostBackModelFactory]
 */
internal class PropertiesProviderFactory {
    
    private let app: UIApplication
    private let bundle: Bundle
    private let advertisingIdManager: AdvertisingIdManager
    private let firstAppOpenUseCase: FirstAppOpenUseCase
    private let webViewUseCase: WebViewUseCase
    private let sessionManager: SessionManager
    private let preferences: UserDefaults
    private let initPropertiesStorage: InitPropertiesStorage
    //    private let stringToMd5Converter: Converter<String, String>
    //    private let stringToSha1Converter: Converter<String, String>
    private let stringToSha256Converter: StringToSHA256Converter
    private let logsManager: LogsManager
    private let deeplinkClickRepository: DeeplinkClickRepository
    private let deviceUseCase: DeviceUseCase
    
    init(app: UIApplication,
         bundle: Bundle,
         advertisingIdManager: AdvertisingIdManager,
         firstAppOpenUseCase: FirstAppOpenUseCase,
         webViewUseCase: WebViewUseCase,
         sessionManager: SessionManager,
         preferences: UserDefaults,
         initPropertiesStorage: InitPropertiesStorage,
         stringToSha256Converter: StringToSHA256Converter,
         logsManager: LogsManager,
         deeplinkClickRepository: DeeplinkClickRepository,
         deviceUseCase: DeviceUseCase
    ) {
        self.app = app
        self.bundle = bundle
        self.advertisingIdManager = advertisingIdManager
        self.firstAppOpenUseCase = firstAppOpenUseCase
        self.webViewUseCase = webViewUseCase
        self.sessionManager = sessionManager
        self.preferences = preferences
        self.initPropertiesStorage = initPropertiesStorage
        self.stringToSha256Converter = stringToSha256Converter
        self.logsManager = logsManager
        self.deeplinkClickRepository = deeplinkClickRepository
        self.deviceUseCase = deviceUseCase
    }
    
    func create() -> PostBackModelFactory {
        
        let firstOpenTimeProvider = FirstOpenTimeProvider(useCase: firstAppOpenUseCase)
        let lastSessionTimeProvider = LastSessionTimeProvider(sessionManager: sessionManager)

        return PostBackModelFactory(
            providers: [
                UuidProvider(),
                AffiseAppIdProvider(storage: initPropertiesStorage),
                AffisePackageAppNameProvider(bundle: bundle),
                AppVersionProvider(bundle: bundle),
                AppVersionRawProvider(bundle: bundle),
                StoreProvider(),
                InstalledTimeProvider(useCase: firstAppOpenUseCase),
                firstOpenTimeProvider,
                InstalledHourProvider(useCase: firstAppOpenUseCase),
                FirstOpenHourProvider(useCase: firstAppOpenUseCase),
                InstallFirstEventProvider(useCase: firstAppOpenUseCase),
                InstallBeginTimeProvider(useCase: firstAppOpenUseCase),
                InstallFinishTimeProvider(useCase: firstAppOpenUseCase),
                CreatedTimeProvider(),
                CreatedTimeMilliProvider(),
                CreatedTimeHourProvider(),
                CustomLongProvider(ProviderType.LAST_TIME_SESSION, order: 54.0) {
                    return lastSessionTimeProvider.provide()
                },
                ConnectionTypeProvider(),
                CpuTypeProvider(),
                HardwareNameProvider(),
                NetworkTypeProvider(),
                DeviceManufacturerProvider(),
                ProxyIpAddressProvider(),
                DeeplinkClickPropertyProvider(deeplinkClickRepository: deeplinkClickRepository),
                EmptyStringProvider(ProviderType.DEVICE_ATLAS_ID, order: 26.0),
                AffiseDeviceIdProvider(useCase: firstAppOpenUseCase),
                AffiseAltDeviceIdProvider(useCase: firstAppOpenUseCase),
                AdidProvider(advertisingIdManager: advertisingIdManager),
                RefTokenProvider(preferences: preferences),
                RefTokensProvider(preferences: preferences),
                UserAgentProvider(useCase: webViewUseCase),
                MCCProvider(),
                MNCProvider(),
                IspNameProvider(),
                IsEmulatorProvider(useCase: deviceUseCase),
                RegionProvider(),
                CountryProvider(),
                LanguageProvider(),
                DeviceNameProvider(),
                DeviceTypeProvider(),
                OsNameProvider(),
                PlatformNameProvider(),
                SdkPlatformNameProvider(),
                AffSDKVersionProvider(),
                OSVersionProvider(),
                RandomUserIdProvider(useCase: firstAppOpenUseCase),
                IsProductionPropertyProvider(storage: initPropertiesStorage),
                TimezoneDeviceProvider(),
                EmptyStringProvider(ProviderType.AFFISE_EVENT_TOKEN, order: 52.0),
                EmptyStringProvider(ProviderType.AFFISE_EVENT_NAME, order: 53.0),
                lastSessionTimeProvider,
                TimeSessionProvider(sessionManager: sessionManager),
                AffiseSessionCountProvider(sessionManager: sessionManager),
                LifetimeSessionCountProvider(sessionManager: sessionManager),
                DeeplinkProvider(deeplinkClickRepository: deeplinkClickRepository),
                AffPartParamNamePropertyProvider(storage: initPropertiesStorage),
                AffPartParamNameTokenPropertyProvider(storage: initPropertiesStorage),
                AffAppTokenPropertyProvider(storage: initPropertiesStorage, stringToSHA256Converter: stringToSha256Converter),
                // AffSDKSecretIdProvider(storage: initPropertiesStorage),
                EmptyStringProvider(ProviderType.LABEL, order: 62.0),
                PushTokenProvider(preferences: preferences)
            ]
        )
    }
}
