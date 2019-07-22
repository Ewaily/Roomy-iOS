//
//  API.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/21/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class Login: NSObject {
    class func login(para: [String: String], completion: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        let SigninEndpoint = URLs.login
        AF.request(SigninEndpoint, method: HTTPMethod.post, parameters: para).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Validation Successful")
                let json = JSON(value)
                let auth_token = json["auth_token"].string
                let def = UserDefaults.standard
                def.setValue(auth_token, forKey: "auth_token")
                completion(nil, true)
            case .failure(let error):
                completion(error, false)
                print(error)
            }
        }
    }
}
