//
//  NetworkServiceImpl.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

class NetworkServiceImpl {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession;
    }
}

extension NetworkServiceImpl: NetworkService {
    func executeRequest(httpsUrl: URL,
                        method: NetworkServiceMethod,
                        data: Data,
                        timeout: TimeInterval,
                        headers: Dictionary<String, String>) throws -> (Data?, HTTPURLResponse) {
        
        var request = URLRequest.init(url: httpsUrl)
        request.httpMethod = method.rawValue
        request.httpShouldHandleCookies = false;
        request.httpBody = data
        let contentLength = "\(data.count)"
        request.addValue(contentLength, forHTTPHeaderField: "Content-Length")
        request.timeoutInterval = timeout
        
        headers.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        request.addValue("must-revalidate, no-store, no-cache", forHTTPHeaderField: "Cache-Control")
        
        var result: Data?
        var response: URLResponse?
        var error: Error?
        
        var complete: Bool = false
        
        let task = urlSession.dataTask(with: request) { data, resp, err in
            result = data
            response = resp
            error = err

            complete = true
        }
        task.resume()
        
        while !complete {
            Thread.sleep(forTimeInterval: 1)
        }
        
        if let error = error {
            throw error
        }
        
        return (result, response as! HTTPURLResponse)
    }
}
