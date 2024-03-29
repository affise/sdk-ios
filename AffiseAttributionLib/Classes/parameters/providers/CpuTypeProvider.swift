import Foundation

/**
 * Provider for parameter [ProviderType.CPU_TYPE]
 */
class CpuTypeProvider: StringPropertyProvider {

    override func provide() -> String? {
        return getCPUName()
    }
    
    private func getCPUName() -> String {
        let processorName = CPUinfo()
        return processorName
    }
    
    private func CPUinfo() -> String {
#if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
#else
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
#endif
        return identifier
    }
    
    public override func getOrder() -> Float {
        22.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.CPU_TYPE
    }
}
