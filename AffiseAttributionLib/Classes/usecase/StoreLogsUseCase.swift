//
//  StoreLogsUseCase.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * UseCase store logs interface
 */
internal protocol StoreLogsUseCase {

    /**
     * Store log
     */
    func storeLog(log: AffiseLog)
}
