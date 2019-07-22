//
//  SignUp.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/19/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Alamofire
import UIKit

class SignUp: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if name!.isEmpty || email!.isEmpty || password!.isEmpty || confirmPassword!.isEmpty {
            showAlert(message: "Complete the requird fields", title: "Empty fields")
            return
        }
        
        if password != confirmPassword {
            showAlert(message: "Passwords don't match", title: "Wrong password")
            return
        }
        
        let signUpParameters = ["name": name, "email": email, "password": password] as! [String: String]
        Register.register(para: signUpParameters) { (error: Error?, success: Bool) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
            }
            else {
                print(error)
            }
        }
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
