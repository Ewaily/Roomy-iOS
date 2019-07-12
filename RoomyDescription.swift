//
//  RoomyDescription.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class RoomyDescription: UIViewController {
    
    @IBOutlet weak var descriptionPic: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var desc: RoomyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Bookmark Button") ,style: .plain, target: self, action: #selector(bookmarkButton)), animated: true)
        descriptionPic.image = desc?.descriptionPic
        descriptionLabel.text = desc?.descriptionText
    }
    
    func configureDescription (descriptionPic: UIImage, descriptionLabel: String){
        self.descriptionPic.image = descriptionPic
        self.descriptionLabel.text = descriptionLabel
    }
    
    @objc func bookmarkButton () {
        print("Bookmarked!")
    }
}

