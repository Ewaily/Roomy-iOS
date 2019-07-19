//
//  ViewController.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/9/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class RoomsTableView: UIViewController {
    
    @IBOutlet weak var roomsTableView: UITableView!
    var Rooms: [Room] = []
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

extension RoomsTableView: UITableViewDelegate{
    
}

extension RoomsTableView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = Rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomyCell") as! CustomRoomCell
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
        if let destination = segue.destination as? RoomDescription {
            destination.desc = Rooms[currentIndex]
        }
    }
}

extension RoomsTableView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
