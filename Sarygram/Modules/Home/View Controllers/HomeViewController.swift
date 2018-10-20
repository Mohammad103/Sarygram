//
//  HomeViewController.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cameraButtonView: UIView!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var postsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientColors = [UIColor.mainAppColor.cgColor, UIColor.secondaryAppColor.cgColor]
        cameraButtonView.addGradientLayer(colors: gradientColors, locations: [0.0 , 1.2])
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        cameraButtonView.roundCorners(corners: [.topRight, .bottomRight], radius: cameraButtonView.frame.height / 2)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserHomeCollectionViewCell", for: indexPath) as! UserHomeCollectionViewCell
        return cell
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostHomeTableViewCell", for: indexPath) as! PostHomeTableViewCell
        return cell
    }
    
    
}
