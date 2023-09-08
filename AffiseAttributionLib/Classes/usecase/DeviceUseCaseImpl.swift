class DeviceUseCaseImpl {
    
    func emulatorCheck() -> Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
}

extension DeviceUseCaseImpl: DeviceUseCase {
    
    func isEmulator() -> Bool {
        return emulatorCheck()
    }
}
