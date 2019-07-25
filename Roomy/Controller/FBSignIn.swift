//
//  FBSignIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FBSignIn: UIViewController, LoginButtonDelegate {

    
    
    let loginButton: FBLoginButton = {
        let button = FBLoginButton()
        button.permissions = ["email"]
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
//        if let token = AccessToken.current {
//            fetchProfile()
//        }
    }
    
    func fetchProfile() {
        print("Fetch profile")
        print(AccessToken.current)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Completed login")
        fetchProfile()
    }
}
