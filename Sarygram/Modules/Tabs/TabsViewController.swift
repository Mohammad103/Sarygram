//
//  TabsViewController.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit

class TabsViewController: UIViewController {

    @IBOutlet weak var homeButtonView: UIView!
    @IBOutlet weak var tabsButtonsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientColors = [UIColor.mainAppColor.cgColor, UIColor.secondaryAppColor.cgColor]
        homeButtonView.addGradientLayer(colors: gradientColors, locations: [0.0 , 1.2])
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabsButtonsView.layer.addBorder(edge: .top, color: UIColor.lightGray, thickness: 0.2)
    }
}
