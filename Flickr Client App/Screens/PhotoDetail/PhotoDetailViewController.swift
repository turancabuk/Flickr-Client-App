//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by Turan Çabuk on 17.09.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Detail"
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton descripton"
        
        
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = photo?.ownername
        
        if let iconServer = photo?.iconserver,
           let iconFarm = photo?.iconfarm,
           let nsId = photo?.owner,
            NSString(string: iconServer).intValue > 0 {
            
            NetworkManager.shared.fetchImage(with: "http://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsId).jpg") { data in
                self.ownerImageView.image = UIImage(data: data)
            }
        }else{
            NetworkManager.shared.fetchImage(with: "https://www.flickr.com/images/buddyicon.gif") { data in
                self.ownerImageView.image = UIImage(data: data)
            }
        }
        
        
        NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
        title = photo?.title
        
        descriptionLabel.text = photo?.photoDescription?.content

    }
}
