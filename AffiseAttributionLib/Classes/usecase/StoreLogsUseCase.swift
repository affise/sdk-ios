//
//  StoreLogsUseCase.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * UseCase store logs interface
 */
internal protocol StoreLogsUseCase {

    /**
     * Store log
     */
    func storeLog(log: AffiseLog)
}
