//
//  EditNameViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit

class EditNameViewController: UIViewController {

    var editNameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Nama Lengkap"
        return nameTextField
    }()
    
    var editNameButton: UIButton = {
        let nameButton = UIButton()
        nameButton.setTitle("Save", for: .normal)
        return nameButton
    }()
    
    var nameProfile: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Name"
                
        view.addSubview(editNameTextField)
        editNameTextField.layer.cornerRadius = 15
        editNameTextField.layer.borderWidth = 1
        editNameTextField.layer.borderColor = UIColor.black.cgColor
        editNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        editNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        editNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        editNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        editNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(editNameButton)
        editNameButton.backgroundColor = .orange
        editNameButton.layer.cornerRadius = 15
        editNameButton.translatesAutoresizingMaskIntoConstraints = false
        editNameButton.topAnchor.constraint(equalTo: editNameTextField.bottomAnchor, constant: 25).isActive = true
        editNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        editNameButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        editNameButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
