//
//  StoreEventUseCase.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Event use case for store events
 */
protocol StoreEventUseCase {

    /**
     * Store event
     */
    func storeEvent(event: Event)

    /**
     * Store web event
     */
    func storeWebEvent(event: String)
}
