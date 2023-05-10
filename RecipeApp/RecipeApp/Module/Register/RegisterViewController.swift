//
//  RegisterViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    static let identifier = "RegisterViewController"
    
    @IBOutlet weak var fullNameRegisterTextField: UITextField!
    @IBOutlet weak var emailRegisterTextField: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonAlready: UIButton!
    
    private let database = Firestore.firestore()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func validateTextField() -> String? {
        if fullNameRegisterTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailRegisterTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordRegisterTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all data"
        }
        return nil
    }
    
    func loginViewController() {
        let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.view.window?.rootViewController = login
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func registerOnTap(_ sender: Any) {
        let toast = validateTextField()
        if toast != nil {
            self.showToast(message: toast ?? "", font: .systemFont(ofSize: 12.0), color: .red)
            
        } else {
            let fullName = fullNameRegisterTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailRegisterTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordRegisterTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.showToast(message: "Register Failed, \(error?.localizedDescription ?? "")", font: .systemFont(ofSize: 12.0), color: .red)
                    
                } else {
                    self.database.collection("users").addDocument(data: ["fullName": fullName, "email": email, "password": password]) { error in
                        if error != nil {
                            self.showToast(message: "Saving user data failed, \(error?.localizedDescription ?? "")", font: .systemFont(ofSize: 12), color: .red)
                            
                        } else {
                            self.showToast(message: "Register Success! You can Login with your Email and Password", font: .boldSystemFont(ofSize: 14), color: .white)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func moveToLogin(_ sender: Any) {
        self.loginViewController()
    }
}
