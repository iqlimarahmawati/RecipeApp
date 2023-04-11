//
//  TabBar.swift
//  RecipeApp
//
//  Created by Muhammad Syabran on 10/04/23.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupTabBar() {
        viewControllers = [
            createNavController(for: LoginViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: LoginViewController(), title: NSLocalizedString("Discover", comment: ""), image: UIImage(systemName: "house")!),
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = false
           rootViewController.navigationItem.title = title
           return navController
       }
}
