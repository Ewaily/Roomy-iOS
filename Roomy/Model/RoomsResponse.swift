//
//  RoomsResponse.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/20/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import ObjectMapper

class RoomsResponse: Mappable {
    
    var id : Int?
    var title: String?
    var price: String?
    var place: String?
    var image: String?
    var description: String?
    var created_at: String?
    var updated_at: String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        price           <- map["price"]
        place           <- map["place"]
        image           <- map["image"]
        description     <- map["description"]
        created_at      <- map["created_at"]
        updated_at      <- map["iupdated_atd"]
    }
    
    
}
