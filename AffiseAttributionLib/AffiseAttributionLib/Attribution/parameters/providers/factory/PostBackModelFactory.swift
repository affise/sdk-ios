//
//  PostBackModelFactory.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


internal class PostBackModelFactory {
    
    let uuidProvider: UuidProvider
    let affiseAppIdProvider: AffiseAppIdProvider
    let affisePkgAppNameProvider: AffisePackageAppNameProvider
    let appVersionProvider: AppVersionProvider
    let appVersionRawProvider: AppVersionRawProvider
    let storeProvider: StoreProvider
    let installedTimeProvider: InstalledTimeProvider
    let firstOpenTimeProvider: FirstOpenTimeProvider
    let installedHourProvider: InstalledHourProvider
    let firstOpenHourProvider: FirstOpenHourProvider
    let installFirstEventProvider: InstallFirstEventProvider
    let installBeginTimeProvider: InstallBeginTimeProvider
    let installFinishTimeProvider: InstallFinishTimeProvider
    let referralTimeProvider: Int64 //: ReferralTimeProvider,
    let createdTimeProvider: CreatedTimeProvider
    let createdTimeMilliProvider: CreatedTimeMilliProvider
    let createdTimeHourProvider: CreatedTimeHourProvider
    let lastSessionTimeProvider: LastSessionTimeProvider
    let connectionTypeProvider: ConnectionTypeProvider
    let cpuTypeProvider: CpuTypeProvider
    let hardwareNameProvider: HardwareNameProvider
    let networkTypeProvider: NetworkTypeProvider
    let deviceManufacturerProvider: DeviceManufacturerProvider
    let proxyIpAddressProvider: ProxyIpAddressProvider
    let deeplinkClickProvider: DeeplinkClickPropertyProvider
    let deviceAtlasIdProvider: String // DeviceAtlasIdProvider, todo
    let affDeviceIdProvider: AffiseDeviceIdProvider
    let affaltDeviceIdProvider: AffiseAltDeviceIdProvider
    let adidProvider: AdidProvider
    let androidIdProvider: String //AndroidIdProvider,
    let androidIdMd5Provider: String //AndroidIdMD5Provider,
    let macSha1Provider: String //MacSha1Provider,
    let macMd5Provider: String //MacMD5Provider,
    let gaidAdidProvider: String //GoogleAdvertisingIdProvider,
    let gaidAdidMd5Provider: String //GoogleAdvertisingIdMd5Provider,
    let oaidProvider: String //OaidProvider,
    let oaidMd5Provider: String //OaidMD5Provider,
    let altstrAdidProvider: String //AltstrAdidProvider, todo
    let fireosAdidProvider: String //FireosAdidProvider, todo
    let colorosAdidProvider: String //ColorosAdidProvider, todo
    let reftokenProvider: RefTokenProvider
    let reftokensProvider: RefTokensProvider
    let referrerProvider: String //: InstallReferrerProvider,
    let userAgentProvider: UserAgentProvider
    let mccodeProvider: MCCProvider
    let mncodeProvider: MNCProvider
    let ispProvider: IspNameProvider
    let regionProvider: RegionProvider
    let countryProvider: CountryProvider
    let languageProvider: LanguageProvider
    let deviceNameProvider: DeviceNameProvider
    let deviceTypeProvider: DeviceTypeProvider
    let osNameProvider: OsNameProvider
    let platformProvider: PlatformNameProvider
    let sdkPlatformProvider: SdkPlatformNameProvider
    let apiLevelOsProvider: String //: ApiLevelOSProvider,
    let affSdkVersionProvider: AffSDKVersionProvider
    let osVersionProvider: OSVersionProvider
    let randomUserIdProvider: RandomUserIdProvider
    let affSdkPosProvider: IsProductionPropertyProvider
    let timezoneDevProvider: TimezoneDeviceProvider
    let affEventTokenProvider: String //: AffiseEventTokenProvider, //todo hold
    let affEventNameProvider: String //: AffiseEventNameProvider, todo
    let lastTimeSessionProvider: LastSessionTimeProvider
    let timeSessionProvider: TimeSessionProvider
    let affSessionCountProvider: AffiseSessionCountProvider
    let lifetimeSessionCountProvider: LifetimeSessionCountProvider
    let affDeeplinkProvider: DeeplinkProvider
    let affpartParamNameProvider: AffPartParamNamePropertyProvider
    let affpartParamNameTokenProvider: AffPartParamNameTokenPropertyProvider
    let affAppTokenProvider: AffAppTokenPropertyProvider
    let labelProvider: String  //LabelProvider, todo hold
    let affsdkSecretIdProvider: AffSDKSecretIdProvider
    let pushtokenProvider: PushTokenProvider
    
