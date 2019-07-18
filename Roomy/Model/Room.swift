//
//  RoomyData.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import UIKit

class Room {
    
    var address: String
    var city: String
    var price: String
    var bed: Int
    var bath: Int
    var firstPic: UIImage
    var secondPic: UIImage
    var thirdPic: UIImage
    var descriptionText: String
    var descriptionPic: UIImage
    
    init(address: String, city: String, price: Double, bed: Int, bath: Int, firstPic: UIImage, secondPic: UIImage, thirdPic: UIImage, descriptionText: String, descriptionPic: UIImage) {
        self.address = address
        self.city = city
        self.price = Room.convertDoubleToCurrency(amount: price)
        self.bed = bed
        self.bath = bath
        self.firstPic = firstPic
        self.secondPic = secondPic
        self.thirdPic = thirdPic
        self.descriptionText = descriptionText
        self.descriptionPic = descriptionPic
    }
    
    static private func convertDoubleToCurrency (amount: Double) -> String {
        let numberFormatter = NumberFormatter ()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
}
