//
//  StoreLogsUseCaseImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Logs use case for store logs on device
 *
 * @property executorServiceProvider an Executor that provides methods to manage termination and methods
 * @property repository the logs repository provide write, read and delete logs.
 */
internal class StoreLogsUseCaseImpl : StoreLogsUseCase {
    
    private let repository: LogsRepository
    
    init(repository: LogsRepository) {
        self.repository = repository
    }

    /**
     * Store [log]
     */
    func storeLog(log: AffiseLog) {
        //Execute in executor service
        DispatchQueue.global(qos:.background).async { [weak self] in
            //Store log
            self?.repository.storeLog(log: log, urls: CloudConfig.urls)
        }
    }
}
