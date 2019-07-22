//
//  SiginIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NVActivityIndicatorView
import UIKit

class SignIn: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        if Connectivity.isConnectedToInternet() {
            startAnimating()
            let email = emailTextField.text
            let password = passwordTextField.text
            
            if email!.isEmpty || password!.isEmpty {
                stopAnimating()
                showAlert(message: "Complete the requird fields", title: "Empty fields")
                return
            }
            
            let signInParameters = ["email": email, "password": password] as! [String: String]
            Login.login(para: signInParameters) { (_: Error?, success: Bool) in
                if success {
                    self.performSegue(withIdentifier: "roomsSegue", sender: Any?.self)
                }
                else {
                    self.stopAnimating()
                    self.showAlert(message: "Invalied email or password", title: "Wrong credentials!")
                }
            }
        }
        else {
            stopAnimating()
            showAlert(message: "No Internet Connection", title: "Connection Failed")
        }
    }
    
    @IBAction func signInWithLinkedIn(_ sender: UIButton) {}
    
    @IBAction func signInWithTwitter(_ sender: UIButton) {}
    
    @IBAction func signInWithFacebook(_ sender: UIButton) {}
    
    @IBAction func signInWithGoogle(_ sender: UIButton) {}
    
    @IBAction func signUpButton(_ sender: UIButton) {}
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {}
}
