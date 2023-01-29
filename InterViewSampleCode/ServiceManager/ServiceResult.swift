//
//  ServiceResult.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

enum Result<T, E> where E: Error {
    case success(T)
    case failure(E)
}


enum ServiceNetworkError: Error {
    case requestFail
    case invalidURL(urlString: String)
    case invalidJson(statusCode: Int, error: Error?)
    case hostDown
    case networkNotAvailable
    
    case clientError(statusCode: Int, urlString: String) //Client error responses (400 – 499)
    case serverError(statusCode: Int, urlString: String) //Server error responses (500 – 599)
    
//    Informational responses (100 – 199)
//    Successful responses (200 – 299)

}


enum ServiceURLSession {
    case `default`
    case `ephemeral`
    case `background`

    func sessionWithConfig() -> URLSession {
        switch self {
        case .`default`:
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 60
            return URLSession(configuration: config)
            
        case .`ephemeral`:
            let config = URLSessionConfiguration.ephemeral
            config.timeoutIntervalForRequest = 60
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
            config.urlCache = nil
            return URLSession(configuration: config)
            
        case .`background`:
            let config = URLSessionConfiguration.background(withIdentifier: "com.amar.background.api.session")
            config.timeoutIntervalForRequest = 60
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
            config.urlCache = nil
            return URLSession(configuration: config)
        }
    }
}
