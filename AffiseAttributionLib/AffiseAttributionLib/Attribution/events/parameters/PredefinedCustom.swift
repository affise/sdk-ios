internal class PredefinedCustom {
    private let CONVERSION_ID = "\(PredefinedConstants.PREFIX)conversion_id"


    func add(_ parameters: inout [(String, Any?)], _ parameter: PredefinedString, string: String) {
        switch parameter {
        case .ORDER_ID:
            guard let productId = get(&parameters, PredefinedString.PRODUCT_ID.value()) as? String else { break }
            let value = "\(string)\(productId)"
            set(&parameters, CONVERSION_ID, value)
            break
        case .PRODUCT_ID:
            guard let orderId = get(&parameters, PredefinedString.ORDER_ID.value()) as? String else { break }
            let value = "\(orderId)\(string)"
            set(&parameters, CONVERSION_ID, value)
            break
        default:
            break
        }
    }

    private func hasKey(_ parameters: inout [(String, Any?)], _ predefined: String) -> Bool {
        for (key, _) in parameters {
            if key == predefined {
                return true
            }
        }
        return false
    }

    private func get(_ parameters: inout [(String, Any?)], _ predefined: String) -> Any? {
        for (key, value) in parameters {
            if key == predefined {
                return value
            }
        }
        return nil
    }
    
    private func set(_ parameters: inout [(String, Any?)], _ predefined: String, _ newValue: Any?) {
        delete(&parameters, predefined)
        parameters.append((predefined, newValue))
    }
    
    private func delete(_ parameters: inout [(String, Any?)], _ predefined: String) {
        for (idx, (key, _)) in parameters.enumerated() {
            if key == predefined {
                parameters.remove(at: idx)
                return
            }
        }
    }
}
