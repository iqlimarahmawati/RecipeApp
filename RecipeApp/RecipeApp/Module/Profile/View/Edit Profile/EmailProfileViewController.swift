//
//  EmailProfileViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit

class EmailProfileViewController: UIViewController  {

    var editEmailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        return emailTextField
    }()
    
    var editEmailButton: UIButton = {
        let emailButton = UIButton()
        emailButton.setTitle("Save", for: .normal)
        return emailButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit Email"
        
        view.addSubview(editEmailTextField)
        editEmailTextField.layer.cornerRadius = 5
        editEmailTextField.layer.borderWidth = 1
        editEmailTextField.layer.borderColor = UIColor.black.cgColor
        editEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        editEmailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        editEmailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        editEmailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        editEmailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(editEmailButton)
        editEmailButton.layer.cornerRadius = 15
        editEmailButton.backgroundColor = .orange
//        editEmailButton.layer.borderColor = UIColor.black.cgColor
        editEmailButton.translatesAutoresizingMaskIntoConstraints = false
        
        editEmailButton.topAnchor.constraint(equalTo: editEmailTextField.bottomAnchor, constant: 25).isActive = true
//        editEmailButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
//        editEmailButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        editEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        editEmailButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        editEmailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    


}
