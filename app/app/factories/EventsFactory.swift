//
//  EventsFactory.swift
//  app
//
//  Created by Sergey Korney
//

import AfficeAttributionLib

protocol EventsFactory {
    func createEvents() -> [Event]
}
