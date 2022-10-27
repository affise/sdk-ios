//
//  NetworkService.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Method of connection
 */
enum NetworkServiceMethod: String {
    case GET = "GET"
    case POST = "POST"
}

protocol NetworkService {
    
    /**
     * Create request and execute result
     * Executes [method] on url [httpsUrl] with body of [data] and [headers]
     *
     * @return string representation of request
     */
    func executeRequest(httpsUrl: URL,
                        method: NetworkServiceMethod,
                        data: Data,
                        timeout: TimeInterval,
                        headers: Dictionary<String, String>) throws -> (Data?, HTTPURLResponse)
}
