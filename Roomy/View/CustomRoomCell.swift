//
//  RoomyCell.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class CustomRoomCell: UITableViewCell {
    @IBOutlet private var rommyContentView: UIView!
    @IBOutlet private var addressLabel: UILabel!
    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var bedLabel: UILabel!
    @IBOutlet private var bathLabel: UILabel!
    @IBOutlet private var firstPic: UIImageView!
    @IBOutlet private var secondPic: UIImageView!
    @IBOutlet private var thirdPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(roomyData: Room) {
        addressLabel.text = roomyData.address
        cityLabel.text = roomyData.city
        priceLabel.text = roomyData.price
        bedLabel.text = String(roomyData.bed) + " bed"
        bathLabel.text = String(roomyData.bath) + " bath"
        firstPic.image = roomyData.firstPic
        secondPic.image = roomyData.secondPic
        thirdPic.image = roomyData.thirdPic
    }
}
