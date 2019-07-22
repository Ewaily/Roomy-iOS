//
//  SiginIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class SignIn: UIViewController, UITextFieldDelegate {
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
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email!.isEmpty || password!.isEmpty {
            showAlert(message: "Complete the requird fields", title: "Empty fields")
            return
        }
        
        let signInParameters = ["email": email, "password": password] as! [String: String]
        Login.login(para: signInParameters) { (error: Error?, success: Bool) in
            if success {
                self.performSegue(withIdentifier: "roomsSegue", sender: Any?.self)
            }
            else {
                if !Connectivity.isConnectedToInternet(){
                    self.showAlert(message: "No Internet Connection", title: "Connection Failed")
                }
                self.showAlert(message: "Invalied email or password", title: "Wrong credentials!")
                print(error)
            }
        }
    }
    
    @IBAction func signInWithLinkedIn(_ sender: UIButton) {}
    
    @IBAction func signInWithTwitter(_ sender: UIButton) {}
    
    @IBAction func signInWithFacebook(_ sender: UIButton) {}
    
    @IBAction func signInWithGoogle(_ sender: UIButton) {}
    
    @IBAction func signUpButton(_ sender: UIButton) {}
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {}
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
