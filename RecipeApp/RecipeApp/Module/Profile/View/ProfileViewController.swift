//
//  ProfileViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit

class ProfileViewController: UIViewController {

    static let identifier = "ProfileViewController"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var viewTableView: UIView!
    @IBOutlet weak var profileTableView: UITableView!
    
    var profileData: [ProfileModel] = []
    var editModel = ["Name", "Email", "Password","Logout"]
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView()
        getData()
        
        profileView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.identifier)
        profileTableView.isScrollEnabled = false
    }
    
    func customView() {
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2 // lingkaran
        self.profileImageView.image = UIImage(named: "profile")
        
        profileNameLabel.textAlignment = .center
        
        profileEmailLabel.textAlignment = .center
    }
    
    func getData() {
//        let userId = userDefaults.value(forKey: "user_id")
        
        let userEmail = userDefaults.value(forKey: "user_email")
        self.profileEmailLabel.text = userEmail as? String ?? "Email"
        
        let userName = userDefaults.value(forKey: "user_name")
        self.profileNameLabel.text = userName as? String ?? "Name"
    }
    
    
    func removeUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "user_email")
        UserDefaults.standard.removeObject(forKey: "user_name")
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.editLabel.text = editModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let edit = editModel[indexPath.row]
        if edit == "Name" {
            let viewController = EditNameViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        if edit == "Email" {
            let viewController = EmailProfileViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        if edit == "Password" {
            let viewController = EditPasswordViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        if edit == "Logout" {
            self.removeUserDefaults()
            let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            self.view.window?.rootViewController = login
            self.view.window?.makeKeyAndVisible()
        }
        
        
        
    }
}
