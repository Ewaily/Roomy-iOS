////
////  Rooms.swift
////  Roomy
////
////  Created by Muhammad Ewaily on 7/22/19.
////  Copyright © 2019 Muhammad Ewaily. All rights reserved.
////
//
import Foundation
import UIKit
import RealmSwift

class offlineRooms: Object {
    @objc dynamic var id: Int = 100
    @objc dynamic var address: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var bed: Int = 0
    @objc dynamic var bath: Int = 0
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var descriptionPicLink: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func addRoomsToRealm (room: Room){
        let realm = try! Realm()
        try! realm.write {
            let roomRealm = offlineRooms()
            roomRealm.id = room.id
            roomRealm.address = room.address
            roomRealm.city = room.city
            roomRealm.price = room.price
            roomRealm.bed = room.bed
            roomRealm.bath = room.bath
            roomRealm.descriptionText = room.descriptionText
            roomRealm.descriptionPicLink = room.descriptionPicLink
            realm.add(roomRealm, update: .modified)
        }
    }
    
    func readAllRoomsFromRealm() -> Results <offlineRooms>{
        let realm = try! Realm()
        let rooms = realm.objects(offlineRooms.self)
        return rooms
    }
}
