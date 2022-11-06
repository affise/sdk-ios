//
//  Errors.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

enum AffiseError: Error {
    case cloud(url: String, error: Error, attempts: Int, retry: Bool)
    case network(status: Int, message: String?)
    case offlineModeEnabled
    case trackingDisabledException
    case backgroundTrackingDisabledException
}
