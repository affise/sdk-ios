//
//  InstallFirstEventProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.INSTALL_FIRST_EVENT]
 *
 * @property useCase to retrieve is first open from
 */
class InstallFirstEventProvider : BooleanPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> Bool? {
        return useCase.isFirstOpen()
    }
}
