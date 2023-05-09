//
//  EditPasswordViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit

class EditPasswordViewController: UIViewController {

    var editPasswordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        return passwordTextField
    }()
    
    var editPasswordButton: UIButton = {
        let passwordbutton = UIButton()
        passwordbutton.setTitle("Save", for: .normal)
        return passwordbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit Password"
        
        view.addSubview(editPasswordTextField)
        editPasswordTextField.layer.cornerRadius = 5
        editPasswordTextField.layer.borderWidth = 1
        editPasswordTextField.layer.borderColor = UIColor.black.cgColor
        editPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        editPasswordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        editPasswordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        editPasswordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        editPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(editPasswordButton)
        editPasswordButton.backgroundColor = .orange
        editPasswordButton.layer.cornerRadius = 15
        editPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        editPasswordButton.topAnchor.constraint(equalTo: editPasswordTextField.bottomAnchor, constant: 25).isActive = true
        editPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        editPasswordButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        editPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
