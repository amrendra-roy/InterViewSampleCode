//
//  ServiceEndPoint.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

var baseURL = "https://baseurl/"
enum Environment: String {
    case Dev = "https://jsonplaceholder.typicode.com/"
    case Staging = "https://staging/"
    case Prod = "https://prod/"
    
}

protocol ServiceEndPoint {
    var urlPath:String { get }
    func jsonfyData() -> Data?
}

extension ServiceEndPoint where Self: Codable {
    func requestUrl() -> URL {
        let urlComponent = URLComponents(string: baseURL + urlPath)
        //let path = urlComponent?.path
        let url = urlComponent?.url
        //print("path = \(path)")
        //print("url = \(url)")
        return url!
    }
    
    func jsonfyData() -> Data? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            print("Json data for body = \(jsonData)")
            
            //let decoded = try JSONDecoder().decode(PhotosRequest.self, from: jsonData)
            //print("decoded data = \(decoded)")
            return jsonData
        }catch  let error {
            print("Error in jsonfyData = \(error)")
        }
        return nil
    }
    
}
