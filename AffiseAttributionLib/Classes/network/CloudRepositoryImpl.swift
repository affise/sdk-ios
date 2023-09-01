//
//  CloudRepositoryImpl.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

internal class CloudRepositoryImpl {

    private let ATTEMPTS_TO_SEND = 3
    private let TIMEOUT_SEND: TimeInterval = 30

    private let networkService: NetworkService
    private let userAgentProvider: UserAgentProvider?
    private let converter: PostBackModelToJsonStringConverter

    init(networkService: NetworkService,
         userAgentProvider: UserAgentProvider?,
         converter: PostBackModelToJsonStringConverter) {
        
        self.networkService = networkService
        self.userAgentProvider = userAgentProvider
        self.converter = converter
    }
    
    /**
     * Send [data] to [url]
     */
    private func createRequest(url: String, data: Array<PostBackModel>) throws {
        
        let httpsUrl = URL(string: url)!
        
        let jsonString = converter.convert(from: data)
        let sendData = jsonString.data(using: .utf8)!
//        let sendData = try JSONSerialization.data(withJSONObject: dictArray, options: .prettyPrinted)
        
        //Create request
        let (data, response) = try networkService.executeRequest(httpsUrl: httpsUrl,
                                                                 method: .POST,
                                                                 data: sendData,
                                                                 timeout: TIMEOUT_SEND,
                                                                 headers: createHeaders())
        if (response.statusCode != 200) {
            var message: String?
            if let data = data {
                message = String.init(data: data, encoding: .utf8)
            }
            throw AffiseError.network(status: response.statusCode, message: message)
        }
    }

    /**
     * Create headers
     */
    private func createHeaders() -> Dictionary<String, String> {
        return [
            "User-Agent" : (userAgentProvider?.provideWithDefault() ?? ""),
            "Content-Type" : "application/json; charset=utf-8"
        ]
    }
}


extension CloudRepositoryImpl: CloudRepository {
    
    /**
     * Send [data] for [url] if [url]
     * @throws CloudException contains throwable for url
     */
    func send(data: Array<PostBackModel>, url: String) throws {
        //attempts to send
        var attempts = ATTEMPTS_TO_SEND
        
        //Send or not
        var send = false
        
        //While has attempts and not send
        while (attempts != 0 && !send) {
            do {
                //Create request
                try createRequest(url: url, data: data)
                
                //Send is ok
                send = true
            } catch {
                attempts = attempts - 1
                //Check attempts
                if (attempts == 0) {
                    //Add throwable
                    throw AffiseError.cloud(url: url, error: error, attempts: ATTEMPTS_TO_SEND, retry: true)
                }
            }
        }
    }
}
