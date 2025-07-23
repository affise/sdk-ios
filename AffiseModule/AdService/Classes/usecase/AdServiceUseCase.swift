import Foundation

protocol AdServiceUseCase {
    
    func initialize()

    func getAttributionToken() -> String?
}