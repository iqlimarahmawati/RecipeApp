//
//  LoginViewController.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati 10/04/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var buttonCreated: UIButton!
    
    private let database = Firestore.firestore()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginOnTap(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) //jgn pake !
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.showToast(message: "Login Failed, \(error?.localizedDescription ?? "")", font: .systemFont(ofSize: 12), color: .red)
                
            } else {
                self.database.collection("users").whereField("email", isEqualTo: email).getDocuments { (snapshot, error) in
                    for snap in snapshot!.documents {
                        let userID = snap.documentID
                        let userName = snap.data()["fullName"] as? String
                        if userID != "" {
                            self.defaults.set(userID, forKey: "user_id")
                            self.defaults.set(email, forKey: "user_email")
                            self.defaults.set(userName, forKey: "user_name")
                            
                            let home = TabBar()
                            self.view.window?.rootViewController = home
                            self.view.window?.makeKeyAndVisible()
                        }
                    }
                }
            }
        }
    }
    
    func registerViewController() {
        let register = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.view.window?.rootViewController = register
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func moveToRegister(_ sender: Any) {
        registerViewController()
    }
}

//MARK: BUAT FIREBASE AUTENTICATIONS // YT : CodeWithChris
// 1. REGISTER APP
// 2. DOWNLOAD CONFIG FILE
// 3. ADD FIREBASE SDK
// 4. ADD INISIALISATION CODE DI APP DELEGET(CORE)

