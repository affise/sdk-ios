//
//  PropertiesProviderFactory.swift
//  app
//
//  Created by Sergey Korney
//

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
    //    private let oaidManager: OaidManager
    //    private let retrieveInstallReferrerUseCase: RetrieveInstallReferrerUseCase
    private let sessionManager: SessionManager
    private let preferences: UserDefaults
    private let initPropertiesStorage: InitPropertiesStorage
    //    private let stringToMd5Converter: Converter<String, String>
    //    private let stringToSha1Converter: Converter<String, String>
    private let stringToSha256Converter: StringToSHA256Converter
    private let logsManager: LogsManager
    private let deeplinkClickRepository: DeeplinkClickRepository
    //    private let installReferrerProvider: InstallReferrerProvider
    
    
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
         deeplinkClickRepository: DeeplinkClickRepository
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
    }
    
    func create() -> PostBackModelFactory {
        
        PostBackModelFactory(
            uuidProvider: UuidProvider(),
            affiseAppIdProvider: AffiseAppIdProvider(storage: initPropertiesStorage),
            affisePkgAppNameProvider: AffisePackageAppNameProvider(bundle: bundle),
            appVersionProvider: AppVersionProvider(bundle: bundle),
            appVersionRawProvider: AppVersionRawProvider(bundle: bundle),
            storeProvider: StoreProvider(),
            installedTimeProvider: InstalledTimeProvider(useCase: firstAppOpenUseCase),
            firstOpenTimeProvider: FirstOpenTimeProvider(useCase: firstAppOpenUseCase),
            installedHourProvider: InstalledHourProvider(useCase: firstAppOpenUseCase),
            firstOpenHourProvider: FirstOpenHourProvider(useCase: firstAppOpenUseCase),
            installFirstEventProvider: InstallFirstEventProvider(useCase: firstAppOpenUseCase),
            installBeginTimeProvider: InstallBeginTimeProvider(useCase: firstAppOpenUseCase),
            installFinishTimeProvider: InstallFinishTimeProvider(useCase: firstAppOpenUseCase),
            referralTimeProvider: 0,
            createdTimeProvider: CreatedTimeProvider(),
            createdTimeMilliProvider: CreatedTimeMilliProvider(),
            createdTimeHourProvider: CreatedTimeHourProvider(),
            lastSessionTimeProvider: LastSessionTimeProvider(sessionManager: sessionManager),
            connectionTypeProvider: ConnectionTypeProvider(),
            cpuTypeProvider: CpuTypeProvider(),
            hardwareNameProvider: HardwareNameProvider(),
            networkTypeProvider: NetworkTypeProvider(),
            deviceManufacturerProvider: DeviceManufacturerProvider(),
            proxyIpAddressProvider: ProxyIpAddressProvider(),
            deeplinkClickProvider: DeeplinkClickPropertyProvider(deeplinkClickRepository: deeplinkClickRepository),
            deviceAtlasIdProvider: "", //TODO
            affDeviceIdProvider: AffiseDeviceIdProvider(useCase: firstAppOpenUseCase),
            affaltDeviceIdProvider: AffiseAltDeviceIdProvider(useCase: firstAppOpenUseCase),
            adidProvider: AdidProvider(advertisingIdManager: advertisingIdManager),
            androidIdProvider: "",
            androidIdMd5Provider: "",
            macSha1Provider: "",
            macMd5Provider: "",
            gaidAdidProvider: "",
            gaidAdidMd5Provider: "",
            oaidProvider: "",
            oaidMd5Provider: "",
            altstrAdidProvider: "", //TODO
            fireosAdidProvider: "", //TODO
            colorosAdidProvider: "", //TODO
            reftokenProvider: RefTokenProvider(preferences: preferences),
            reftokensProvider: RefTokensProvider(preferences: preferences),
            referrerProvider: "",
            userAgentProvider: UserAgentProvider(useCase: webViewUseCase),
            mccodeProvider: MCCProvider(),
            mncodeProvider: MNCProvider(),
            ispProvider: IspNameProvider(),
            regionProvider: RegionProvider(),
            countryProvider: CountryProvider(),
            languageProvider: LanguageProvider(),
            deviceNameProvider: DeviceNameProvider(),
            deviceTypeProvider: DeviceTypeProvider(),
            osNameProvider: OsNameProvider(),
            platformProvider: PlatformNameProvider(),
            sdkPlatformProvider: SdkPlatformNameProvider(),
            apiLevelOsProvider: "", //TODOApiLevelOSProvider(buildConfigPropertiesProvider),
            affSdkVersionProvider: AffSDKVersionProvider(),
            osVersionProvider: OSVersionProvider(),
            randomUserIdProvider: RandomUserIdProvider(useCase: firstAppOpenUseCase),
            affSdkPosProvider: IsProductionPropertyProvider(storage: initPropertiesStorage),
            timezoneDevProvider: TimezoneDeviceProvider(),
            affEventTokenProvider: "", //TODO
            affEventNameProvider: "", //TODO
            lastTimeSessionProvider: LastSessionTimeProvider(sessionManager: sessionManager),
            timeSessionProvider: TimeSessionProvider(sessionManager: sessionManager),
            affSessionCountProvider: AffiseSessionCountProvider(sessionManager: sessionManager),
            lifetimeSessionCountProvider: LifetimeSessionCountProvider(sessionManager: sessionManager),
            affDeeplinkProvider: DeeplinkProvider(deeplinkClickRepository: deeplinkClickRepository),
            affpartParamNameProvider: AffPartParamNamePropertyProvider(storage: initPropertiesStorage),
            affpartParamNameTokenProvider: AffPartParamNameTokenPropertyProvider(storage: initPropertiesStorage),
            affAppTokenProvider: AffAppTokenPropertyProvider(storage: initPropertiesStorage, stringToSHA256Converter: stringToSha256Converter),
            labelProvider: "", //TODO
            affsdkSecretIdProvider: AffSDKSecretIdProvider(storage: initPropertiesStorage),
            pushtokenProvider: PushTokenProvider(preferences: preferences)
        )
    }
}
