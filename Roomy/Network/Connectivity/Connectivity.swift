//
//  Connectivity.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/22/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
