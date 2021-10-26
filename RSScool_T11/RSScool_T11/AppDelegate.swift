//
//  AppDelegate.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let tabBarController = SXTabBarController()
        
        let rocketsListVC = RocketsListViewController()
        rocketsListVC.tabBarItem = UITabBarItem(title: "Rockets", image: UIImage(named: "rocket"), tag: 0)
        
        let launchesListVC = LaunchesListViewController()
        launchesListVC.tabBarItem = UITabBarItem(title: "Launches", image: UIImage(named: "adjustment"), tag: 1)
        
        tabBarController.viewControllers = [SXNavigationController(rootViewController: rocketsListVC), SXNavigationController(rootViewController:launchesListVC)]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

