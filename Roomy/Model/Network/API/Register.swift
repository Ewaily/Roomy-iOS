//
//  API.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/21/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Register: NSObject {
    class func register(para: [String: String], completion: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        let SignupEndpoint = URLs.register

        AF.request(SignupEndpoint, method: HTTPMethod.post, parameters: para).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                _ = json["auth_token"].string
                completion(nil, true)
            case .failure(let error):
                completion(error, false)
            }
        }
    }
}
