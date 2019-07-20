//
//  SignUp.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/19/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import Alamofire

class SignUp: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let SignupEndpoint = URL(string: "https://roomy-application.herokuapp.com/signup")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        print("g")
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
        
        let signUpParameters = ["name": name, "email": email, "password": password] as! [String : String]
        connectToSignUpAPI(para: signUpParameters)
    }
    
    func connectToSignUpAPI(para: [String:String]) {
        AF.request(SignupEndpoint, method: HTTPMethod.post,parameters: para).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showAlert(message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
