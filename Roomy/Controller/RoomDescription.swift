//
//  RoomyDescription.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class RoomDescription: UIViewController {
    
    @IBOutlet private weak var descriptionPic: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    var desc: Room?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Bookmark Button") ,style: .plain, target: self, action: #selector(bookmarkButton)), animated: true)
        descriptionPic.image = desc?.descriptionPic
        descriptionLabel.text = desc?.descriptionText
    }
    
    @objc func bookmarkButton () {
        print("Bookmarked!")
    }
}

