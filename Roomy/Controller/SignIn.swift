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
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction private func signInButton(_ sender: UIButton) {
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
    
    @IBAction private func signInWithLinkedIn(_ sender: UIButton) {}
    
    @IBAction private func signInWithTwitter(_ sender: UIButton) {}
    
    @IBAction private func signInWithFacebook(_ sender: UIButton) {
        performSegue(withIdentifier: "FBSegue", sender: self)
    }
    
    @IBAction private func signInWithGoogle(_ sender: UIButton) {}
    
    @IBAction private func signUpButton(_ sender: UIButton) {}
    
    @IBAction private func forgetPasswordButton(_ sender: UIButton) {}
}
