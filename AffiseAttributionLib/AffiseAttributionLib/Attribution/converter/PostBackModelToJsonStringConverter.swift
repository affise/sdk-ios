//
//  PostBackModelToJsonStringConverter.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Converter List<PostBackModel> to String
 */
class PostBackModelToJsonStringConverter : Converter {
    
    typealias T = Array<PostBackModel>
    typealias R = String

    private let EVENTS_KEY = "events"
    private let SDK_EVENTS_KEY = "sdk_events"
    private let METRICS_EVENTS_KEY = "metrics_events"
    
    /**
     * Convert [from] list of PostBackModel to json string
     */
    func convert(from: Array<PostBackModel>) -> String {
        let res = from.map { model in
            parameters(obj: model)
        }.joined(separator: ",")
        return "[\(res)]"
    }

    /**
     * Create parameters map of object
     */
    private func parameters(obj: PostBackModel) -> String {
        var dict: [(String, Any?)] = [
            (Parameters.AFFISE_APP_ID, obj.affiseAppId),
            (Parameters.AFFISE_PKG_APP_NAME, obj.affisePkgAppName),
        //affise_app_name_dashboard
            (Parameters.APP_VERSION, obj.appVersion),
            (Parameters.APP_VERSION_RAW, obj.appVersionRaw),
        (Parameters.STORE, obj.store),
        //tracker_token
        //tracker_name
        //first_tracker_token
        //first_tracker_name
        //last_tracker_token
        //last_tracker_name
        //outdated_tracker_token
        (Parameters.INSTALLED_TIME, obj.installedTime),
        (Parameters.FIRST_OPEN_TIME, obj.firstOpenTime),
        (Parameters.INSTALLED_HOUR, obj.installedHour),
        (Parameters.FIRST_OPEN_HOUR, obj.firstOpenHour),
        (Parameters.INSTALL_FIRST_EVENT, obj.installFirstEvent),
        (Parameters.INSTALL_BEGIN_TIME, obj.installBeginTime),
        (Parameters.INSTALL_FINISH_TIME, obj.installFinishTime),
        (Parameters.REFERRAL_TIME, obj.referralTime),
        (Parameters.CREATED_TIME, obj.createdTime),
        (Parameters.CREATED_TIME_MILLI, obj.createdTimeMilli),
        (Parameters.CREATED_TIME_HOUR, obj.createdTimeHour),
        //uninstall_time
        //reinstall_time
        (Parameters.LAST_SESSION_TIME, obj.lastSessionTime),
        (Parameters.CONNECTION_TYPE, obj.connectionType),
        (Parameters.CPU_TYPE, obj.cpuType),
        (Parameters.HARDWARE_NAME, obj.hardwareName),
        (Parameters.NETWORK_TYPE, obj.networkType),
        (Parameters.DEVICE_MANUFACTURER, obj.deviceManufacturer),
        (Parameters.PROXY_IP_ADDRESS, obj.proxyIpAddress),
        (Parameters.DEEPLINK_CLICK, obj.deeplinkClick),
        (Parameters.DEVICE_ATLAS_ID, obj.deviceAtlasId),
        (Parameters.AFFISE_DEVICE_ID, obj.affDeviceId),
        (Parameters.AFFISE_ALT_DEVICE_ID, obj.affaltDeviceId),
        (Parameters.ADID, obj.adid),
        (Parameters.ANDROID_ID, obj.androidId),
        (Parameters.ANDROID_ID_MD5, obj.androidIdMd5),
        (Parameters.MAC_SHA1, obj.macSha1),
        (Parameters.MAC_MD5, obj.macMd5),
        (Parameters.GAID_ADID, obj.gaidAdid),
        (Parameters.GAID_ADID_MD5, obj.gaidAdidMd5),
        (Parameters.OAID, obj.oaid),
        (Parameters.OAID_MD5, obj.oaidMd5),
        (Parameters.ALTSTR_ADID, obj.altstrAdid),
        (Parameters.FIREOS_ADID, obj.fireosAdid),
        (Parameters.COLOROS_ADID, obj.colorosAdid),
        (Parameters.REFTOKEN, obj.reftoken),
        (Parameters.REFTOKENS, obj.reftokens),
        (Parameters.REFERRER, obj.referrer),
        (Parameters.USER_AGENT, obj.userAgent),
        (Parameters.MCCODE, obj.mccode),
        (Parameters.MNCODE, obj.mncode),
        (Parameters.ISP, obj.isp),
        (Parameters.REGION, obj.region),
        (Parameters.COUNTRY, obj.country),
        (Parameters.LANGUAGE, obj.language),
        (Parameters.DEVICE_NAME, obj.deviceName),
        (Parameters.DEVICE_TYPE, obj.deviceType),
        (Parameters.OS_NAME, obj.osName),
        (Parameters.PLATFORM, obj.platform),
        (Parameters.SDK_PLATFORM, obj.sdkPlatform),
        (Parameters.API_LEVEL_OS, obj.apiLevelOs),
        (Parameters.AFFISE_SDK_VERSION, obj.affSdkVersion),
        (Parameters.OS_VERSION, obj.osVersion),
        (Parameters.RANDOM_USER_ID, obj.randomUserId),
        (Parameters.AFFISE_SDK_POS, obj.affSdkPos),
        (Parameters.TIMEZONE_DEV, obj.timezoneDev),
        (Parameters.AFFISE_EVENT_TOKEN, obj.affEventToken),
        (Parameters.AFFISE_EVENT_NAME, obj.affEventName),
        (Parameters.LAST_TIME_SESSION, obj.lastTimeSession),
        (Parameters.TIME_SESSION, obj.timeSession),
        (Parameters.AFFISE_SESSION_COUNT, obj.affSessionCount),
        (Parameters.LIFETIME_SESSION_COUNT, obj.lifetimeSessionCount),
        (Parameters.AFFISE_DEEPLINK, obj.affDeeplink),
        (Parameters.AFFISE_PART_PARAM_NAME, obj.affpartParamName),
        (Parameters.AFFISE_PART_PARAM_NAME_TOKEN, obj.affpartParamNameToken),
        (Parameters.AFFISE_APP_TOKEN, obj.affAppToken),
        (Parameters.LABEL, obj.label),
        (Parameters.AFFISE_SDK_SECRET_ID, obj.affsdkSecretId),
        (Parameters.UUID, obj.uuid),
        //affise_app_opened
        (Parameters.PUSHTOKEN, obj.pushtoken),
]
        //Events
        let eventsArray = obj.events?.map { event in event.data } ?? []
        dict.append((Parameters.AFFISE_EVENTS_COUNT, eventsArray.count))
        dict.append((EVENTS_KEY, eventsArray))

        //Logs
        let logsArray = obj.logs?.map { log in log.data } ?? []
        dict.append((Parameters.AFFISE_SDK_EVENTS_COUNT, logsArray.count))
        dict.append((SDK_EVENTS_KEY, logsArray))

        //Metrics
        let metricsArray = obj.metrics?.map { metric in metric.data } ?? []
        dict.append((Parameters.AFFISE_METRICS_EVENTS_COUNT, metricsArray.count))
        dict.append((METRICS_EVENTS_KEY, metricsArray))
        
        return dict.jsonString()
    }
}
