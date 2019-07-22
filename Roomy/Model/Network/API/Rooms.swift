//
//  API.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/21/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Alamofire
import Kingfisher
import SwiftyJSON
import UIKit

class GetRooms: NSObject {
    class func getRoomsFromBackend(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard let auth_token = UserDefaults.standard.object(forKey: "auth_token") as? String else {
            completion(nil, nil)
            return
        }
        
        let roomsEndpoint = URLs.rooms
        let headers: HTTPHeaders = ["Authorization": auth_token]
        
        AF.request(roomsEndpoint, method: HTTPMethod.get, parameters: nil, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
                
            case .success(let value):
                guard let json = JSON(value).array else {
                    completion(nil, nil)
                    return
                }
                
                var rooms = [Room]()
                for data in json {
                    guard let data = data.dictionary else {
                        return
                    }
                    let room = Room()
                    room.descriptionText = data["description"]?.string ?? ""
                    room.price = data["price"]?.string ?? "0$"
                    room.address = data["title"]?.string ?? "title"
                    room.city = data["place"]?.string ?? "place"
                    room.descriptionPicLink = URL(string: data["image"]?.string ?? " ")
                    
                    rooms.append(room)
                }
                
                completion(nil, rooms)
            }
        }
    }
    
    class func getRoomsFromRealm(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard let auth_token = UserDefaults.standard.object(forKey: "auth_token") as? String else {
            completion(nil, nil)
            return
        }
        
        let roomsEndpoint = URLs.rooms
        let headers: HTTPHeaders = [
            "Authorization": auth_token
        ]
        
        AF.request(roomsEndpoint, method: HTTPMethod.get, parameters: nil, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
                
            case .success(let value):
                guard let json = JSON(value).array else {
                    completion(nil, nil)
                    return
                }
                
                var rooms = [Room]()
                for data in json {
                    guard let data = data.dictionary else {
                        return
                    }
                    let room = Room()
                    room.descriptionText = data["description"]?.string ?? ""
                    room.price = data["price"]?.string ?? "0$"
                    room.address = data["title"]?.string ?? "title"
                    room.city = data["place"]?.string ?? "place"
                    room.id = data["id"]?.int ?? 0
                    room.descriptionPicLink = URL(string: data["image"]?.string ?? " ")
                    
                    rooms.append(room)
                }
                
                completion(nil, rooms)
            }
        }
    }
}
