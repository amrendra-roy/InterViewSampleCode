//
//  APIInterfaceUtility.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

// a protocol that will contain apis only for list and related
protocol ListViewProtocol {
    static func fetchPhotoes(handler: @escaping(Result<[PhotosResponse], ServiceNetworkError>) -> Void)
    static func fetchPhotoesFromURL(handler: @escaping(Result<[PhotosResponse], ServiceNetworkError>) -> Void)
}




class APIInterfaceUtility: ListViewProtocol {
    
    static func fetchPhotoes(handler: @escaping(Result<[PhotosResponse], ServiceNetworkError>) -> Void) {
        let req = PhotosRequest()
        
       return ServiceManager.fetch(with: req.request, sessionType: .default) { result in //Result<Decodable, ServiceNetworkError>
           handler(result)
           // Do not use this, getting error like T can not infferd, so return and use switch case in view controller
//            switch result {
//            case .success(let jsonClass):
//                print("json success = \(jsonClass)")
//                handler(result)
//            case .failure(let error):
//                print("failure error = \(error)")
//                handler(result)
//            }
            
        }
    }
    
    static func fetchPhotoesFromURL(handler: @escaping(Result<[PhotosResponse], ServiceNetworkError>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/photos"
        return ServiceManager.fetch(with: url, sessionType: .default) { result in
            handler(result)
        }
    }
}
