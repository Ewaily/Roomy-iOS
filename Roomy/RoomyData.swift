//
//  RoomyData.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import UIKit

class RoomyData {
    
    var address: String
    var city: String
    var price: String
    var bed: Int
    var bath: Int
    var firstPic: UIImage
    var secondPic: UIImage
    var thirdPic: UIImage
    
    init(address: String, city: String, price: String, bed: Int, bath: Int, firstPic: UIImage, secondPic: UIImage, thirdPic: UIImage) {
        
        self.address = address
        self.city = city
        self.price = price
        self.bed = bed
        self.bath = bath
        self.firstPic = firstPic
        self.secondPic = secondPic
        self.thirdPic = thirdPic
    }
}