    init(uuidProvider: UuidProvider,
         affiseAppIdProvider: AffiseAppIdProvider,
         affisePkgAppNameProvider: AffisePackageAppNameProvider,
         appVersionProvider: AppVersionProvider,
         appVersionRawProvider: AppVersionRawProvider,
         storeProvider: StoreProvider,
         installedTimeProvider: InstalledTimeProvider,
         firstOpenTimeProvider: FirstOpenTimeProvider,
         installedHourProvider: InstalledHourProvider,
         firstOpenHourProvider: FirstOpenHourProvider,
         installFirstEventProvider: InstallFirstEventProvider,
         installBeginTimeProvider: InstallBeginTimeProvider,
         installFinishTimeProvider: InstallFinishTimeProvider,
         referralTimeProvider: Int64,
         createdTimeProvider: CreatedTimeProvider,
         createdTimeMilliProvider: CreatedTimeMilliProvider,
         createdTimeHourProvider: CreatedTimeHourProvider,
         lastSessionTimeProvider: LastSessionTimeProvider,
         connectionTypeProvider: ConnectionTypeProvider,
         cpuTypeProvider: CpuTypeProvider,
         hardwareNameProvider: HardwareNameProvider,
         networkTypeProvider: NetworkTypeProvider,
         deviceManufacturerProvider: DeviceManufacturerProvider,
         proxyIpAddressProvider: ProxyIpAddressProvider,
         deeplinkClickProvider: DeeplinkClickPropertyProvider,
         deviceAtlasIdProvider: String, // DeviceAtlasIdProvider, todo
         affDeviceIdProvider: AffiseDeviceIdProvider,
         affaltDeviceIdProvider: AffiseAltDeviceIdProvider,
         adidProvider: AdidProvider,
         androidIdProvider: String, //AndroidIdProvider,
         androidIdMd5Provider: String, //AndroidIdMD5Provider,
         macSha1Provider: String, //MacSha1Provider,
         macMd5Provider: String, //MacMD5Provider,
         gaidAdidProvider: String, //GoogleAdvertisingIdProvider,
         gaidAdidMd5Provider: String, //GoogleAdvertisingIdMd5Provider,
         oaidProvider: String, //OaidProvider,
         oaidMd5Provider: String, //OaidMD5Provider,
         altstrAdidProvider: String, //AltstrAdidProvider, todo
         fireosAdidProvider: String, //FireosAdidProvider, todo
         colorosAdidProvider: String, //ColorosAdidProvider, todo
         reftokenProvider: RefTokenProvider,
         reftokensProvider: RefTokensProvider,
         referrerProvider: String,
         userAgentProvider: UserAgentProvider,
         mccodeProvider: MCCProvider,
         mncodeProvider: MNCProvider,
         ispProvider: IspNameProvider,
         regionProvider: RegionProvider,
         countryProvider: CountryProvider,
         languageProvider: LanguageProvider,
         deviceNameProvider: DeviceNameProvider,
         deviceTypeProvider: DeviceTypeProvider,
         osNameProvider: OsNameProvider,
         platformProvider: PlatformNameProvider,
         sdkPlatformProvider: SdkPlatformNameProvider,
         apiLevelOsProvider: String,
         affSdkVersionProvider: AffSDKVersionProvider,
         osVersionProvider: OSVersionProvider,
         randomUserIdProvider: RandomUserIdProvider,
         affSdkPosProvider: IsProductionPropertyProvider,
         timezoneDevProvider: TimezoneDeviceProvider,
         affEventTokenProvider: String, //: AffiseEventTokenProvider, //todo hold
         affEventNameProvider: String, //: AffiseEventNameProvider, todo
         lastTimeSessionProvider: LastSessionTimeProvider,
         timeSessionProvider: TimeSessionProvider,
         affSessionCountProvider: AffiseSessionCountProvider,
         lifetimeSessionCountProvider: LifetimeSessionCountProvider,
         affDeeplinkProvider: DeeplinkProvider,
         affpartParamNameProvider: AffPartParamNamePropertyProvider,
         affpartParamNameTokenProvider: AffPartParamNameTokenPropertyProvider,
         affAppTokenProvider: AffAppTokenPropertyProvider,
         labelProvider: String, //LabelProvider, todo hold
         affsdkSecretIdProvider: AffSDKSecretIdProvider,
         pushtokenProvider: PushTokenProvider
    ) {
        self.uuidProvider = uuidProvider
        self.affiseAppIdProvider = affiseAppIdProvider
        self.affisePkgAppNameProvider = affisePkgAppNameProvider
        self.appVersionProvider = appVersionProvider
        self.appVersionRawProvider = appVersionRawProvider
        self.storeProvider = storeProvider
        self.installedTimeProvider = installedTimeProvider
        self.firstOpenTimeProvider = firstOpenTimeProvider
        self.installedHourProvider = installedHourProvider
        self.firstOpenHourProvider = firstOpenHourProvider
        self.installFirstEventProvider = installFirstEventProvider
        self.installBeginTimeProvider = installBeginTimeProvider
        self.installFinishTimeProvider = installFinishTimeProvider
        self.referralTimeProvider = referralTimeProvider
        self.createdTimeProvider = createdTimeProvider
        self.createdTimeMilliProvider = createdTimeMilliProvider
        self.createdTimeHourProvider = createdTimeHourProvider
        self.lastSessionTimeProvider = lastSessionTimeProvider
        self.connectionTypeProvider = connectionTypeProvider
        self.cpuTypeProvider = cpuTypeProvider
        self.hardwareNameProvider = hardwareNameProvider
        self.networkTypeProvider = networkTypeProvider
        self.proxyIpAddressProvider = proxyIpAddressProvider
        self.deeplinkClickProvider = deeplinkClickProvider
        self.deviceAtlasIdProvider = deviceAtlasIdProvider
        self.affDeviceIdProvider = affDeviceIdProvider
        self.affaltDeviceIdProvider = affaltDeviceIdProvider
        self.adidProvider = adidProvider
        self.androidIdProvider = androidIdProvider
        self.androidIdMd5Provider = androidIdMd5Provider
        self.macSha1Provider = macSha1Provider
        self.macMd5Provider = macMd5Provider
        self.gaidAdidProvider = gaidAdidProvider
        self.gaidAdidMd5Provider = gaidAdidMd5Provider
        self.oaidProvider = oaidProvider
        self.oaidMd5Provider = oaidMd5Provider
        self.altstrAdidProvider = altstrAdidProvider
        self.fireosAdidProvider = fireosAdidProvider
        self.colorosAdidProvider = colorosAdidProvider
        self.reftokenProvider = reftokenProvider
        self.reftokensProvider = reftokensProvider
        self.referrerProvider = referrerProvider
        self.userAgentProvider = userAgentProvider
        self.mccodeProvider = mccodeProvider
        self.mncodeProvider = mncodeProvider
        self.ispProvider = ispProvider
        self.regionProvider = regionProvider
        self.countryProvider = countryProvider
        self.languageProvider = languageProvider
        self.deviceNameProvider = deviceNameProvider
        self.deviceTypeProvider = deviceTypeProvider
        self.osNameProvider = osNameProvider
        self.platformProvider = platformProvider
        self.sdkPlatformProvider = sdkPlatformProvider
        self.apiLevelOsProvider = apiLevelOsProvider
        self.affSdkVersionProvider = affSdkVersionProvider
        self.osVersionProvider = osVersionProvider
        self.randomUserIdProvider = randomUserIdProvider
        self.affSdkPosProvider = affSdkPosProvider
        self.timezoneDevProvider = timezoneDevProvider
        self.affEventTokenProvider = affEventTokenProvider
        self.affEventNameProvider = affEventNameProvider
        self.lastTimeSessionProvider = lastTimeSessionProvider
        self.deviceManufacturerProvider = deviceManufacturerProvider
        self.timeSessionProvider = timeSessionProvider
        self.affSessionCountProvider = affSessionCountProvider
        self.lifetimeSessionCountProvider = lifetimeSessionCountProvider
        self.affDeeplinkProvider = affDeeplinkProvider
        self.affpartParamNameProvider = affpartParamNameProvider
        self.affpartParamNameTokenProvider = affpartParamNameTokenProvider
        self.affAppTokenProvider = affAppTokenProvider
        self.labelProvider = labelProvider
        self.affsdkSecretIdProvider = affsdkSecretIdProvider
        self.pushtokenProvider = pushtokenProvider
    }

