//
//  ServiceManager.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

//https://jsonplaceholder.typicode.com/photos   : For list view controller with photo
//https://jsonplaceholder.typicode.com/comments?postId=3   : get post list with ID. GET type API

class ServiceManager {
    
    
    static func configure(with environment: Environment) {
        baseURL = environment.rawValue
    }
    
    
    static func fetch<T: Decodable>(with request: URLRequest, sessionType: ServiceURLSession, completion: @escaping (Result<T, ServiceNetworkError>) -> Void) {
        
        let dataTask = sessionType.sessionWithConfig().dataTask(with: request) { data, response, error in
            
            guard let httpRes = response as? HTTPURLResponse else {
                return completion(.failure(.requestFail))
            }
        
            switch httpRes.statusCode {
            case 200...299:
                if let responseData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData)
                        let jsondData = try JSONDecoder().decode(T.self, from: responseData)
                        completion(.success(jsondData))
                    }catch let error {
                        completion(.failure(.invalidJson(statusCode: httpRes.statusCode, error: error)))
                    }
                }
                    
            case 400...499:
                completion(.failure(.clientError(statusCode: httpRes.statusCode, urlString: httpRes.url?.absoluteString ?? "uknown url")))
            case 500...599:
                completion(.failure(.serverError(statusCode: httpRes.statusCode, urlString: httpRes.url?.absoluteString ?? "uknown url")))
            default:
                completion(.failure(.hostDown))
            }
        }
        dataTask.resume()
    }
    
    static func fetch<T: Decodable>(with urlString: String, sessionType: ServiceURLSession = .default , completion: @escaping (Result<T, ServiceNetworkError>) -> Void) {
        guard let url = URL(string: urlString)  else {
            completion(.failure(.invalidURL(urlString: urlString)))
            return
        }
        
        let task = sessionType.sessionWithConfig().dataTask(with: url, completionHandler: { data, response, error in
            guard let httpRes = response as? HTTPURLResponse else {
                return completion(.failure(.requestFail))
            }
        
            switch httpRes.statusCode {
            case 200...299:
                if let responseData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData)
                        let jsondData = try JSONDecoder().decode(T.self, from: responseData)
                        completion(.success(jsondData))
                    }catch let error {
                        completion(.failure(.invalidJson(statusCode: httpRes.statusCode, error: error)))
                    }
                }
                    
            case 400...499:
                completion(.failure(.clientError(statusCode: httpRes.statusCode, urlString: httpRes.url?.absoluteString ?? "uknown url")))
            case 500...599:
                completion(.failure(.serverError(statusCode: httpRes.statusCode, urlString: httpRes.url?.absoluteString ?? "uknown url")))
            default:
                completion(.failure(.hostDown))
            }
        })
        task.resume()
        
    }
    
}
