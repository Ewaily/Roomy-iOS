//
//  SiginIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class SignIn: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
    }
    
    
    @IBAction func signInWithLinkedIn(_ sender: UIButton) {
    }
    
    @IBAction func signInWithTwitter(_ sender: UIButton) {
    }
    
    @IBAction func signInWithFacebook(_ sender: UIButton) {
    }
    
    @IBAction func signInWithGoogle(_ sender: UIButton) {
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {
    }
    
}
