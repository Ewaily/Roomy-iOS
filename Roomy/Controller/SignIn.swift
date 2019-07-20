//
//  SiginIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import Alamofire

class SignIn: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let SigninEndpoint = URL(string: "https://roomy-application.herokuapp.com/auth/login")!

    
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
        
        let signInParameters = ["email": email, "password": password]  as! [String : String]
        connectToSignInAPI(para: signInParameters)
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
    
    func showAlert(message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func connectToSignInAPI(para: [String:String]) {
        AF.request(SigninEndpoint, method: HTTPMethod.post,parameters: para).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                self.performSegue(withIdentifier: "roomsSegue", sender: Any?.self)
            case .failure(let error):
                print(error)
            }
        }
    }
}
