//
//  RoomyCell.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class CustomRoomCell: UITableViewCell {

    @IBOutlet private weak var rommyContentView: UIView!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var bedLabel: UILabel!
    @IBOutlet private weak var bathLabel: UILabel!
    @IBOutlet private weak var firstPic: UIImageView!
    @IBOutlet private weak var secondPic: UIImageView!
    @IBOutlet private weak var thirdPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell (roomyData: Room){
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
