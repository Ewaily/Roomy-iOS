//
//  SignUp.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/19/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NVActivityIndicatorView
import UIKit

class SignUp: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction private func signUpButton(_ sender: UIButton) {
        if Connectivity.isConnectedToInternet() {
            startAnimating()
            let name = nameTextField.text
            let email = emailTextField.text
            let password = passwordTextField.text
            let confirmPassword = confirmPasswordTextField.text
            
            if name!.isEmpty || email!.isEmpty || password!.isEmpty || confirmPassword!.isEmpty {
                stopAnimating()
                showAlert(message: "Complete the requird fields", title: "Empty fields")
                return
            }
            
            if password != confirmPassword {
                stopAnimating()
                showAlert(message: "Passwords don't match", title: "Wrong password")
                return
            }
            
            let signUpParameters = ["name": name, "email": email, "password": password] as! [String: String]
            Register.register(para: signUpParameters) { (_: Error?, success: Bool) in
                if success {
                    self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
                }
                else {}
            }
        }
        else {
            stopAnimating()
            showAlert(message: "No Internet Connection", title: "Connection Failed")
        }
    }
}
