//
//  ViewController.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import UIKit
import RxSwift

class ViewController: BaseViewController {
    
    var viewModel: ViewModel!
    
    private let dispose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home ViewController"
        
        viewModel = ViewModel()
    }


    @IBAction func didTappedToMoveNextScreen(_ sender: UIButton) {
        
        viewModel.photoesList.bind {[weak self] photos in
            if photos.count > 0 {
                DispatchQueue.main.async {
                    self?.hideProgressBar()
                    self?.moveToListScreen(with: photos)
                }
            }
        }.disposed(by: dispose)
        
        // call the api if no records available
        if viewModel.photoesList.value.count < 1 {
            showProgressBar()
            viewModel.fetchPhotoesFromRemote()
        }
        
    }
    
    private func moveToListScreen(with photoes: [PhotosResponse]) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
            vc.listVMdodel = ListViewModel(photoesList: photoes)
           self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

