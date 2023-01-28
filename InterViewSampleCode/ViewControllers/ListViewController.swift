//
//  ListViewController.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import UIKit

class ListViewController: BaseViewController {

    //var photoes: [PhotosResponse]?
    var listVMdodel: ListViewModel!
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photoes List"
        
    }
    

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVMdodel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = listVMdodel[at: indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        cell.textLabel?.text = "\(String(describing: model?.photoID))"
        cell.detailTextLabel?.text = model?.title
        return cell
    }
}
