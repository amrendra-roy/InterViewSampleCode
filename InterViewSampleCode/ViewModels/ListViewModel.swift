//
//  ListViewModel.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation
import RxCocoa

class ListViewModel {
    
    // MARK: - Public stuff
    //var photoesList: BehaviorRelay<[PhotosResponse]>?
    var photoesList: [PhotosResponse]?
    
    init(photoesList: [PhotosResponse]? = nil) {
        self.photoesList = photoesList
    }
    
    /*func fetchPhotoesFromRemote() {
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
    }*/
    
    
    func numberOfRowsInSection() -> Int {
        return photoesList?.count ?? 0
    }
    
    subscript (at index: Int) -> PhotosResponse? {
        return photoesList?[index]
    }
}
