//
//  ViewModel.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    // MARK: - Public stuff
    var photoesList = BehaviorRelay<[PhotosResponse]>(value:[])
    
    
    func fetchPhotoesFromRemote() {
        APIInterfaceUtility.fetchPhotoesFromURL {[weak self] result in
            switch result {
            case .success(let response):
                //print("response  = \(response)")
                self?.photoesList.accept(response)
            case .failure(let error):
                print("error is = \(error)")
                self?.photoesList.accept([])
            }
        }
    }
    
}
