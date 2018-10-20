//
//  HomeViewController.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {

    @IBOutlet weak var cameraButtonView: UIView!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var postsTableView: UITableView!
    
    private var viewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientColors = [UIColor.mainAppColor.cgColor, UIColor.secondaryAppColor.cgColor]
        cameraButtonView.addGradientLayer(colors: gradientColors, locations: [0.0 , 1.2])
        postsTableView.tableFooterView = UIView()
        
        viewModel.delegate = self
        viewModel.loadUsers()
        viewModel.loadPosts()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        cameraButtonView.roundCorners(corners: [.topRight, .bottomRight], radius: cameraButtonView.frame.height / 2)
    }
}


extension HomeViewController: HomeViewModelDelegate {
    func usersLoadedSuccessfully() {
        usersCollectionView.reloadData()
    }
    
    func usersFailedWithError(_ errorMessage: String) {
        AlertUtility.showErrorAlert(message: errorMessage, inViewController: self)
    }
    
    func postsLoadedSuccessfully() {
        postsTableView.reloadData()
    }
    
    func postsFailedWithError(_ errorMessage: String) {
        AlertUtility.showErrorAlert(message: errorMessage, inViewController: self)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.usersCount() == 0 {
            return 10 // Show skeleton animation
        }
        return viewModel.usersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserHomeCollectionViewCell", for: indexPath) as! UserHomeCollectionViewCell
        if viewModel.usersCount() > 0 {
            cell.hideSkeletonAnimations()
            cell.setupCell(withUser: viewModel.user(atIndex: indexPath.row))
        }
        return cell
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.postsCount() == 0 {
            return 3 // Show skeleton animation
        }
        return viewModel.postsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostHomeTableViewCell", for: indexPath) as! PostHomeTableViewCell
        if viewModel.postsCount() > 0 {
            cell.hideSkeletonAnimations()
            cell.setupCell(withPost: viewModel.post(atIndex: indexPath.row))
        }
        return cell
    }
}
