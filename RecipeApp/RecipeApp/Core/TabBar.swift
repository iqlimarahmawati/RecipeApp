//
//  TabBar.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 10/04/23.
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
        let profileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ProfileViewController.identifier)
        
        viewControllers = [
            createNavController(for: homeViewController, title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: profileViewController, title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!),            
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.tintColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
}
