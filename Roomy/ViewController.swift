//
//  ViewController.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/9/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roomsTableView: UITableView!
    
    
    
    var Rooms: [RoomyData] = []
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let myXibFile = UINib(nibName: "RoomyCell", bundle: nil)
        roomsTableView.register(myXibFile, forCellReuseIdentifier: "roomyCell")
        Rooms = createRoomyData()
    }
    
    
}



func createRoomyData() -> [RoomyData] {
    
    var tempData: [RoomyData] = []
    
    let room1 = RoomyData(address: "35 Pierrepont St #C7", city: "Brooklyn, NY 11236", price: 2500, bed: 2, bath: 1, firstPic: UIImage(named: "Room 1-1")!, secondPic: UIImage(named: "Room 1-2")!, thirdPic: UIImage(named: "Room 1-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 1")!)
    
    let room2 = RoomyData(address: "86 Gerrymain Rd #F3", city: "New York, NY 11253", price: 1250, bed: 1, bath: 1, firstPic: UIImage(named: "Room 2-1")!, secondPic: UIImage(named: "Room 2-2")!, thirdPic: UIImage(named: "Room 2-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 2")!)
    
    let room3 = RoomyData(address: "22 Yonker St #B4", city: "Queens, NY 11539", price: 4200, bed: 1, bath: 1, firstPic: UIImage(named: "Room 3-1")!, secondPic: UIImage(named: "Room 3-2")!, thirdPic: UIImage(named: "Room 3-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 3")!)
    
    let room4 = RoomyData(address: "90 Simmons Rd #M3", city: "Brooklyn, NY 11236", price: 2700, bed: 1, bath: 1, firstPic: UIImage(named: "Room 4-1")!, secondPic: UIImage(named: "Room 4-2")!, thirdPic: UIImage(named: "Room 4-3")!, descriptionText: "Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.", descriptionPic: UIImage(named: "Room 4")!)
    
    
    tempData.append(room1)
    tempData.append(room2)
    tempData.append(room3)
    tempData.append(room4)
    
    return tempData
}
extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let room = Rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomyCell") as! RoomyCell
        cell.configureCell(roomyData: room)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "descriptionSegue", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RoomyDescription {
            destination.desc = Rooms[currentIndex]
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
