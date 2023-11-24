import Foundation
import AffiseAttributionLib

internal class EventParameters {
    static func addParameters(_ event: inout Event, map: [(String, Any?)]) {
        if map.count == 0 {
            return
        }
        
        for (name, value) in map {
            if name.isEmpty { continue }
            if value == nil { continue }
            
            event.addPredefinedValue(name, value: value)
        }
    }
}

internal extension Event {
    private func getPredefined(_ name: String) -> Any? {
        return PredefinedString.from(name)
        ?? PredefinedListString.from(name)
        ?? PredefinedLong.from(name)
        ?? PredefinedFloat.from(name)
        ?? PredefinedObject.from(name)
        ?? PredefinedListObject.from(name)
    }
    
    func addPredefinedValue(_ name: String, value: Any?) {
        guard let param = getPredefined(name) else { return }
        
        switch param {
        case is PredefinedString:
            guard let string = value as? String else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedString, string: string)
            break
            
        case is PredefinedListString:
            guard let list = value as? [String] else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedListString, listString: list)
            break
            
        case is PredefinedLong:
            guard let number = value as? NSNumber else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedLong, long: number.int64Value)
            break
            
        case is PredefinedFloat:
            guard let number = value as? NSNumber else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedFloat, float: number.floatValue)
            break
            
        case is PredefinedObject:
            guard let object = value as? [(String, Any)] else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedObject, object: object)
            break
            
        case is PredefinedListObject:
            guard let list = value as? [Any] else {
                return
            }
            _ = self.addPredefinedParameter(param as! PredefinedListObject, listObject: list.toArrayOfObject())
            break
            
        default:
            return
        }
    }
}
