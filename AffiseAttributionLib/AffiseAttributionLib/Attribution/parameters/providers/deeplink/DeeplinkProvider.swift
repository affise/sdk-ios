//
//  DeeplinkProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_DEEPLINK]
 *
 * @property deeplinkClickRepository to retrieve deeplink
 */
class DeeplinkProvider : StringPropertyProvider {
    private let deeplinkClickRepository: DeeplinkClickRepository
    
    init(deeplinkClickRepository: DeeplinkClickRepository) {
        self.deeplinkClickRepository = deeplinkClickRepository
    }
    
    override func provide() -> String? {
        return deeplinkClickRepository.getDeeplink()
    }
    
    override func getOrder() -> Float {
        58.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_DEEPLINK
    }
}
