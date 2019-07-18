//
//  SiginIn.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class SignIn: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
