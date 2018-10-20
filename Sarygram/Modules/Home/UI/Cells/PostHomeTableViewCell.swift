//
//  PostHomeTableViewCell.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit

class PostHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [profileImageView, nameLabel, countryLabel, timeLabel, postImageView].forEach {
            $0.showAnimatedSkeleton()
        }
    }
    
    func hideSkeletonAnimations() {
        [profileImageView, nameLabel, countryLabel, timeLabel, postImageView].forEach {
            $0?.hideSkeleton()
        }
    }
    
    func setupCell(withPost post: Post) {
        self.nameLabel.text = post.userName
        self.countryLabel.text = post.country
        
        let profileImageURL = URL(string: post.profileImage ?? "")
        self.profileImageView.kf.setImage(with: profileImageURL, placeholder: UIImage(named: "user-placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        
        let postImageURL = URL(string: post.postImage ?? "")
        self.postImageView.kf.setImage(with: postImageURL, placeholder: UIImage(named: "photo-placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        
        
        
        let dateFormatter = ISO8601DateFormatter()
        let dateTime = dateFormatter.date(from: post.date ?? "")
        self.timeLabel.text = dateTime?.timeAgoSince()
    }
    
}
