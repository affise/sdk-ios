//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Base Affise log event
 *
 * @property name the type log in NETWORK, DEVICEDATA, USERDATA, SDKLOG.
 * @property value the event data.
 */
internal class AffiseLog {
    
    let name: AffiseLogType
    let value: String
    
    init(name: AffiseLogType, value: String) {
        self.name = name
        self.value = value
    }
    
    
    /**
     * Log of network errors contains [jsonObject]
     */
    class NetworkLog : AffiseLog {
        init(jsonObject: [(String, Any?)]) {
            super.init(name: AffiseLogType.NETWORK, value: jsonObject.jsonString())
        }
    }
    
    /**
     * Log of device data errors contains any string [value]
     */
    class DevicedataLog : AffiseLog {
        init(value: String) {
            super.init(name: AffiseLogType.DEVICEDATA, value: value)
        }
    }
    
    /**
     * Log of user data contains any string [value]
     */
    class UserdataLog : AffiseLog {
        init(value: String) {
            super.init(name: AffiseLogType.USERDATA, value: value)
        }
    }
    
    /**
     * Log of sdk errors contains any string [value]
     */
    class SdkLog : AffiseLog {
        init(value: String) {
            super.init(name: AffiseLogType.SDKLOG, value: value)
        }
    }
}

/**
 * Type of log
 */
enum AffiseLogType: String {
    case NETWORK = "affise_sdklog_network"
    case DEVICEDATA = "affise_sdklog_ddata"
    case USERDATA = "affise_sdklog_udata"
    case SDKLOG = "affise_sdklog_main"
    
    static let values = [NETWORK, DEVICEDATA, USERDATA, SDKLOG]
}
