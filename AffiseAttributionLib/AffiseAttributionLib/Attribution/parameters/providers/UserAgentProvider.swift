//
//  UserAgentProvider.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation
import WebKit

/**
 * Provider for parameter [Parameters.USER_AGENT]
 */
internal class UserAgentProvider : StringPropertyProvider {
    private let useCase: WebViewUseCase
    
    init(useCase: WebViewUseCase) {
        self.useCase = useCase
    }

    override func provide() -> String? {
        return useCase.getUserAgent()
    }
    
}
