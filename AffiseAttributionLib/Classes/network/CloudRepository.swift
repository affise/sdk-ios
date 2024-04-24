//
//  CloudRepository.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Cloud repository interface
 */
protocol CloudRepository {

    /**
     * Send [data] to current [url]
     */
    func send(data: Array<PostBackModel>, url: String) throws
    
    /**
     * Send [data] to [url]
     */
    func createRequest(url: String, data: [PostBackModel]) -> HttpResponse 
}
