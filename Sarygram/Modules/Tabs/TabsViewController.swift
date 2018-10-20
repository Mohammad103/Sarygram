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
        
        createGradientLayerForHomeButton()
        tabsButtonsView.addShadow(location: .top, color: UIColor.black, opacity: 0.62, radius: 0.5, height: 0.1)
    }
    

    func createGradientLayerForHomeButton() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = homeButtonView.bounds
        gradientLayer.locations = [0.0 , 1.2]
        gradientLayer.colors = [UIColor.hexColor(hex: "3023ae").cgColor, UIColor.hexColor(hex: "c86dd7").cgColor]
        homeButtonView.layer.insertSublayer(gradientLayer, at: 0)
    }

}
