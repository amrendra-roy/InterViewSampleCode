//
//  PhotosRequest.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

struct PhotosRequest: Codable {
   //No need to send any parameter as body
    init() {
        
    }
}

extension PhotosRequest: ServiceEndPoint {
    var urlPath: String {
        return "photos"
    }
    
    var request: URLRequest {
        var req = URLRequest(url: self.requestUrl())
        req.httpBody = jsonfyData()
        //req.httpMethod = "GET"
        req.httpMethod = "POST"
        req.allHTTPHeaderFields = ["Content-Type":"application/json"]
        return req
    }
}


