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
        
        view.backgroundColor = .white
        setupTabBar()
    }
    
    func setupTabBar() {
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: HomeViewController.identifier)
        
        viewControllers = [
            createNavController(for: homeViewController, title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "person")!),
            createNavController(for: LoginViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
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
