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
        
        DispatchQueue.global(qos: .background).async {[weak self] in
            self?.downloadImage(from: model.thumbanilSmallUrl)
        }
    }
    
    private func downloadImage(from url: String?) {
        guard let urlString = url else { return }
        
        ServiceManager.downloadFile(from: urlString) { result in //Result<Data?, ServiceNetworkError>
            switch result {
            case .success(let imageData):
                if let imgData = imageData {
                    let image = UIImage(data: imgData)
                    DispatchQueue.main.async {
                        self.thumbnail.image = image
                    }
                }
                
            default:
                break
            }
        }
    }
    
}
