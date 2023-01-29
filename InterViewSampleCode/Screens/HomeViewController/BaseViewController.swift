//
//  BaseViewController.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    func showProgressBar() {
        DispatchQueue.main.async {[weak self] in
            guard let selfWeak = self else { return }
            MBProgressHUD.showAdded(to: selfWeak.view, animated: true)
        }
    }
    
    func hideProgressBar() {
        DispatchQueue.main.async {[weak self] in
            guard let selfWeak = self else { return }
            MBProgressHUD.hide(for: selfWeak.view, animated: true)
        }
    }

}
