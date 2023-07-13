//
//  DeeplinkClickPropertyProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for property [Parameters.DEEPLINK_CLICK]
 *
 * @property deeplinkClickRepository to retrieve network is deeplink
 */
class DeeplinkClickPropertyProvider : BooleanPropertyProvider {
   private let deeplinkClickRepository: DeeplinkClickRepository
   
   init(deeplinkClickRepository: DeeplinkClickRepository) {
       self.deeplinkClickRepository = deeplinkClickRepository
   }
   
   override func provide() -> Bool? {
       return deeplinkClickRepository.isDeeplinkClick()
   }
   
    override func getOrder() -> Float {
        25.0
    }

    override func getKey() -> String? {
        Parameters.DEEPLINK_CLICK
    }
}
