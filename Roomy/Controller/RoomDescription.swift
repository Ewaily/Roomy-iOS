//
//  RoomyDescription.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Kingfisher
import UIKit

class RoomDescription: UIViewController {
    @IBOutlet private var descriptionPic: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    var desc: Room?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Bookmark Button"), style: .plain, target: self, action: #selector(bookmarkButton)), animated: true)
        let imagePlaceholder = UIImage(named: "Placeholder")
        let imageURL = URL(string: desc!.descriptionPicLink)
        descriptionPic.kf.indicatorType = .activity
        descriptionPic.kf.setImage(with: imageURL, placeholder: imagePlaceholder)
        descriptionLabel.text = desc?.descriptionText
    }

    @objc func bookmarkButton() {
        print("Bookmarked!")
    }
}