    /**
     * Create PostBackModel with [events] and [logs]
     *
     * @return PostBackModel
     */
    func create(
        events: Array<SerializedEvent> = [],
        logs: Array<SerializedLog> = [],
        metrics: Array<SerializedEvent> = []
    ) -> PostBackModel {
        let createdTime = createdTimeProvider.provideWithDefault()
        
        var lastTimeSession = lastTimeSessionProvider.provideWithDefault()
        if lastTimeSession == 0 {
            lastTimeSession = firstOpenTimeProvider.provideWithDefault()
        }

        return PostBackModel(
            uuid: uuidProvider.provideWithDefault(),
            affiseAppId: affiseAppIdProvider.provideWithDefault(),
            affisePkgAppName: affisePkgAppNameProvider.provideWithDefault(),
            appVersion: appVersionProvider.provideWithDefault(),
            appVersionRaw: appVersionRawProvider.provideWithDefault(),
            store: storeProvider.provideWithDefault(),
            installedTime: installedTimeProvider.provideWithDefault(),
            firstOpenTime: firstOpenTimeProvider.provideWithDefault(),
            installedHour: installedHourProvider.provideWithDefault(),
            firstOpenHour: firstOpenHourProvider.provideWithDefault(),
            installFirstEvent: installFirstEventProvider.provideWithDefault(),
            installBeginTime: installBeginTimeProvider.provideWithDefault(),
            installFinishTime: installFinishTimeProvider.provideWithDefault(),
            referralTime: referralTimeProvider,//referralTimeProvider.provideWithDefault(),
            createdTime: createdTime,
            createdTimeMilli: createdTimeMilliProvider.provideWithDefault(),
            createdTimeHour: createdTimeHourProvider.provideWithDefault(),
            lastSessionTime: lastSessionTimeProvider.provideWithDefault(),
            connectionType: connectionTypeProvider.provideWithDefault(),
            cpuType: cpuTypeProvider.provideWithDefault(),
            hardwareName: hardwareNameProvider.provideWithDefault(),
            networkType: networkTypeProvider.provideWithDefault(),
            deviceManufacturer: deviceManufacturerProvider.provideWithDefault(),
            proxyIpAddress: proxyIpAddressProvider.provideWithDefault(),
            deeplinkClick: deeplinkClickProvider.provideWithDefault(),
            deviceAtlasId: deviceAtlasIdProvider,// TODO .provideWithDefault(),
            affDeviceId: affDeviceIdProvider.provideWithDefault(),
            affaltDeviceId: affaltDeviceIdProvider.provideWithDefault(),
            adid: adidProvider.provideWithDefault(),
            androidId: androidIdProvider,// TODO .provideWithDefault(),
            androidIdMd5: androidIdMd5Provider,// TODO .provideWithDefault(),
            macSha1: macSha1Provider,// TODO .provideWithDefault(),
            macMd5: macMd5Provider,// TODO .provideWithDefault(),
            gaidAdid: gaidAdidProvider,// TODO .provideWithDefault(),
            gaidAdidMd5: gaidAdidMd5Provider,// TODO .provideWithDefault(),
            oaid: oaidProvider,// TODO .provideWithDefault(),
            oaidMd5: oaidMd5Provider,// TODO .provideWithDefault(),
            altstrAdid: altstrAdidProvider,// TODO .provideWithDefault(),
            fireosAdid: fireosAdidProvider,// TODO .provideWithDefault(),
            colorosAdid: colorosAdidProvider,// TODO .provideWithDefault(),
            reftoken: reftokenProvider.provideWithDefault(),
            reftokens: reftokensProvider.provideWithDefault(),
            referrer: referrerProvider,//referrerProvider.provideWithDefault(),
            userAgent: userAgentProvider.provideWithDefault(),
            mccode: mccodeProvider.provideWithDefault(),
            mncode: mncodeProvider.provideWithDefault(),
            isp: ispProvider.provide(),
            region: regionProvider.provideWithDefault(),
            country: countryProvider.provideWithDefault(),
            language: languageProvider.provideWithDefault(),
            deviceName: deviceNameProvider.provideWithDefault(),
            deviceType: deviceTypeProvider.provideWithDefault(),
            osName: osNameProvider.provideWithDefault(),
            platform: platformProvider.provideWithDefault(),
            sdkPlatform: sdkPlatformProvider.provideWithDefault(),
            apiLevelOs: apiLevelOsProvider,// TODO .provideWithDefault(),
            affSdkVersion: affSdkVersionProvider.provideWithDefault(),
            osVersion: osVersionProvider.provideWithDefault(),
            randomUserId: randomUserIdProvider.provideWithDefault(),
            affSdkPos: affSdkPosProvider.provideWithDefault(),
            timezoneDev: timezoneDevProvider.provideWithDefault(),
            affEventToken: affEventTokenProvider,// TODO .provideWithDefault(),
            affEventName: affEventNameProvider,// TODO .provideWithDefault(),
            lastTimeSession: lastTimeSession,
            timeSession: timeSessionProvider.provideWithDefault(),
            affSessionCount: affSessionCountProvider.provideWithDefault(),
            lifetimeSessionCount: lifetimeSessionCountProvider.provideWithDefault(),
            affDeeplink: affDeeplinkProvider.provideWithDefault(),
            affpartParamName: affpartParamNameProvider.provideWithDefault(),
            affpartParamNameToken: affpartParamNameTokenProvider.provideWithDefault(),
            affAppToken: affAppTokenProvider.provideWithParamAndDefault(param: String(createdTime)),
            label: labelProvider,// TODO .provideWithDefault(),
            affsdkSecretId: affsdkSecretIdProvider.provideWithDefault(),
            pushtoken: pushtokenProvider.provideWithDefault(),
            events: events,
            logs: logs,
            metrics: metrics
        )
    }
}
