//
//  PostBackModel.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


struct PostBackModel {
    let uuid: String
    let affiseAppId: String
    let affisePkgAppName: String
    let appVersion: String
    let appVersionRaw: String
    let store: String
    let installedTime: Int64
    let firstOpenTime: Int64
    let installedHour: Int64
    let firstOpenHour: Int64
    let installFirstEvent: Bool
    let installBeginTime: Int64
    let installFinishTime: Int64
    let referralTime: Int64
    let createdTime: Int64
    let createdTimeMilli: Int64
    let createdTimeHour: Int64
    let lastSessionTime: Int64
    let connectionType: String
    let cpuType: String
    let hardwareName: String
    let networkType: String
    let deviceManufacturer: String
    let proxyIpAddress: String
    let deeplinkClick: Bool
    let deviceAtlasId: String
    let affDeviceId: String
    let affaltDeviceId: String
    let adid: String
    let androidId: String
    let androidIdMd5: String
    let macSha1: String
    let macMd5: String
    let gaidAdid: String
    let gaidAdidMd5: String
    let oaid: String
    let oaidMd5: String
    let altstrAdid: String
    let fireosAdid: String
    let colorosAdid: String
    let reftoken: String
    let reftokens: String
    let referrer: String
    let userAgent: String?
    let mccode: String
    let mncode: String
    let isp: String?
    let region: String?
    let country: String?
    let language: String?
    let deviceName: String
    let deviceType: String
    let osName: String
    let platform: String
    let apiLevelOs: String
    let affSdkVersion: String
    let osVersion: String
    let randomUserId: String
    let affSdkPos: String
    let timezoneDev: String
    let affEventToken: String
    let affEventName: String
    let lastTimeSession: Int64
    let timeSession: Int64
    let affSessionCount: Int64
    let lifetimeSessionCount: Int64
    let affDeeplink: String
    let affpartParamName: String
    let affpartParamNameToken: String
    let affAppToken: String
    let label: String
    let affsdkSecretId: String
    let pushtoken: String
    
    let events: Array<SerializedEvent>?
    let logs: Array<SerializedLog>?
    let metrics: Array<SerializedEvent>?
}
