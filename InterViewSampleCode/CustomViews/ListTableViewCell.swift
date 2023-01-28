//
//  ListTableViewCell.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(using model: PhotosResponse) {
        headingLbl.text = model.photoID.description
        subTitleLbl.text = model.title
        
        downloadImage(from: model.thumbanilSmallUrl)
    }
    
    private func downloadImage(from url: String?) {
        guard let urlString = url else { return }
        // #ToDo download images
        
    }
    
}
