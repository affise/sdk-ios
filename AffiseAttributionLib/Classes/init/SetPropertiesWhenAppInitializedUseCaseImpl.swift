//
//  SetPropertiesWhenAppInitializedUseCaseImpl.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * UseCase when user provided properties is stored to storage on app init.
 *
 * @property storage the storage for initiative sdk property.
 */
class SetPropertiesWhenAppInitializedUseCaseImpl {
    let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
}

extension SetPropertiesWhenAppInitializedUseCaseImpl: SetPropertiesWhenAppInitializedUseCase {
    
    /**
     * Init SetPropertiesWhenAppInitializedUseCase with [initProperties]
     */
    func initialize(initProperties: AffiseInitProperties) {
        storage.setProperties(initProperties)
    }
}
