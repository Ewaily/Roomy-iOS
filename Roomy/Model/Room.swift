//
//  RoomyData.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import UIKit

class Room: NSObject {
    var address: String = ""
    var city: String = ""
    var price: String = ""
    var bed: Int = 0
    var bath: Int = 0
    var firstPic: UIImage = UIImage(named: "Placeholder")!
    var secondPic: UIImage = UIImage(named: "Placeholder")!
    var thirdPic: UIImage = UIImage(named: "Placeholder")!
    var descriptionText: String = ""
    var descriptionPicLink: URL?
    var descriptionPic: UIImageView = UIImageView()
}
