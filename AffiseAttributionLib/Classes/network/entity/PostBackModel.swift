//
//  PostBackModel.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


struct PostBackModel {
    let parameters: [(String, Any?)]
    
    let events: Array<SerializedEvent>?
    let logs: Array<SerializedLog>?
    let metrics: Array<SerializedEvent>?
    let internalEvents: Array<SerializedEvent>?
}
