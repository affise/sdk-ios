//
//  EventsFactory.swift
//  app
//
//  Created by Sergey Korney
//

import AffiseAttributionLib

protocol EventsFactory {
    func createEvents() -> [Event]
}
