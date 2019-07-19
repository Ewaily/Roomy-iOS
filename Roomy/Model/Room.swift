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

func createRoomyData() -> [Room] {
    var tempData: [Room] = []
    let room1 = Room(address: "35 Pierrepont St #C7", city: "Brooklyn, NY 11236", price: 2500, bed: 2, bath: 1, firstPic: UIImage(named: "Room 1-1")!, secondPic: UIImage(named: "Room 1-2")!, thirdPic: UIImage(named: "Room 1-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 1")!)
    let room2 = Room(address: "86 Gerrymain Rd #F3", city: "New York, NY 11253", price: 1250, bed: 1, bath: 1, firstPic: UIImage(named: "Room 2-1")!, secondPic: UIImage(named: "Room 2-2")!, thirdPic: UIImage(named: "Room 2-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 2")!)
    let room3 = Room(address: "22 Yonker St #B4", city: "Queens, NY 11539", price: 4200, bed: 1, bath: 1, firstPic: UIImage(named: "Room 3-1")!, secondPic: UIImage(named: "Room 3-2")!, thirdPic: UIImage(named: "Room 3-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 3")!)
    let room4 = Room(address: "90 Simmons Rd #M3", city: "Brooklyn, NY 11236", price: 2700, bed: 1, bath: 1, firstPic: UIImage(named: "Room 4-1")!, secondPic: UIImage(named: "Room 4-2")!, thirdPic: UIImage(named: "Room 4-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 4")!)
    
    tempData.append(room1)
    tempData.append(room2)
    tempData.append(room3)
    tempData.append(room4)
    
    return tempData
}
