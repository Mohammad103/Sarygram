//
//  UserHomeCollectionViewCell.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import Kingfisher

class UserHomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [profileImageView, nameLabel].forEach {
            $0.showAnimatedSkeleton()
        }
    }
    
    func hideSkeletonAnimations() {
        [profileImageView, nameLabel].forEach {
            $0?.hideSkeleton()
        }
    }
    
    func setupCell(withUser user: User) {
        self.nameLabel.text = user.userName
        
        let imageURL = URL(string: user.profileImage ?? "")
        self.profileImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "user-placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
