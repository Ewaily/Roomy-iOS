//
//  RoomyCell.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/10/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class RoomyCell: UITableViewCell {

    @IBOutlet private weak var firstLabel: UILabel!
    
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var rommyContentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func confCell (a: String, b: String){
        firstLabel.text = a
        secondLabel.text = b
    }
    
}
