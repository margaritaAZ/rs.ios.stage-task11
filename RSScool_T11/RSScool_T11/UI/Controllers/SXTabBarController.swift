//
//  SXTabBarController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import UIKit

class SXTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.barTintColor = .queenBlue
        tabBar.tintColor = .coral
        tabBar.unselectedItemTintColor = .champagne
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.roboto(10, .medium)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.roboto(10, .medium)], for: .highlighted)
    }
}
