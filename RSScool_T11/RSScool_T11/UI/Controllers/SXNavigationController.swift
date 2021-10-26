//
//  SXNavigationController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import UIKit

class SXNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .queenBlue
        navigationBar.tintColor = .coral
    }
}
