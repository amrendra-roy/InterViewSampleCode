//
//  ListViewController.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import UIKit

class ListViewController: BaseViewController {

    var listVMdodel: ListViewModel!
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photoes List"
        
        tblView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVMdodel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell,
            let model = listVMdodel[at: indexPath.row] {
            
            cell.configureCell(using: model)
            return cell
        }
        return UITableViewCell()
    }
}
